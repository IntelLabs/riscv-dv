import argparse
import re
import sys
import os
import pdb
from integer_arithmetic import *

def main():
    # Parse input arguments
    parser = argparse.ArgumentParser()
    parser.add_argument("--insn_file", type=str, help="Input vector instruction file")
    args = parser.parse_args()
    insn_list = []
    # headers = ["Category", "Instruction", "Style", "CSR read", "CSR write", "LMUL", "SEW", "Variant","VM VMA", "Dst Operand", "Src Operand"]
    with open(args.insn_file, "r") as fd:
        for line in fd:
            insn_list.append(VectorInsn(line))
    # table_data = []
    # for insn in insn_list:
    #     table_data += insn.format_table()
    # print(tabulate(table_data, headers, tablefmt="grid"))

    # print(insn_list[0].get_src_regs(Variant.VV, 4, 32, Vm_Vma_Feature.VM_0_VMA))

if __name__ == "__main__":
    main()
