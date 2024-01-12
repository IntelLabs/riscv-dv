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
        self.lmul = {}
        self.sew = {}
        for variant in self.variants:
            self.lmul[variant] = [2**x for x in range(-3,4)]
            self.sew[variant] = [2**x for x in range(3,7)]
            # vzext, vsext
            if self.style == Style.EXTENSION:
                self.lmul[variant].remove(0.125)
                self.sew[variant].remove(8)
                if variant in (Variant.VF4, Variant.VF8):
                    self.lmul[variant].remove(0.25)
                    self.sew[variant].remove(16)
                if variant == Variant.VF8:
                    self.lmul[variant].remove(0.5)
                    self.sew[variant].remove(32)    
            if self.style == Style.WIDENING or self.style == Style.NARROWING:
                self.lmul[variant].remove(8)
                self.sew[variant].remove(64)

        # Initialize vm related attributes    
        self.vm_mask = {}
        if self.style in (Style.SUM_W_CARRY, Style.DIFF_W_BORROW, Style.MERGE, Style.MOVE):
            for variant in self.variants:
                # vadc/vsbc, and vmadc/vmsbc when vm == 0; vmerge
                if variant in (Variant.VVM, Variant.VXM, Variant.VIM):
                    self.vm_mask[variant] = Vm_Mask.VM_NONMASK_ONLY_0
                # vmadc/vmsbc when vm == 1; vmv
                elif variant in (Variant.VV, Variant.VX, Variant.VI, Variant.V_V, Variant.V_X, Variant.V_I):
                    self.vm_mask[variant] = Vm_Mask.VM_NONMASK_ONLY_1
        else:
            for variant in self.variants:
                self.vm_mask[variant] = Vm_Mask.VM_MASK

        self.vm_vma_feature = {}
        for k,v in self.vm_mask.items():
            if v == Vm_Mask.VM_MASK:
                self.vm_vma_feature[k] = [Vm_Vma_Feature.VM_0_VMA, Vm_Vma_Feature.VM_1]
            elif v == Vm_Mask.VM_NONMASK_ONLY_0:
                self.vm_vma_feature[k] = [Vm_Vma_Feature.VM_0]
            elif v == Vm_Mask.VM_NONMASK_ONLY_1:
                self.vm_vma_feature[k] = [Vm_Vma_Feature.VM_1]
            else:
                pass


        # Initialize operands for each variant
        self.dst_operands = {}
        self.src_operands = {}
        for variant in self.variants:
            if variant == Variant.VV:
                if self.style == Style.NORMAL:
                    assert self.vm_mask[Variant.VV] == Vm_Mask.VM_MASK, "Assume VM_MASK for VV variant and NORMAL style"
                    self.dst_operands[Variant.VV] = {}
                    self.dst_operands[Variant.VV][Vm_Vma_Feature.VM_1] = (VectorOp(Factor.X1, Factor.X1, 'VD'),)
                    self.dst_operands[Variant.VV][Vm_Vma_Feature.VM_0_VMA] = (VectorOp(Factor.X1, Factor.X1, 'VD'),)
                    self.src_operands[Variant.VV] = {}
                    self.src_operands[Variant.VV][Vm_Vma_Feature.VM_1] = (VectorOp(Factor.X1, Factor.X1, 'VS2'), VectorOp(Factor.X1, Factor.X1, 'VS1'))
                    self.src_operands[Variant.VV][Vm_Vma_Feature.VM_0_VMA] = (VectorOp(Factor.X1, Factor.X1, 'VS2'), VectorOp(Factor.X1, Factor.X1, 'VS1'), VectorOp(Factor.VALUE_1, Factor.VALUE_1, 'V0.t'))
                elif self.style == Style.WIDENING:
                    assert self.vm_mask[Variant.VV] == Vm_Mask.VM_MASK, "Assume VM_MASK for VV variant and WIDENING style"
                    self.dst_operands[Variant.VV] = {}
                    self.dst_operands[Variant.VV][Vm_Vma_Feature.VM_1] = (VectorOp(Factor.X2, Factor.X2, 'VD'),)
                    self.dst_operands[Variant.VV][Vm_Vma_Feature.VM_0_VMA] = (VectorOp(Factor.X2, Factor.X2, 'VD'),)
                    self.src_operands[Variant.VV] = {}
                    self.src_operands[Variant.VV][Vm_Vma_Feature.VM_1] = (VectorOp(Factor.X1, Factor.X1, 'VS2'), VectorOp(Factor.X1, Factor.X1, 'VS1'))
                    self.src_operands[Variant.VV][Vm_Vma_Feature.VM_0_VMA] = (VectorOp(Factor.X1, Factor.X1, 'VS2'), VectorOp(Factor.X1, Factor.X1, 'VS1'), VectorOp(Factor.VALUE_1, Factor.VALUE_1, 'V0.t'))
                elif self.style in (Style.SUM_W_CARRY, Style.DIFF_W_BORROW): # VMADC, VMSBC
                    self.dst_operands[Variant.VV] = {}
                    self.dst_operands[Variant.VV][Vm_Vma_Feature.VM_1] = (VectorOp(Factor.VALUE_1, Factor.VALUE_1, 'VD'),)
                    self.dst_operands[Variant.VV][Vm_Vma_Feature.VM_0] = (VectorOp(Factor.VALUE_1, Factor.VALUE_1, 'VD'),)
                    self.src_operands[Variant.VV] = {}
                    self.src_operands[Variant.VV][Vm_Vma_Feature.VM_1] = (VectorOp(Factor.X1, Factor.X1, 'VS2'), VectorOp(Factor.X1, Factor.X1, 'VS1'))
                    self.src_operands[Variant.VV][Vm_Vma_Feature.VM_0] = ((VectorOp(Factor.X1, Factor.X1, 'VS2'), VectorOp(Factor.X1, Factor.X1, 'VS1'), VectorOp(Factor.VALUE_1, Factor.VALUE_1, 'V0')))
                elif self.style == Style.COMPARE:
                    self.dst_operands[Variant.VV] = {}
                    self.dst_operands[Variant.VV][Vm_Vma_Feature.VM_1] = (VectorOp(Factor.VALUE_1, Factor.VALUE_1, 'VD'),)
                    self.dst_operands[Variant.VV][Vm_Vma_Feature.VM_0_VMA] = (VectorOp(Factor.VALUE_1, Factor.VALUE_1, 'VD'),)
                    self.src_operands[Variant.VV] = {}
                    self.src_operands[Variant.VV][Vm_Vma_Feature.VM_1] = (VectorOp(Factor.X1, Factor.X1, 'VS2'), VectorOp(Factor.X1, Factor.X1, 'VS1'))
                    self.src_operands[Variant.VV][Vm_Vma_Feature.VM_0_VMA] = ((VectorOp(Factor.X1, Factor.X1, 'VS2'), VectorOp(Factor.X1, Factor.X1, 'VS1'), VectorOp(Factor.VALUE_1, Factor.VALUE_1, 'V0')))
                else:
                    print("Error in initialize operands for VV variant.")
                    sys.exit(-1)
            elif variant == Variant.VX:
                if self.style == Style.NORMAL:
                    assert self.vm_mask[Variant.VX] == Vm_Mask.VM_MASK, "Assume VM_MASK for VX variant and NORMAL style"
                    self.dst_operands[Variant.VX] = {}
                    self.dst_operands[Variant.VX][Vm_Vma_Feature.VM_1] = (VectorOp(Factor.X1, Factor.X1, 'VD'),)
                    self.dst_operands[Variant.VX][Vm_Vma_Feature.VM_0_VMA] = (VectorOp(Factor.X1, Factor.X1, 'VD'),)
                    self.src_operands[Variant.VX] = {}
                    self.src_operands[Variant.VX][Vm_Vma_Feature.VM_1] = (VectorOp(Factor.X1, Factor.X1, 'VS2'), IntOp('RS1'))
                    self.src_operands[Variant.VX][Vm_Vma_Feature.VM_0_VMA] = (VectorOp(Factor.X1, Factor.X1, 'VS2'), IntOp('RS1'), VectorOp(Factor.VALUE_1, Factor.VALUE_1, 'V0.t'))
                elif self.style == Style.WIDENING:
                    assert self.vm_mask[Variant.VX] == Vm_Mask.VM_MASK, "Assume VM_MASK for VX variant and WIDENING style"
                    self.dst_operands[Variant.VX] = {}
                    self.dst_operands[Variant.VX][Vm_Vma_Feature.VM_1] = (VectorOp(Factor.X2, Factor.X2, 'VD'),)
                    self.dst_operands[Variant.VX][Vm_Vma_Feature.VM_0_VMA] = (VectorOp(Factor.X2, Factor.X2, 'VD'),)
                    self.src_operands[Variant.VX] = {}
                    self.src_operands[Variant.VX][Vm_Vma_Feature.VM_1] = (VectorOp(Factor.X1, Factor.X1, 'VS2'), IntOp('RS1'))
                    self.src_operands[Variant.VX][Vm_Vma_Feature.VM_0_VMA] = (VectorOp(Factor.X1, Factor.X1, 'VS2'), IntOp('RS1'), VectorOp(Factor.VALUE_1, Factor.VALUE_1, 'V0.t'))
                elif self.style in (Style.SUM_W_CARRY, Style.DIFF_W_BORROW): # VMADC, VMSBC
                    self.dst_operands[Variant.VX] = {}
                    self.dst_operands[Variant.VX][Vm_Vma_Feature.VM_1] = (VectorOp(Factor.VALUE_1, Factor.VALUE_1, 'VD'),)
                    self.dst_operands[Variant.VX][Vm_Vma_Feature.VM_0] = (VectorOp(Factor.VALUE_1, Factor.VALUE_1, 'VD'),)
                    self.src_operands[Variant.VX] = {}
                    self.src_operands[Variant.VX][Vm_Vma_Feature.VM_1] = (VectorOp(Factor.X1, Factor.X1, 'VS2'), IntOp('RS1'))
                    self.src_operands[Variant.VX][Vm_Vma_Feature.VM_0] = ((VectorOp(Factor.X1, Factor.X1, 'VS2'), IntOp('RS1'), VectorOp(Factor.VALUE_1, Factor.VALUE_1, 'V0')))
                elif self.style == Style.COMPARE:
                    self.dst_operands[Variant.VX] = {}
                    self.dst_operands[Variant.VX][Vm_Vma_Feature.VM_1] = (VectorOp(Factor.VALUE_1, Factor.VALUE_1, 'VD'),)
                    self.dst_operands[Variant.VX][Vm_Vma_Feature.VM_0_VMA] = (VectorOp(Factor.VALUE_1, Factor.VALUE_1, 'VD'),)
                    self.src_operands[Variant.VX] = {}
                    self.src_operands[Variant.VX][Vm_Vma_Feature.VM_1] = (VectorOp(Factor.X1, Factor.X1, 'VS2'), IntOp('RS1'))
                    self.src_operands[Variant.VX][Vm_Vma_Feature.VM_0_VMA] = ((VectorOp(Factor.X1, Factor.X1, 'VS2'), IntOp('RS1'), VectorOp(Factor.VALUE_1, Factor.VALUE_1, 'V0')))
                else:
                    print("Error in initialize operands for VX variant.")
                    sys.exit(-1)
            elif variant == Variant.VI:
                if self.style == Style.NORMAL:
                    assert self.vm_mask[Variant.VI] == Vm_Mask.VM_MASK, "Assume VM_MASK for VI variant and NORMAL style"
                    self.dst_operands[Variant.VI] = {}
                    self.dst_operands[Variant.VI][Vm_Vma_Feature.VM_1] = (VectorOp(Factor.X1, Factor.X1, 'VD'),)
                    self.dst_operands[Variant.VI][Vm_Vma_Feature.VM_0_VMA] = (VectorOp(Factor.X1, Factor.X1, 'VD'),)
                    self.src_operands[Variant.VI] = {}
                    self.src_operands[Variant.VI][Vm_Vma_Feature.VM_1] = (VectorOp(Factor.X1, Factor.X1, 'VS2'), Imm5Op('Imm'))
                    self.src_operands[Variant.VI][Vm_Vma_Feature.VM_0_VMA] = (VectorOp(Factor.X1, Factor.X1, 'VS2'), Imm5Op('Imm'), VectorOp(Factor.VALUE_1, Factor.VALUE_1, 'V0.t'))
                elif self.style == Style.SUM_W_CARRY: # VMADC
                    self.dst_operands[Variant.VI] = {}
                    self.dst_operands[Variant.VI][Vm_Vma_Feature.VM_1] = (VectorOp(Factor.VALUE_1, Factor.VALUE_1, 'VD'),)
                    self.dst_operands[Variant.VI][Vm_Vma_Feature.VM_0] = (VectorOp(Factor.VALUE_1, Factor.VALUE_1, 'VD'),)
                    self.src_operands[Variant.VI] = {}
                    self.src_operands[Variant.VI][Vm_Vma_Feature.VM_1] = (VectorOp(Factor.X1, Factor.X1, 'VS2'), Imm5Op('Imm'))
                    self.src_operands[Variant.VI][Vm_Vma_Feature.VM_0] = ((VectorOp(Factor.X1, Factor.X1, 'VS2'), Imm5Op('Imm'), VectorOp(Factor.VALUE_1, Factor.VALUE_1, 'V0')))
                elif self.style == Style.COMPARE:
                    self.dst_operands[Variant.VI] = {}
                    self.dst_operands[Variant.VI][Vm_Vma_Feature.VM_1] = (VectorOp(Factor.VALUE_1, Factor.VALUE_1, 'VD'),)
                    self.dst_operands[Variant.VI][Vm_Vma_Feature.VM_0_VMA] = (VectorOp(Factor.VALUE_1, Factor.VALUE_1, 'VD'),)
                    self.src_operands[Variant.VI] = {}
                    self.src_operands[Variant.VI][Vm_Vma_Feature.VM_1] = (VectorOp(Factor.X1, Factor.X1, 'VS2'), Imm5Op('Imm'))
                    self.src_operands[Variant.VI][Vm_Vma_Feature.VM_0_VMA] = ((VectorOp(Factor.X1, Factor.X1, 'VS2'), Imm5Op('Imm'), VectorOp(Factor.VALUE_1, Factor.VALUE_1, 'V0')))
                else:
                    print("Error in initialize operands for VI variant.")
                    sys.exit(-1)
            elif variant == Variant.WV:
                if self.style == Style.WIDENING:
                    assert self.vm_mask[Variant.WV] == Vm_Mask.VM_MASK, "Assume VM_MASK for WV variant"
                    self.dst_operands[Variant.WV] = {}
                    self.dst_operands[Variant.WV][Vm_Vma_Feature.VM_1] = (VectorOp(Factor.X2, Factor.X2, 'VD'),)
                    self.dst_operands[Variant.WV][Vm_Vma_Feature.VM_0_VMA] = (VectorOp(Factor.X2, Factor.X2, 'VD'),)
                    self.src_operands[Variant.WV] = {}
                    self.src_operands[Variant.WV][Vm_Vma_Feature.VM_1] = (VectorOp(Factor.X2, Factor.X2, 'VS2'), VectorOp(Factor.X1, Factor.X1, 'VS1'))
                    self.src_operands[Variant.WV][Vm_Vma_Feature.VM_0_VMA] = (VectorOp(Factor.X2, Factor.X2, 'VS2'), VectorOp(Factor.X1, Factor.X1, 'VS1'), VectorOp(Factor.VALUE_1, Factor.VALUE_1, 'V0.t'))
                elif self.style == Style.NARROWING:
                    assert self.vm_mask[Variant.WV] == Vm_Mask.VM_MASK, "Assume VM_MASK for WV variant"
                    self.dst_operands[Variant.WV] = {}
                    self.dst_operands[Variant.WV][Vm_Vma_Feature.VM_1] = (VectorOp(Factor.X1, Factor.X1, 'VD'),)
                    self.dst_operands[Variant.WV][Vm_Vma_Feature.VM_0_VMA] = (VectorOp(Factor.X1, Factor.X1, 'VD'),)
                    self.src_operands[Variant.WV] = {}
                    self.src_operands[Variant.WV][Vm_Vma_Feature.VM_1] = (VectorOp(Factor.X2, Factor.X2, 'VS2'), VectorOp(Factor.X1, Factor.X1, 'VS1'))
                    self.src_operands[Variant.WV][Vm_Vma_Feature.VM_0_VMA] = (VectorOp(Factor.X2, Factor.X2, 'VS2'), VectorOp(Factor.X1, Factor.X1, 'VS1'), VectorOp(Factor.VALUE_1, Factor.VALUE_1, 'V0.t'))
                else:
                    print("Error in initialize operands for WV variant.")
                    sys.exit(-1)
            elif variant == Variant.WX:
                if self.style == Style.WIDENING:
                    assert self.vm_mask[Variant.WX] == Vm_Mask.VM_MASK, "Assume VM_MASK for WX variant"
                    self.dst_operands[Variant.WX] = {}
                    self.dst_operands[Variant.WX][Vm_Vma_Feature.VM_1] = (VectorOp(Factor.X2, Factor.X2, 'VD'),)
                    self.dst_operands[Variant.WX][Vm_Vma_Feature.VM_0_VMA] = (VectorOp(Factor.X2, Factor.X2, 'VD'),)
                    self.src_operands[Variant.WX] = {}
                    self.src_operands[Variant.WX][Vm_Vma_Feature.VM_1] = (VectorOp(Factor.X2, Factor.X2, 'VS2'), IntOp('RS1'))
                    self.src_operands[Variant.WX][Vm_Vma_Feature.VM_0_VMA] = (VectorOp(Factor.X2, Factor.X2, 'VS2'), IntOp('RS1'), VectorOp(Factor.VALUE_1, Factor.VALUE_1, 'V0.t'))
                elif self.style == Style.NARROWING:
                    assert self.vm_mask[Variant.WX] == Vm_Mask.VM_MASK, "Assume VM_MASK for WX variant"
                    self.dst_operands[Variant.WX] = {}
                    self.dst_operands[Variant.WX][Vm_Vma_Feature.VM_1] = (VectorOp(Factor.X1, Factor.X1, 'VD'),)
                    self.dst_operands[Variant.WX][Vm_Vma_Feature.VM_0_VMA] = (VectorOp(Factor.X1, Factor.X1, 'VD'),)
                    self.src_operands[Variant.WX] = {}
                    self.src_operands[Variant.WX][Vm_Vma_Feature.VM_1] = (VectorOp(Factor.X2, Factor.X2, 'VS2'), IntOp('RS1'))
                    self.src_operands[Variant.WX][Vm_Vma_Feature.VM_0_VMA] = (VectorOp(Factor.X2, Factor.X2, 'VS2'), IntOp('RS1'), VectorOp(Factor.VALUE_1, Factor.VALUE_1, 'V0.t'))
                else:
                    print("Error in initialize operands for WV variant.")
                    sys.exit(-1)
            elif variant == Variant.WI:
                if self.style == Style.NARROWING:
                    assert self.vm_mask[Variant.WI] == Vm_Mask.VM_MASK, "Assume VM_MASK for WI variant"
                    self.dst_operands[Variant.WI] = {}
                    self.dst_operands[Variant.WI][Vm_Vma_Feature.VM_1] = (VectorOp(Factor.X1, Factor.X1, 'VD'),)
                    self.dst_operands[Variant.WI][Vm_Vma_Feature.VM_0_VMA] = (VectorOp(Factor.X1, Factor.X1, 'VD'),)
                    self.src_operands[Variant.WI] = {}
                    self.src_operands[Variant.WI][Vm_Vma_Feature.VM_1] = (VectorOp(Factor.X2, Factor.X2, 'VS2'), Imm5Op('Imm'))
                    self.src_operands[Variant.WI][Vm_Vma_Feature.VM_0_VMA] = (VectorOp(Factor.X2, Factor.X2, 'VS2'), Imm5Op('Imm'), VectorOp(Factor.VALUE_1, Factor.VALUE_1, 'V0.t'))
                else:
                    print("Error in initialize operands for WV variant.")
                    sys.exit(-1)
            elif variant == Variant.VVM:
                # vadc, vsbc, self.vm_vma_feature[Variant.VVM] = [Vm_Vma_Feature.VM_0]
                if (self.style in (Style.SUM_W_CARRY, Style.DIFF_W_BORROW)) and (self.name in ("vadc", "vsbc")) :
                    self.dst_operands[Variant.VVM] = {}
                    self.dst_operands[Variant.VVM][Vm_Vma_Feature.VM_0] = (VectorOp(Factor.X1, Factor.X1, 'VD'),)
                    self.src_operands[Variant.VVM] = {}
                    self.src_operands[Variant.VVM][Vm_Vma_Feature.VM_0] = (VectorOp(Factor.X1, Factor.X1, 'VS2'), VectorOp(Factor.X1, Factor.X1, 'VS1'), VectorOp(Factor.VALUE_1, Factor.VALUE_1, 'V0'))
                # vmadc, vmsbc, self.vm_vma_feature[Variant.VVM] = [Vm_Vma_Feature.VM_0]
                elif (self.style in (Style.SUM_W_CARRY, Style.DIFF_W_BORROW)) and (self.name in ("vmadc", "vmsbc")) :
                    self.dst_operands[Variant.VVM] = {}
                    self.dst_operands[Variant.VVM][Vm_Vma_Feature.VM_0] = (VectorOp(Factor.VALUE_1, Factor.VALUE_1, 'VD'),)
                    self.src_operands[Variant.VVM] = {}
                    self.src_operands[Variant.VVM][Vm_Vma_Feature.VM_0] = (VectorOp(Factor.X1, Factor.X1, 'VS2'), VectorOp(Factor.X1, Factor.X1, 'VS1'), VectorOp(Factor.VALUE_1, Factor.VALUE_1, 'V0'))
                elif self.style == Style.MERGE:
                    self.dst_operands[Variant.VVM] = {}
                    self.dst_operands[Variant.VVM][Vm_Vma_Feature.VM_0] = (VectorOp(Factor.X1, Factor.X1, 'VD'),)
                    self.src_operands[Variant.VVM] = {}
                    self.src_operands[Variant.VVM][Vm_Vma_Feature.VM_0] = (VectorOp(Factor.X1, Factor.X1, 'VS2'), VectorOp(Factor.X1, Factor.X1, 'VS1'), VectorOp(Factor.VALUE_1, Factor.VALUE_1, 'V0'))
                else:
                    print("Error in initialize operands for VVM variant.")
                    sys.exit(-1)
            elif variant == Variant.VXM:
                # vadc, vsbc, self.vm_vma_feature[Variant.VXM] = [Vm_Vma_Feature.VM_0]
                if (self.style in (Style.SUM_W_CARRY, Style.DIFF_W_BORROW)) and (self.name in ("vadc", "vsbc")) :
                    self.dst_operands[Variant.VXM] = {}
                    self.dst_operands[Variant.VXM][Vm_Vma_Feature.VM_0] = (VectorOp(Factor.X1, Factor.X1, 'VD'),)
                    self.src_operands[Variant.VXM] = {}
                    self.src_operands[Variant.VXM][Vm_Vma_Feature.VM_0] = (VectorOp(Factor.X1, Factor.X1, 'VS2'), IntOp('RS1'), VectorOp(Factor.VALUE_1, Factor.VALUE_1, 'V0'))
                # vmadc, vmsbc, self.vm_vma_feature[Variant.VXM] = [Vm_Vma_Feature.VM_0]
                elif (self.style in (Style.SUM_W_CARRY, Style.DIFF_W_BORROW)) and (self.name in ("vmadc", "vmsbc")) :
                    self.dst_operands[Variant.VXM] = {}
                    self.dst_operands[Variant.VXM][Vm_Vma_Feature.VM_0] = (VectorOp(Factor.VALUE_1, Factor.VALUE_1, 'VD'),)
                    self.src_operands[Variant.VXM] = {}
                    self.src_operands[Variant.VXM][Vm_Vma_Feature.VM_0] = (VectorOp(Factor.X1, Factor.X1, 'VS2'), IntOp('RS1'), VectorOp(Factor.VALUE_1, Factor.VALUE_1, 'V0'))
                elif self.style == Style.MERGE:
                    self.dst_operands[Variant.VXM] = {}
                    self.dst_operands[Variant.VXM][Vm_Vma_Feature.VM_0] = (VectorOp(Factor.X1, Factor.X1, 'VD'),)
                    self.src_operands[Variant.VXM] = {}
                    self.src_operands[Variant.VXM][Vm_Vma_Feature.VM_0] = (VectorOp(Factor.X1, Factor.X1, 'VS2'), IntOp('RS1'), VectorOp(Factor.VALUE_1, Factor.VALUE_1, 'V0'))
                else:
                    print("Error in initialize operands for VXM variant.")
                    sys.exit(-1)
            elif variant == Variant.VIM:
                # vadc, self.vm_vma_feature[Variant.VIM] = [Vm_Vma_Feature.VM_0]
                if (self.style in (Style.SUM_W_CARRY, Style.DIFF_W_BORROW)) and (self.name in ("vadc", "vsbc")) :
                    self.dst_operands[Variant.VIM] = {}
                    self.dst_operands[Variant.VIM][Vm_Vma_Feature.VM_0] = (VectorOp(Factor.X1, Factor.X1, 'VD'),)
                    self.src_operands[Variant.VIM] = {}
                    self.src_operands[Variant.VIM][Vm_Vma_Feature.VM_0] = (VectorOp(Factor.X1, Factor.X1, 'VS2'), Imm5Op('Imm'), VectorOp(Factor.VALUE_1, Factor.VALUE_1, 'V0'))
                # vmadc, self.vm_vma_feature[Variant.VIM] = [Vm_Vma_Feature.VM_0]
                elif (self.style in (Style.SUM_W_CARRY, Style.DIFF_W_BORROW)) and (self.name in ("vmadc", "vmsbc")) :
                    self.dst_operands[Variant.VIM] = {}
                    self.dst_operands[Variant.VIM][Vm_Vma_Feature.VM_0] = (VectorOp(Factor.VALUE_1, Factor.VALUE_1, 'VD'),)
                    self.src_operands[Variant.VIM] = {}
                    self.src_operands[Variant.VIM][Vm_Vma_Feature.VM_0] = (VectorOp(Factor.X1, Factor.X1, 'VS2'), Imm5Op('Imm'), VectorOp(Factor.VALUE_1, Factor.VALUE_1, 'V0'))
                elif self.style == Style.MERGE:
                    self.dst_operands[Variant.VIM] = {}
                    self.dst_operands[Variant.VIM][Vm_Vma_Feature.VM_0] = (VectorOp(Factor.X1, Factor.X1, 'VD'),)
                    self.src_operands[Variant.VIM] = {}
                    self.src_operands[Variant.VIM][Vm_Vma_Feature.VM_0] = (VectorOp(Factor.X1, Factor.X1, 'VS2'), Imm5Op('Imm'), VectorOp(Factor.VALUE_1, Factor.VALUE_1, 'V0'))
                else:
                    print("Error in initialize operands for VIM variant.")
                    sys.exit(-1)
            elif variant == Variant.V_V:
                assert self.vm_mask[Variant.V_V] == Vm_Mask.VM_NONMASK_ONLY_1, "Assume VM_NONMASK_ONLY_1 for V_V variant"
                self.dst_operands[Variant.V_V] = {}
                self.dst_operands[Variant.V_V][Vm_Vma_Feature.VM_1] = (VectorOp(Factor.X1, Factor.X1, 'VD'),)
                self.src_operands[Variant.V_V] = {}
                self.src_operands[Variant.V_V][Vm_Vma_Feature.VM_1] = (VectorOp(Factor.X2, Factor.X2, 'VS1'), )
            elif variant == Variant.V_X:
                assert self.vm_mask[Variant.V_X] == Vm_Mask.VM_NONMASK_ONLY_1, "Assume VM_NONMASK_ONLY_1 for V_X variant"
                self.dst_operands[Variant.V_X] = {}
                self.dst_operands[Variant.V_X][Vm_Vma_Feature.VM_1] = (VectorOp(Factor.X1, Factor.X1, 'VD'),)
                self.src_operands[Variant.V_X] = {}
                self.src_operands[Variant.V_X][Vm_Vma_Feature.VM_1] = (IntOp('RS1'), )
            elif variant == Variant.V_I:
                assert self.vm_mask[Variant.V_I] == Vm_Mask.VM_NONMASK_ONLY_1, "Assume VM_NONMASK_ONLY_1 for V_I variant"
                self.dst_operands[Variant.V_I] = {}
                self.dst_operands[Variant.V_I][Vm_Vma_Feature.VM_1] = (VectorOp(Factor.X1, Factor.X1, 'VD'),)
                self.src_operands[Variant.V_I] = {}
                self.src_operands[Variant.V_I][Vm_Vma_Feature.VM_1] = (Imm5Op('Imm'), )
            elif variant == Variant.VF2:
                self.dst_operands[Variant.VF2] = {}
                self.dst_operands[Variant.VF2][Vm_Vma_Feature.VM_1] = (VectorOp(Factor.X1, Factor.X1, 'VD'),)
                self.dst_operands[Variant.VF2][Vm_Vma_Feature.VM_0_VMA] = (VectorOp(Factor.X1, Factor.X1, 'VD'),)
                self.src_operands[Variant.VF2] = {}
                self.src_operands[Variant.VF2][Vm_Vma_Feature.VM_1] = (VectorOp(Factor.X0_5, Factor.X0_5, 'VS2'),)
                self.src_operands[Variant.VF2][Vm_Vma_Feature.VM_0_VMA] = (VectorOp(Factor.X0_5, Factor.X0_5, 'VS2'), VectorOp(Factor.VALUE_1, Factor.VALUE_1, 'V0.t'))
            elif variant == Variant.VF4:
                self.dst_operands[Variant.VF4] = {}
                self.dst_operands[Variant.VF4][Vm_Vma_Feature.VM_1] = (VectorOp(Factor.X1, Factor.X1, 'VD'),)
                self.dst_operands[Variant.VF4][Vm_Vma_Feature.VM_0_VMA] = (VectorOp(Factor.X1, Factor.X1, 'VD'),)
                self.src_operands[Variant.VF4] = {}
                self.src_operands[Variant.VF4][Vm_Vma_Feature.VM_1] = (VectorOp(Factor.X0_25, Factor.X0_25, 'VS2'),)
                self.src_operands[Variant.VF4][Vm_Vma_Feature.VM_0_VMA] = (VectorOp(Factor.X0_25, Factor.X0_25, 'VS2'), VectorOp(Factor.VALUE_1, Factor.VALUE_1, 'V0.t'))
            elif variant == Variant.VF8:
                self.dst_operands[Variant.VF8] = {}
                self.dst_operands[Variant.VF8][Vm_Vma_Feature.VM_1] = (VectorOp(Factor.X1, Factor.X1, 'VD'),)
                self.dst_operands[Variant.VF8][Vm_Vma_Feature.VM_0_VMA] = (VectorOp(Factor.X1, Factor.X1, 'VD'),)
                self.src_operands[Variant.VF8] = {}
                self.src_operands[Variant.VF8][Vm_Vma_Feature.VM_1] = (VectorOp(Factor.X0_125, Factor.X0_125, 'VS2'),)
                self.src_operands[Variant.VF8][Vm_Vma_Feature.VM_0_VMA] = (VectorOp(Factor.X0_125, Factor.X0_125, 'VS2'), VectorOp(Factor.VALUE_1, Factor.VALUE_1, 'V0.t'))
            else:
                print("Not a valid variant when initialize operands.")

    def format_table(self):
        res = []
        for variant in self.variants:
            for mask_feature in self.vm_vma_feature[variant]:
                # Category, Name, Style, Variants, lmul, sew, CSR read, CSR write 
                row = [self.category.name,
                    self.name,
                    self.style.name,
                    variant.name,
                    ','.join([str(x) for x in self.lmul[variant]]),
                    ','.join([str(x) for x in self.sew[variant]]),
                    ','.join([x.name for x in self.csr_read]) + '\nget_vl(lmul, sew)',
                    ','.join([x.name for x in self.csr_write])] 
                # VM_MTA
                row.append(vm_vma_feature_str[mask_feature])
                # Operands
                row.append(','.join([str(x) for x in self.dst_operands[variant][mask_feature]])
                    + "\nget_dst_regs(variant, lmul, sew, vm_vma_feature)")
                row.append(','.join([str(x) for x in self.src_operands[variant][mask_feature]])
                    + "\nget_src_regs(variant, lmul, sew, vm_vma_feature)")
                
                # Operands for each lmul, sew and vm_vma_feature tuple
                for l in [2**x for x in range(-3,4)]:
                    for e in [2**x for x in range(3,7)]:
                        if (l in self.lmul[variant]) and (e in self.sew[variant]):
                            operand_str = str(self.get_dst_regs(variant, l, e, mask_feature)) + "\n" + \
                                        str(self.get_src_regs(variant, l, e, mask_feature)) + "\n" + \
                                        "VL:" + str(self.get_vl(l, e))
                            row.append(operand_str)
                        else:
                            row.append("Not applicable")
                res.append(row)
        # remove duplicated items for readability
        rows_per_variant = []
        for variant in self.variants:
            rows_per_variant.append(len(self.vm_vma_feature[variant]))
        rows_total = sum(rows_per_variant)
        # set first three columns to empty string of all rows expect first one
        for i in range(1, rows_total):
            for j in range(3):
                res[i][j] = ""
        # For each variant, set variant column to empty string from the second to last row
        rows_preceding = 0
        for i in range(len(rows_per_variant)):
            for k in range(1, rows_per_variant[i]):
                res[rows_preceding + k][3] = ""
                res[rows_preceding + k][4] = ""
                res[rows_preceding + k][5] = ""
            rows_preceding += rows_per_variant[i]
        
        return res

    def get_dst_regs(self, variant, lmul, sew, vm_vma_feature):
        dst_reg = self.dst_operands[variant][vm_vma_feature]
        for reg in dst_reg:
            if isinstance(reg, VectorOp):
                if reg.emul_factor != Factor.VALUE_1:
                    emul = lmul * factors_num[reg.emul_factor]
                else:
                    emul = 1
                stride = 1 if emul < 1 else int(emul)
                idx_list = list(range(0, 32, stride))
                if (vm_vma_feature in (Vm_Vma_Feature.VM_0, Vm_Vma_Feature.VM_0_VMA)) and (reg.eew_factor != Factor.VALUE_1):
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
                stride = 1 if emul < 1 else int(emul)
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
    headers = ["Category", "Instruction", "Style", "Variant", "LMUL", "SEW", "CSR read", "CSR write", "VM VMA", 
        "Dst Operand", "Src Operand"]
    for l in [2**x for x in range(-3,4)]:
        for e in [2**x for x in range(3,7)]:
            headers.append("Details_lmul_" + str(l) + "_sew_" + str(e))
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
