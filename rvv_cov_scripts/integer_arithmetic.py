import argparse
import re
import sys
import os
import pdb
import csv
import pandas as pd
from tabulate import tabulate
from lib import *

class VectorInsn(object):
    vlen = 256

    def __init__(self, line):
        segs = line.split()
        self.name = segs[0]
        self.variants = [variants.get(x, Variant.ILLEGAL) for x in segs[1].split(',')]
        self.category = Category[segs[2]]
        self.style = Style[segs[3]]
        self.csr_read = []
        self.csr_write = []
        if len(segs) >= 5:
            self.csr_read = [CSR[x] for x in segs[4].split(',')]
        if len(segs) >= 6:
            self.csr_write = [CSR[x] for x in segs[5].split(',')]
        
        # initialize legal lmul and sew based on variant and style
        self.lmul = [2**x for x in range(-3,4)]
        self.sew = [2**x for x in range(3,7)]
        if self.style == Style.WIDENING or self.style == Style.NARROWING:
            self.lmul.remove(8)
            self.sew.remove(64)
        if self.style == Style.EXTENSION:
            self.lmul.remove(0.125)
            self.sew.remove(8)
            if self.variant == Variant.VF4 or self.variant == Variant.VF8:
                self.lmul.remove(0.25)
                self.sew.remove(16)
            if self.variant == Variant.VF8:
                self.lmul.remove(0.5)
                self.sew.remove(32)

        # Initialize vm related attributes    
        if self.style in (Style.SUM_W_CARRY, Style.DIFF_W_BORROW):
            if self.variant in  (Variant.VVM, Variant.VXM, Variant.VIM):
                self.vm_mask = Vm_Mask.VM_NONMASK
            elif self.variant in (Variant.VV, Variant.VX, Variant.VI):
                self.vm_mask = VM_NONE
        else:
            self.vm_mask = Vm_Mask.VM_MASK

        if self.vm_mask == Vm_Mask.VM_MASK:
            self.vm_vma_feature = [Vm_Vma_Feature.VM_0_VMA, Vm_Vma_Feature.VM_1]
        elif self.vm_mask == Vm_Mask.VM_NONMASK:
            self.vm_vma_feature = [Vm_Vma_Feature.VM_0, Vm_Vma_Feature.VM_1]
        elif self.vm_mask == Vm_Mask.VM_NONE:
            self.vm_vma_feature = []
        else:
            pass


        # Initialize operands for each variant
        self.src_operands = {}
        self.dst_operands = {}
        for variant in self.variants:
            if variant == Variant.VV:
                if self.style == Style.NORMAL:
                    if self.vm_mask == Vm_Mask.VM_MASK:
                        self.dst_operands[Variant.VV] = {}
                        self.dst_operands[Variant.VV][Vm_Vma_Feature.VM_1] = (VectorOp(Factor.X1, Factor.X1, 'VD'),)
                        self.dst_operands[Variant.VV][Vm_Vma_Feature.VM_0_VMA] = (VectorOp(Factor.X1, Factor.X1, 'VD'),)
                        self.src_operands[Variant.VV] = {}
                        self.src_operands[Variant.VV][Vm_Vma_Feature.VM_1] = (VectorOp(Factor.X1, Factor.X1, 'VS2'), VectorOp(Factor.X1, Factor.X1, 'VS1'))
                        self.src_operands[Variant.VV][Vm_Vma_Feature.VM_0_VMA] = (VectorOp(Factor.X1, Factor.X1, 'VS2'), VectorOp(Factor.X1, Factor.X1, 'VS1'), VectorOp(Factor.VALUE_1, Factor.VALUE_1, 'V0.t'))
                elif self.style == Style.WIDENING:
                    self.dst_operands.append((VectorOp(Factor.X2, Factor.X2),))
                    self.src_operands.append((VectorOp(Factor.X2, Factor.X2), VectorOp(Factor.X2, Factor.X2)))
                elif self.style == Style.SUM_W_CARRY or self.style == Style.DIFF_W_BORROW: # VMADC, VMSBC
                    self.dst_operands.append((VectorOp(Factor.VALUE_1, Factor.VALUE_1),))
                    self.src_operands.append((VectorOp(Factor.X1, Factor.X1), VectorOp(Factor.X1, Factor.X1)))
                else:
                    printf("Error in initialize operands for VV variant.")
                    sys.exit(-1)
            if variant == Variant.VX:
                if self.style == Style.NORMAL:
                    if self.vm_mask == Vm_Mask.VM_MASK:
                        self.dst_operands[Variant.VX] = {}
                        self.dst_operands[Variant.VX][Vm_Vma_Feature.VM_1] = (VectorOp(Factor.X1, Factor.X1, 'VD'),)
                        self.dst_operands[Variant.VX][Vm_Vma_Feature.VM_0_VMA] = (VectorOp(Factor.X1, Factor.X1, 'VD'),)
                        self.src_operands[Variant.VX] = {}
                        self.src_operands[Variant.VX][Vm_Vma_Feature.VM_1] = (VectorOp(Factor.X1, Factor.X1, 'VS2'), IntOp('RS1'))
                        self.src_operands[Variant.VX][Vm_Vma_Feature.VM_0_VMA] = (VectorOp(Factor.X1, Factor.X1, 'VS2'), IntOp('RS1'), VectorOp(Factor.VALUE_1, Factor.VALUE_1, 'V0.t'))
                elif self.style == Style.WIDENING:
                    self.dst_operands.append((VectorOp(Factor.X2, Factor.X2),))
                    self.src_operands.append((VectorOp(Factor.X1, Factor.X1), IntOp()))
                elif self.style == Style.SUM_W_CARRY or self.style == Style.DIFF_W_BORROW: # VMADC, VMSBC
                    self.dst_operands.append((VectorOp(Factor.VALUE_1, Factor.VALUE_1),))
                    self.src_operands.append((VectorOp(Factor.X1, Factor.X1), VectorOp(Factor.X1, Factor.X1)))
                else:
                    printf("Error in initialize operands for VX variant.")
                    sys.exit(-1)
            if variant == Variant.VI:
                if self.style == Style.NORMAL:
                    if self.vm_mask == Vm_Mask.VM_MASK:
                        self.dst_operands[Variant.VI] = {}
                        self.dst_operands[Variant.VI][Vm_Vma_Feature.VM_1] = (VectorOp(Factor.X1, Factor.X1, 'VD'),)
                        self.dst_operands[Variant.VI][Vm_Vma_Feature.VM_0_VMA] = (VectorOp(Factor.X1, Factor.X1, 'VD'),)
                        self.src_operands[Variant.VI] = {}
                        self.src_operands[Variant.VI][Vm_Vma_Feature.VM_1] = (VectorOp(Factor.X1, Factor.X1, 'VS2'), Imm5Op('Imm'))
                        self.src_operands[Variant.VI][Vm_Vma_Feature.VM_0_VMA] = (VectorOp(Factor.X1, Factor.X1, 'VS2'), Imm5Op('Imm'), VectorOp(Factor.VALUE_1, Factor.VALUE_1, 'V0.t'))
                elif self.style == Style.SUM_W_CARRY: # VMADC
                    self.dst_operands.append((VectorOp(Factor.VALUE_1, Factor.VALUE_1),))
                    self.src_operands.append((VectorOp(Factor.X1, Factor.X1), Imm5Op()))
                else:
                    printf("Error in initialize operands for VI variant.")
                    sys.exit(-1)
            if variant == Variant.VF2 or variant == Variant.VF4 or variant == Variant.VF8:
                    extFactor = 'X' + str(1/int(variant[-1])).replace('.', '_')
                    dst_operands.append((VectorOp(Factor.X1, Factor.X1),))
                    src_operands.append((VectorOp(Factor[extFactor], Factor[extFactor]),))

    def format_table(self):
        nRows = len(self.variants) * len(self.vm_vma_feature)
        res = []
        for i in range(nRows):
            # Category, Name, Style, CSR read, CSR write, lmul, sew
            if i == 0:
                row = [self.category.name,
                    self.name,
                    self.style.name,
                    ','.join([str(x) for x in self.lmul]),
                    ','.join([str(x) for x in self.sew]),
                    ','.join([x.name for x in self.csr_read]) + '\nget_vl(lmul, sew)',
                    ','.join([x.name for x in self.csr_write])] 
            else:
                row = [ "",
                    "",
                    "",
                    "",
                    "", 
                    "",
                    ""]
            # Variants
            if i % len(self.vm_vma_feature) == 0:
                row.append(self.variants[i // len(self.vm_vma_feature)].name)
            else:
                row.append("")
            # VM_MTA
            row.append(vm_vma_feature_str[self.vm_vma_feature[i % len(self.vm_vma_feature)]])
            # Operands
            # pdb.set_trace()
            row.append(','.join([str(x) for x in self.dst_operands[self.variants[i // len(self.vm_vma_feature)]][self.vm_vma_feature[i % len(self.vm_vma_feature)]]])
                + "\nget_dst_regs(variant, lmul, sew, vm_vma_feature)")
            row.append(','.join([str(x) for x in self.src_operands[self.variants[i // len(self.vm_vma_feature)]][self.vm_vma_feature[i % len(self.vm_vma_feature)]]])
                + "\nget_src_regs(variant, lmul, sew, vm_vma_feature)")
            res.append(row)
        return res

    def get_dst_regs(self, variant, lmul, sew, vm_vma_feature):
        dst_reg = self.dst_operands[variant][vm_vma_feature]
        for reg in dst_reg:
            if isinstance(reg, VectorOp):
                if reg.emul_factor != Factor.VALUE_1:
                    emul = lmul * factors_num[reg.emul_factor]
                else:
                    emul = 1
                stride = 1 if emul < 1 else emul
                idx_list = list(range(0, 32, stride))
                if vm_vma_feature in (Vm_Vma_Feature.VM_0, Vm_Vma_Feature.VM_0_VMA):
                    idx_list.remove(0)
                return {reg.name : ['V' + str(x) for x in idx_list]}
            if isinstance(reg, IntOp):
                idx_list = list(range(32))
                return {reg.name : ['X' + str(x) for x in idx_list]}

    def get_src_regs(self, variant, lmul, sew, vm_vma_feature):
        src_reg = self.src_operands[variant][vm_vma_feature]
        res = {}
        for reg in src_reg:
            if isinstance(reg, VectorOp):
                if reg.emul_factor != Factor.VALUE_1:
                    emul = lmul * factors_num[reg.emul_factor]
                else:
                    res[reg.name] = ['V0']
                    continue
                stride = 1 if emul < 1 else emul
                idx_list = list(range(0, 32, stride))
                res[reg.name] = ['V' + str(x) for x in idx_list]
            if isinstance(reg, IntOp):
                idx_list = list(range(32))
                res[reg.name] = ['X' + str(x) for x in idx_list]
            if isinstance(reg, Imm5Op):
                res[reg.name] = ["Imm5"]
        return res

    def get_ignore_bins(self, variant, lmul, sew, vm_vma_feature):
        src_reg = self.src_operands[variant][vm_vma_feature]
        dst_reg = self.dst_operands[variant][vm_vma_feature][0]
        if dst_reg.emul_factor != Factor.VALUE_1:
            dst_emul = lmul * factors_num[dst_reg.emul_factor]
            dst_eew = sew * factors_num[dst_reg.eew_factor]
            stride = 1 if emul < 1 else emul
            dst_idx_list = list(range(0, 32, stride))
        else:
            dst_emul = 1
            dst_eew = 1
            dst_idx_list = [0]
        res = {}
        for reg in src_reg:
            if isinstance(reg, VectorOp) and reg.emul_factor != Factor.VALUE_1:
                emul = lmul * factors_num[reg.emul_factor]
                eew = sew * factors_num[reg.eew_factor]
                stride = 1 if emul < 1 else emul
                src_idx_list = list(range(0, 32, stride))
                if dst_eew > eew:
                    if emul < 1:
                        res[reg.name] = ['{} == {}'.format(reg.name, dst_reg.name)]
                    else:
                        res[reg.name] = ['{}' == '{} + {}'.format(reg.name, dst_reg.name, str(x * lmul)) for x in range(dst_emul / emul - 1)]
                elif dst_eew < eew:
                    res[reg.name] = ['{}' == '{} + {}'.format(dst_reg.name, reg.name, str(x * lmul)) for x in range(1, emul / dst_emul)]
                        
        return res

    def get_vl(self, lmul, sew):
        vlmax = int(self.vlen * lmul / sew)
        return str(list(range(vlmax + 1)))


def main():
    # Parse input arguments
    parser = argparse.ArgumentParser()
    parser.add_argument("--insn_file", type=str, help="Input vector instruction file")
    args = parser.parse_args()
    insn_list = []
    headers = ["Category", "Instruction", "Style", "LMUL", "SEW", "CSR read", "CSR write", "Variant","VM VMA", 
        "Dst Operand", "Src Operand"]
    with open(args.insn_file, "r") as fd:
        for line in fd:
            insn_list.append(VectorInsn(line))
    table_data = []
    for insn in insn_list:
        table_data += insn.format_table()
    print(tabulate(table_data, headers, tablefmt="grid"))
    
    with open("rvv_insn.csv", 'w') as csv_fd:
        csv_writer = csv.writer(csv_fd, delimiter = ';')
        csv_writer.writerow(headers)
        for row in table_data:
            csv_writer.writerow(row)
    pd.read_csv("rvv_insn.csv", delimiter=';').to_excel("rvv_insn.xlsx", index=False)
        

    print(insn_list[0].get_src_regs(Variant.VV, 4, 32, Vm_Vma_Feature.VM_0_VMA))
    print(insn_list[0].get_vl(4, 32))

if __name__ == "__main__":
    main()
