from enum import Enum

class Category(Enum):
    ILLEGAL = 0
    CONFIG = 1
    LOAD_STORE = 2
    INT_ARITHMETIC = 3
    FIXED_ARITHMETIC = 4
    FP = 5
    REDUCTION = 6
    MASK = 7
    PERMUTATION = 8

class Variant(Enum):
    ILLEGAL = 0
    VV = 2
    VX = 3
    VI = 4
    WV = 5
    WX = 6
    WI = 7
    VVM = 8
    VXM = 9
    VIM = 10
    V_V = 11
    V_X = 12
    V_I = 13
    VF2 = 14
    VF4 = 15
    VF8 = 16

variants = {
    "vv" : Variant.VV,
    "vx" : Variant.VX,
    "vi" : Variant.VI,
    "wv" : Variant.WV,
    "wx" : Variant.WX,
    "wi" : Variant.WI,
    "vvm" : Variant.VVM,
    "vxm" : Variant.VXM,
    "vim" : Variant.VIM,
    "v.v" : Variant.V_V,
    "v.x" : Variant.V_X,
    "v.i" : Variant.V_I,
    "vf2" : Variant.VF2,
    "vf4" : Variant.VF4,
    "vf8" : Variant.VF8
}

class Style(Enum):
    ILLEGAL = 0
    NORMAL = 1
    WIDENING = 2
    NARROWING = 3
    SUM_W_CARRY = 4
    DIFF_W_BORROW = 5
    COMPARE = 6
    MERGE = 7
    MOVE = 8
    EXTENSION = 9

class Vm_Mask(Enum):
    ILLEGAL = 0
    VM_MASK = 1
    VM_NONMASK_ONLY_0 = 2
    VM_NONMASK_ONLY_1 = 3

class Vm_Vma_Feature(Enum):
    VM_0_VMA = 1
    VM_0 = 2
    VM_1 = 3

vm_vma_feature_str = {
    Vm_Vma_Feature.VM_0_VMA : "VM = 0, VMA",
    Vm_Vma_Feature.VM_0 : "VM = 0",
    Vm_Vma_Feature.VM_1 : "VM = 1"
}

class CSR(Enum):
    VMA = 1
    VTA = 2
    VL = 3
    VSTART = 4
    VXRM = 5
    VXSAT = 6
    FRM = 7
    

class Factor(Enum):
    ILLEGAL = 0
    VALUE_1 = 1
    X1 = 2
    X2 = 3
    X4 = 4
    X8 = 5
    X0_5 = 6
    X0_25 = 7
    X0_125 = 8

factors_str = {
    Factor.X1 : "",
    Factor.X2 : "2",
    Factor.X4 : "4",
    Factor.X8 : "8",
    Factor.X0_5 : "1/2",
    Factor.X0_25 : "1/4",
    Factor.X0_125 : "1/8"
}

factors_num = {
    Factor.X1 : 1,
    Factor.X2 : 2,
    Factor.X4 : 4,
    Factor.X8 : 8,
    Factor.X0_5 : 0.5,
    Factor.X0_25 : 0.25,
    Factor.X0_125 : 0.125 
}

class VectorOp:
    def __init__(self, emul_factor, eew_factor, name):
        self.emul_factor = emul_factor
        self.eew_factor = eew_factor
        self.name = name
    
    def __str__(self):
        if self.emul_factor == Factor.VALUE_1 and self.eew_factor == Factor.VALUE_1:
            return "VectorOP(1, 1)"
        else:
            return "VectorOP(" + factors_str[self.emul_factor] + "LMUL, " + factors_str[self.eew_factor] + "SEW)"

class IntOp:
    def __init__(self, name):
        self.name = name 
    def __str__(self):
        return "GPR"

class FPOp:
    def __init__(self, name):
        self.name = name
    def __str__(self):
        return "FPR"

class Imm5Op:
    def __init__(self, name):
        self.name = name
    def __str__(self):
        return "IMM5"