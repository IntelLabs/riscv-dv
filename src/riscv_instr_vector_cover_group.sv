`define SAMPLE_V(cg, val) `SAMPLE_W_TYPE(cg, val,riscv_vector_instr) 
`define SAMPLE_VSET(cg, val) `SAMPLE_W_TYPE(cg, val,riscv_vset_instr) 

`define V_INSTR_CG_BEGIN(INSTR_NAME) \
  `INSTR_CG_BEGIN(INSTR_NAME,riscv_vector_instr) \
     //cp_vm  : coverpoint instr.find_vm; \
		 cp_vma : coverpoint instr.find_vma; \
     cp_vta : coverpoint instr.find_vta;

`define VSET_INSTR_CG_BEGIN(INSTR_NAME) \
  `INSTR_CG_BEGIN(INSTR_NAME,riscv_vset_instr) \

class riscv_instr_vector_cover_group extends riscv_instr_cover_group;
  //start bins
  //`VSET_INSTR_CG_BEGIN(vsetvli)
	//`CG_END
  //`VSET_INSTR_CG_BEGIN(vsetvl)
  //`CG_END
  //`VSET_INSTR_CG_BEGIN(vsetivli)
	//`CG_END

  `V_INSTR_CG_BEGIN(vadd)
	  cp_vl   : coverpoint instr.find_vl{
			     bins vl0 = {0};
					 bins vl0vlmax = {[1:127]};
					 bins vlmax = {128};
				 }
    cp_lmul : coverpoint instr.find_int_lmul{
           bins m0125 = {1}; 
           bins m025 = {2}; 
           bins m05 = {3}; 
           bins m1 = {4}; 
           bins m2 = {5}; 
           bins m4 = {6}; 
           bins m8 = {7}; 
        }
    cp_sew : coverpoint instr.find_sew{
           bins e8 = {8}; 
           bins e16 = {16}; 
           bins e32 = {32}; 
           bins e64 = {64}; 
        }
    //cp_variant : coverpoint instr.find_int_va_variant{
    //       bins VV = {1}; 
    //       bins VX = {3}; 
    //       bins VI = {2}; 
    //    }
    //cp_lmul_sew : cross cp_lmul, cp_sew{
    //      ignore_bins IGNORE_LMUL0125_SEW16 = (binsof(cp_lmul) intersect {1} ) &&
		//			                                    (binsof(cp_sew) intersect {16});
    //      ignore_bins IGNORE_LMUL0125_SEW32 = (binsof(cp_lmul) intersect {1} ) &&
		//			                                    (binsof(cp_sew) intersect {32});
    //      ignore_bins IGNORE_LMUL0125_SEW64 = (binsof(cp_lmul) intersect {1} ) &&
		//			                                    (binsof(cp_sew) intersect {64});
    //      ignore_bins IGNORE_LMUL025_SEW32 = (binsof(cp_lmul) intersect {2} ) &&
		//			                                    (binsof(cp_sew) intersect {32});
    //      ignore_bins IGNORE_LMUL025_SEW64 = (binsof(cp_lmul) intersect {2} ) &&
		//			                                    (binsof(cp_sew) intersect {64});
    //      ignore_bins IGNORE_LMUL05_SEW64  = (binsof(cp_lmul) intersect {3} ) &&
		//			                                    (binsof(cp_sew) intersect {64});
		//}
  `CG_END

  `V_INSTR_CG_BEGIN(vsub)
	  cp_vl   : coverpoint instr.find_vl{
			     bins vl0 = {0};
					 bins vl0vlmax = {[1:127]};
					 bins vlmax = {128};
				 }
    cp_lmul : coverpoint instr.find_int_lmul{
           bins m0125 = {1}; 
           bins m025 = {2}; 
           bins m05 = {3}; 
           bins m1 = {4}; 
           bins m2 = {5}; 
           bins m4 = {6}; 
           bins m8 = {7}; 
        }
    cp_sew : coverpoint instr.find_sew{
           bins e8 = {8}; 
           bins e16 = {16}; 
           bins e32 = {32}; 
           bins e64 = {64}; 
        }
    //cp_variant : coverpoint instr.find_int_va_variant{
    //       bins VV = {1}; 
    //       bins VX = {3}; 
    //    }
    //cp_lmul_sew : cross cp_lmul, cp_sew{
    //      ignore_bins IGNORE_LMUL0125_SEW16 = (binsof(cp_lmul) intersect {1} ) &&
		//			                                    (binsof(cp_sew) intersect {16});
    //      ignore_bins IGNORE_LMUL0125_SEW32 = (binsof(cp_lmul) intersect {1} ) &&
		//			                                    (binsof(cp_sew) intersect {32});
    //      ignore_bins IGNORE_LMUL0125_SEW64 = (binsof(cp_lmul) intersect {1} ) &&
		//			                                    (binsof(cp_sew) intersect {64});
    //      ignore_bins IGNORE_LMUL025_SEW32 = (binsof(cp_lmul) intersect {2} ) &&
		//			                                    (binsof(cp_sew) intersect {32});
    //      ignore_bins IGNORE_LMUL025_SEW64 = (binsof(cp_lmul) intersect {2} ) &&
		//			                                    (binsof(cp_sew) intersect {64});
    //      ignore_bins IGNORE_LMUL05_SEW64  = (binsof(cp_lmul) intersect {3} ) &&
		//			                                    (binsof(cp_sew) intersect {64});
		//}
  `CG_END

  `V_INSTR_CG_BEGIN(vrsub)
	  cp_vl   : coverpoint instr.find_vl{
			     bins vl0 = {0};
					 bins vl0vlmax = {[1:127]};
					 bins vlmax = {128};
				 }
    cp_lmul : coverpoint instr.find_int_lmul{
           bins m0125 = {1}; 
           bins m025 = {2}; 
           bins m05 = {3}; 
           bins m1 = {4}; 
           bins m2 = {5}; 
           bins m4 = {6}; 
           bins m8 = {7}; 
        }
    cp_sew : coverpoint instr.find_sew{
           bins e8 = {8}; 
           bins e16 = {16}; 
           bins e32 = {32}; 
           bins e64 = {64}; 
        }
    //cp_variant : coverpoint instr.find_int_va_variant{
    //       bins VX = {3}; 
    //       bins VI = {2}; 
    //    }
    //cp_lmul_sew : cross cp_lmul, cp_sew{
    //      ignore_bins IGNORE_LMUL0125_SEW16 = (binsof(cp_lmul) intersect {1} ) &&
		//			                                    (binsof(cp_sew) intersect {16});
    //      ignore_bins IGNORE_LMUL0125_SEW32 = (binsof(cp_lmul) intersect {1} ) &&
		//			                                    (binsof(cp_sew) intersect {32});
    //      ignore_bins IGNORE_LMUL0125_SEW64 = (binsof(cp_lmul) intersect {1} ) &&
		//			                                    (binsof(cp_sew) intersect {64});
    //      ignore_bins IGNORE_LMUL025_SEW32 = (binsof(cp_lmul) intersect {2} ) &&
		//			                                    (binsof(cp_sew) intersect {32});
    //      ignore_bins IGNORE_LMUL025_SEW64 = (binsof(cp_lmul) intersect {2} ) &&
		//			                                    (binsof(cp_sew) intersect {64});
    //      ignore_bins IGNORE_LMUL05_SEW64  = (binsof(cp_lmul) intersect {3} ) &&
		//			                                    (binsof(cp_sew) intersect {64});
		//}
  `CG_END

  `V_INSTR_CG_BEGIN(vwaddu)
	  cp_vl   : coverpoint instr.find_vl{
			     bins vl0 = {0};
					 bins vl0vlmax = {[1:63]};
					 bins vlmax = {64};
				 }
    cp_lmul : coverpoint instr.find_int_lmul{
           bins m0125 = {1}; 
           bins m025 = {2}; 
           bins m05 = {3}; 
           bins m1 = {4}; 
           bins m2 = {5}; 
           bins m4 = {6}; 
           bins m8 = {7}; 
        }
    cp_sew : coverpoint instr.find_sew{
           bins e8 = {8}; 
           bins e16 = {16}; 
           bins e32 = {32}; 
           bins e64 = {64}; 
        }
    //cp_variant : coverpoint instr.find_int_va_variant{
    //       bins VV = {1}; 
    //       bins VX = {3}; 
    //       bins WV = {5}; 
    //       bins WX = {7}; 
    //    }
    //cp_lmul_sew : cross cp_lmul, cp_sew{
    //      ignore_bins IGNORE_LMUL0125_SEW16 = (binsof(cp_lmul) intersect {1} ) &&
		//			                                    (binsof(cp_sew) intersect {16});
    //      ignore_bins IGNORE_LMUL0125_SEW32 = (binsof(cp_lmul) intersect {1} ) &&
		//			                                    (binsof(cp_sew) intersect {32});
    //      ignore_bins IGNORE_LMUL025_SEW32 = (binsof(cp_lmul) intersect {2} ) &&
		//			                                    (binsof(cp_sew) intersect {32});
		//}
  `CG_END

  `V_INSTR_CG_BEGIN(vwadd)
	  cp_vl   : coverpoint instr.find_vl{
			     bins vl0 = {0};
					 bins vl0vlmax = {[1:63]};
					 bins vlmax = {64};
				 }
    cp_lmul : coverpoint instr.find_int_lmul{
           bins m0125 = {1}; 
           bins m025 = {2}; 
           bins m05 = {3}; 
           bins m1 = {4}; 
           bins m2 = {5}; 
           bins m4 = {6}; 
           bins m8 = {7}; 
        }
    cp_sew : coverpoint instr.find_sew{
           bins e8 = {8}; 
           bins e16 = {16}; 
           bins e32 = {32}; 
           bins e64 = {64}; 
        }
    //cp_variant : coverpoint instr.find_int_va_variant{
    //       bins VV = {1}; 
    //       bins VX = {3}; 
    //       bins WV = {5}; 
    //       bins WX = {7}; 
    //    }
    //cp_lmul_sew : cross cp_lmul, cp_sew{
    //      ignore_bins IGNORE_LMUL0125_SEW16 = (binsof(cp_lmul) intersect {1} ) &&
		//			                                    (binsof(cp_sew) intersect {16});
    //      ignore_bins IGNORE_LMUL0125_SEW32 = (binsof(cp_lmul) intersect {1} ) &&
		//			                                    (binsof(cp_sew) intersect {32});
    //      ignore_bins IGNORE_LMUL025_SEW32 = (binsof(cp_lmul) intersect {2} ) &&
		//			                                    (binsof(cp_sew) intersect {32});
		//}
  `CG_END

  `V_INSTR_CG_BEGIN(vwsubu)
	  cp_vl   : coverpoint instr.find_vl{
			     bins vl0 = {0};
					 bins vl0vlmax = {[1:63]};
					 bins vlmax = {64};
				 }
    cp_lmul : coverpoint instr.find_int_lmul{
           bins m0125 = {1}; 
           bins m025 = {2}; 
           bins m05 = {3}; 
           bins m1 = {4}; 
           bins m2 = {5}; 
           bins m4 = {6}; 
           bins m8 = {7}; 
        }
    cp_sew : coverpoint instr.find_sew{
           bins e8 = {8}; 
           bins e16 = {16}; 
           bins e32 = {32}; 
           bins e64 = {64}; 
        }
    //cp_variant : coverpoint instr.find_int_va_variant{
    //       bins VV = {1}; 
    //       bins VX = {3}; 
    //       bins WV = {5}; 
    //       bins WX = {7}; 
    //    }
    //cp_lmul_sew : cross cp_lmul, cp_sew{
    //      ignore_bins IGNORE_LMUL0125_SEW16 = (binsof(cp_lmul) intersect {1} ) &&
		//			                                    (binsof(cp_sew) intersect {16});
    //      ignore_bins IGNORE_LMUL0125_SEW32 = (binsof(cp_lmul) intersect {1} ) &&
		//			                                    (binsof(cp_sew) intersect {32});
    //      ignore_bins IGNORE_LMUL025_SEW32 = (binsof(cp_lmul) intersect {2} ) &&
		//			                                    (binsof(cp_sew) intersect {32});
		//}
  `CG_END

  `V_INSTR_CG_BEGIN(vwsub)
	  cp_vl   : coverpoint instr.find_vl{
			     bins vl0 = {0};
					 bins vl0vlmax = {[1:63]};
					 bins vlmax = {64};
				 }
    cp_lmul : coverpoint instr.find_int_lmul{
           bins m0125 = {1}; 
           bins m025 = {2}; 
           bins m05 = {3}; 
           bins m1 = {4}; 
           bins m2 = {5}; 
           bins m4 = {6}; 
           bins m8 = {7}; 
        }
    cp_sew : coverpoint instr.find_sew{
           bins e8 = {8}; 
           bins e16 = {16}; 
           bins e32 = {32}; 
           bins e64 = {64}; 
        }
    //cp_variant : coverpoint instr.find_int_va_variant{
    //       bins VV = {1}; 
    //       bins VX = {3}; 
    //       bins WV = {5}; 
    //       bins WX = {7}; 
    //    }
    //cp_lmul_sew : cross cp_lmul, cp_sew{
    //      ignore_bins IGNORE_LMUL0125_SEW16 = (binsof(cp_lmul) intersect {1} ) &&
		//			                                    (binsof(cp_sew) intersect {16});
    //      ignore_bins IGNORE_LMUL0125_SEW32 = (binsof(cp_lmul) intersect {1} ) &&
		//			                                    (binsof(cp_sew) intersect {32});
    //      ignore_bins IGNORE_LMUL025_SEW32 = (binsof(cp_lmul) intersect {2} ) &&
		//			                                    (binsof(cp_sew) intersect {32});
		//}
  `CG_END

  `V_INSTR_CG_BEGIN(vzext)
	  cp_vl   : coverpoint instr.find_vl{
			     bins vl0 = {0};
					 bins vl0vlmax = {[1:63]};
					 bins vlmax = {64};
				 }
    cp_lmul : coverpoint instr.find_int_lmul{
           bins m0125 = {1}; 
           bins m025 = {2}; 
           bins m05 = {3}; 
           bins m1 = {4}; 
           bins m2 = {5}; 
           bins m4 = {6}; 
           bins m8 = {7}; 
        }
    cp_sew : coverpoint instr.find_sew{
           bins e8 = {8}; 
           bins e16 = {16}; 
           bins e32 = {32}; 
           bins e64 = {64}; 
        }
    //cp_variant : coverpoint instr.find_int_va_variant{
    //       bins VF2 = {15}; 
    //       bins VF4 = {16}; 
    //       bins VF8 = {17}; 
    //    }
    //cp_lmul_sew : cross cp_lmul, cp_sew{
    //      ignore_bins IGNORE_LMUL025_SEW32 = (binsof(cp_lmul) intersect {2} ) &&
		//			                                    (binsof(cp_sew) intersect {32});
    //      ignore_bins IGNORE_LMUL025_SEW64 = (binsof(cp_lmul) intersect {2} ) &&
		//			                                    (binsof(cp_sew) intersect {64});
    //      ignore_bins IGNORE_LMUL05_SEW64 = (binsof(cp_lmul) intersect {3} ) &&
		//			                                    (binsof(cp_sew) intersect {64});
		//}
  `CG_END

  `V_INSTR_CG_BEGIN(vsext)
	  cp_vl   : coverpoint instr.find_vl{
			     bins vl0 = {0};
					 bins vl0vlmax = {[1:63]};
					 bins vlmax = {64};
				 }
    cp_lmul : coverpoint instr.find_int_lmul{
           bins m0125 = {1}; 
           bins m025 = {2}; 
           bins m05 = {3}; 
           bins m1 = {4}; 
           bins m2 = {5}; 
           bins m4 = {6}; 
           bins m8 = {7}; 
        }
    cp_sew : coverpoint instr.find_sew{
           bins e8 = {8}; 
           bins e16 = {16}; 
           bins e32 = {32}; 
           bins e64 = {64}; 
        }
    //cp_variant : coverpoint instr.find_int_va_variant{
    //       bins VF2 = {15}; 
    //       bins VF4 = {16}; 
    //       bins VF8 = {17}; 
    //    }
    //cp_lmul_sew : cross cp_lmul, cp_sew{
    //      ignore_bins IGNORE_LMUL025_SEW32 = (binsof(cp_lmul) intersect {2} ) &&
		//			                                    (binsof(cp_sew) intersect {32});
    //      ignore_bins IGNORE_LMUL025_SEW64 = (binsof(cp_lmul) intersect {2} ) &&
		//			                                    (binsof(cp_sew) intersect {64});
    //      ignore_bins IGNORE_LMUL05_SEW64 = (binsof(cp_lmul) intersect {3} ) &&
		//			                                    (binsof(cp_sew) intersect {64});
		//}
  `CG_END

  `V_INSTR_CG_BEGIN(vadc)
	  cp_vl   : coverpoint instr.find_vl{
			     bins vl0 = {0};
					 bins vl0vlmax = {[1:127]};
					 bins vlmax = {128};
				 }
    cp_lmul : coverpoint instr.find_int_lmul{
           bins m0125 = {1}; 
           bins m025 = {2}; 
           bins m05 = {3}; 
           bins m1 = {4}; 
           bins m2 = {5}; 
           bins m4 = {6}; 
           bins m8 = {7}; 
        }
    cp_sew : coverpoint instr.find_sew{
           bins e8 = {8}; 
           bins e16 = {16}; 
           bins e32 = {32}; 
           bins e64 = {64}; 
        }
    //cp_variant : coverpoint instr.find_int_va_variant{
    //       bins VVM = {9}; 
    //       bins VXM = {11}; 
    //       bins VIM = {10}; 
    //    }
    //cp_lmul_sew : cross cp_lmul, cp_sew{
    //      ignore_bins IGNORE_LMUL0125_SEW16 = (binsof(cp_lmul) intersect {1} ) &&
		//			                                    (binsof(cp_sew) intersect {16});
    //      ignore_bins IGNORE_LMUL0125_SEW32 = (binsof(cp_lmul) intersect {1} ) &&
		//			                                    (binsof(cp_sew) intersect {32});
    //      ignore_bins IGNORE_LMUL0125_SEW64 = (binsof(cp_lmul) intersect {1} ) &&
		//			                                    (binsof(cp_sew) intersect {64});
    //      ignore_bins IGNORE_LMUL025_SEW32 = (binsof(cp_lmul) intersect {2} ) &&
		//			                                    (binsof(cp_sew) intersect {32});
    //      ignore_bins IGNORE_LMUL025_SEW64 = (binsof(cp_lmul) intersect {2} ) &&
		//			                                    (binsof(cp_sew) intersect {64});
    //      ignore_bins IGNORE_LMUL05_SEW64  = (binsof(cp_lmul) intersect {3} ) &&
		//			                                    (binsof(cp_sew) intersect {64});
		//}
  `CG_END

  `V_INSTR_CG_BEGIN(vmadc)
	  cp_vl   : coverpoint instr.find_vl{
			     bins vl0 = {0};
					 bins vl0vlmax = {[1:127]};
					 bins vlmax = {128};
				 }
    cp_lmul : coverpoint instr.find_int_lmul{
           bins m0125 = {1}; 
           bins m025 = {2}; 
           bins m05 = {3}; 
           bins m1 = {4}; 
           bins m2 = {5}; 
           bins m4 = {6}; 
           bins m8 = {7}; 
        }
    cp_sew : coverpoint instr.find_sew{
           bins e8 = {8}; 
           bins e16 = {16}; 
           bins e32 = {32}; 
           bins e64 = {64}; 
        }
    //cp_variant : coverpoint instr.find_int_va_variant{
    //       bins VVM = {9}; 
    //       bins VXM = {11}; 
    //       bins VIM = {10}; 
    //       bins VV = {1}; 
    //       bins VX = {3}; 
    //       bins VI = {2}; 
    //    }
  `CG_END

  `V_INSTR_CG_BEGIN(vsbc)
	  cp_vl   : coverpoint instr.find_vl{
			     bins vl0 = {0};
					 bins vl0vlmax = {[1:127]};
					 bins vlmax = {128};
				 }
    cp_lmul : coverpoint instr.find_int_lmul{
           bins m0125 = {1}; 
           bins m025 = {2}; 
           bins m05 = {3}; 
           bins m1 = {4}; 
           bins m2 = {5}; 
           bins m4 = {6}; 
           bins m8 = {7}; 
        }
    cp_sew : coverpoint instr.find_sew{
           bins e8 = {8}; 
           bins e16 = {16}; 
           bins e32 = {32}; 
           bins e64 = {64}; 
        }
    //cp_variant : coverpoint instr.find_int_va_variant{
    //       bins VVM = {9}; 
    //       bins VXM = {11}; 
    //    }
    //cp_lmul_sew : cross cp_lmul, cp_sew{
    //      ignore_bins IGNORE_LMUL0125_SEW16 = (binsof(cp_lmul) intersect {1} ) &&
		//			                                    (binsof(cp_sew) intersect {16});
    //      ignore_bins IGNORE_LMUL0125_SEW32 = (binsof(cp_lmul) intersect {1} ) &&
		//			                                    (binsof(cp_sew) intersect {32});
    //      ignore_bins IGNORE_LMUL0125_SEW64 = (binsof(cp_lmul) intersect {1} ) &&
		//			                                    (binsof(cp_sew) intersect {64});
    //      ignore_bins IGNORE_LMUL025_SEW32 = (binsof(cp_lmul) intersect {2} ) &&
		//			                                    (binsof(cp_sew) intersect {32});
    //      ignore_bins IGNORE_LMUL025_SEW64 = (binsof(cp_lmul) intersect {2} ) &&
		//			                                    (binsof(cp_sew) intersect {64});
    //      ignore_bins IGNORE_LMUL05_SEW64  = (binsof(cp_lmul) intersect {3} ) &&
		//			                                    (binsof(cp_sew) intersect {64});
		//}
  `CG_END

  `V_INSTR_CG_BEGIN(vmsbc)
	  cp_vl   : coverpoint instr.find_vl{
			     bins vl0 = {0};
					 bins vl0vlmax = {[1:127]};
					 bins vlmax = {128};
				 }
    cp_lmul : coverpoint instr.find_int_lmul{
           bins m0125 = {1}; 
           bins m025 = {2}; 
           bins m05 = {3}; 
           bins m1 = {4}; 
           bins m2 = {5}; 
           bins m4 = {6}; 
           bins m8 = {7}; 
        }
    cp_sew : coverpoint instr.find_sew{
           bins e8 = {8}; 
           bins e16 = {16}; 
           bins e32 = {32}; 
           bins e64 = {64}; 
        }
    //cp_variant : coverpoint instr.find_int_va_variant{
    //       bins VVM = {9}; 
    //       bins VXM = {11}; 
    //       bins VV = {1}; 
    //       bins VX = {3}; 
    //    }
  `CG_END

  `V_INSTR_CG_BEGIN(vand)
	  cp_vl   : coverpoint instr.find_vl{
			     bins vl0 = {0};
					 bins vl0vlmax = {[1:127]};
					 bins vlmax = {128};
				 }
    cp_lmul : coverpoint instr.find_int_lmul{
           bins m0125 = {1}; 
           bins m025 = {2}; 
           bins m05 = {3}; 
           bins m1 = {4}; 
           bins m2 = {5}; 
           bins m4 = {6}; 
           bins m8 = {7}; 
        }
    cp_sew : coverpoint instr.find_sew{
           bins e8 = {8}; 
           bins e16 = {16}; 
           bins e32 = {32}; 
           bins e64 = {64}; 
        }
    //cp_variant : coverpoint instr.find_int_va_variant{
    //       bins VV = {1}; 
    //       bins VX = {3}; 
    //       bins VI = {2}; 
    //    }
    //cp_lmul_sew : cross cp_lmul, cp_sew{
    //      ignore_bins IGNORE_LMUL0125_SEW16 = (binsof(cp_lmul) intersect {1} ) &&
		//			                                    (binsof(cp_sew) intersect {16});
    //      ignore_bins IGNORE_LMUL0125_SEW32 = (binsof(cp_lmul) intersect {1} ) &&
		//			                                    (binsof(cp_sew) intersect {32});
    //      ignore_bins IGNORE_LMUL0125_SEW64 = (binsof(cp_lmul) intersect {1} ) &&
		//			                                    (binsof(cp_sew) intersect {64});
    //      ignore_bins IGNORE_LMUL025_SEW32 = (binsof(cp_lmul) intersect {2} ) &&
		//			                                    (binsof(cp_sew) intersect {32});
    //      ignore_bins IGNORE_LMUL025_SEW64 = (binsof(cp_lmul) intersect {2} ) &&
		//			                                    (binsof(cp_sew) intersect {64});
    //      ignore_bins IGNORE_LMUL05_SEW64  = (binsof(cp_lmul) intersect {3} ) &&
		//			                                    (binsof(cp_sew) intersect {64});
		//}
  `CG_END

  `V_INSTR_CG_BEGIN(vor)
	  cp_vl   : coverpoint instr.find_vl{
			     bins vl0 = {0};
					 bins vl0vlmax = {[1:127]};
					 bins vlmax = {128};
				 }
    cp_lmul : coverpoint instr.find_int_lmul{
           bins m0125 = {1}; 
           bins m025 = {2}; 
           bins m05 = {3}; 
           bins m1 = {4}; 
           bins m2 = {5}; 
           bins m4 = {6}; 
           bins m8 = {7}; 
        }
    cp_sew : coverpoint instr.find_sew{
           bins e8 = {8}; 
           bins e16 = {16}; 
           bins e32 = {32}; 
           bins e64 = {64}; 
        }
    //cp_variant : coverpoint instr.find_int_va_variant{
    //       bins VV = {1}; 
    //       bins VX = {3}; 
    //       bins VI = {2}; 
    //    }
    //cp_lmul_sew : cross cp_lmul, cp_sew{
    //      ignore_bins IGNORE_LMUL0125_SEW16 = (binsof(cp_lmul) intersect {1} ) &&
		//			                                    (binsof(cp_sew) intersect {16});
    //      ignore_bins IGNORE_LMUL0125_SEW32 = (binsof(cp_lmul) intersect {1} ) &&
		//			                                    (binsof(cp_sew) intersect {32});
    //      ignore_bins IGNORE_LMUL0125_SEW64 = (binsof(cp_lmul) intersect {1} ) &&
		//			                                    (binsof(cp_sew) intersect {64});
    //      ignore_bins IGNORE_LMUL025_SEW32 = (binsof(cp_lmul) intersect {2} ) &&
		//			                                    (binsof(cp_sew) intersect {32});
    //      ignore_bins IGNORE_LMUL025_SEW64 = (binsof(cp_lmul) intersect {2} ) &&
		//			                                    (binsof(cp_sew) intersect {64});
    //      ignore_bins IGNORE_LMUL05_SEW64  = (binsof(cp_lmul) intersect {3} ) &&
		//			                                    (binsof(cp_sew) intersect {64});
		//}
  `CG_END

  `V_INSTR_CG_BEGIN(vxor)
	  cp_vl   : coverpoint instr.find_vl{
			     bins vl0 = {0};
					 bins vl0vlmax = {[1:127]};
					 bins vlmax = {128};
				 }
    cp_lmul : coverpoint instr.find_int_lmul{
           bins m0125 = {1}; 
           bins m025 = {2}; 
           bins m05 = {3}; 
           bins m1 = {4}; 
           bins m2 = {5}; 
           bins m4 = {6}; 
           bins m8 = {7}; 
        }
    cp_sew : coverpoint instr.find_sew{
           bins e8 = {8}; 
           bins e16 = {16}; 
           bins e32 = {32}; 
           bins e64 = {64}; 
        }
    //cp_variant : coverpoint instr.find_int_va_variant{
    //       bins VV = {1}; 
    //       bins VX = {3}; 
    //       bins VI = {2}; 
    //    }
    //cp_lmul_sew : cross cp_lmul, cp_sew{
    //      ignore_bins IGNORE_LMUL0125_SEW16 = (binsof(cp_lmul) intersect {1} ) &&
		//			                                    (binsof(cp_sew) intersect {16});
    //      ignore_bins IGNORE_LMUL0125_SEW32 = (binsof(cp_lmul) intersect {1} ) &&
		//			                                    (binsof(cp_sew) intersect {32});
    //      ignore_bins IGNORE_LMUL0125_SEW64 = (binsof(cp_lmul) intersect {1} ) &&
		//			                                    (binsof(cp_sew) intersect {64});
    //      ignore_bins IGNORE_LMUL025_SEW32 = (binsof(cp_lmul) intersect {2} ) &&
		//			                                    (binsof(cp_sew) intersect {32});
    //      ignore_bins IGNORE_LMUL025_SEW64 = (binsof(cp_lmul) intersect {2} ) &&
		//			                                    (binsof(cp_sew) intersect {64});
    //      ignore_bins IGNORE_LMUL05_SEW64  = (binsof(cp_lmul) intersect {3} ) &&
		//			                                    (binsof(cp_sew) intersect {64});
		//}
  `CG_END

  `V_INSTR_CG_BEGIN(vsll)
	  cp_vl   : coverpoint instr.find_vl{
			     bins vl0 = {0};
					 bins vl0vlmax = {[1:127]};
					 bins vlmax = {128};
				 }
    cp_lmul : coverpoint instr.find_int_lmul{
           bins m0125 = {1}; 
           bins m025 = {2}; 
           bins m05 = {3}; 
           bins m1 = {4}; 
           bins m2 = {5}; 
           bins m4 = {6}; 
           bins m8 = {7}; 
        }
    cp_sew : coverpoint instr.find_sew{
           bins e8 = {8}; 
           bins e16 = {16}; 
           bins e32 = {32}; 
           bins e64 = {64}; 
        }
    //cp_variant : coverpoint instr.find_int_va_variant{
    //       bins VV = {1}; 
    //       bins VX = {3}; 
    //       bins VI = {2}; 
    //    }
    //cp_lmul_sew : cross cp_lmul, cp_sew{
    //      ignore_bins IGNORE_LMUL0125_SEW16 = (binsof(cp_lmul) intersect {1} ) &&
		//			                                    (binsof(cp_sew) intersect {16});
    //      ignore_bins IGNORE_LMUL0125_SEW32 = (binsof(cp_lmul) intersect {1} ) &&
		//			                                    (binsof(cp_sew) intersect {32});
    //      ignore_bins IGNORE_LMUL0125_SEW64 = (binsof(cp_lmul) intersect {1} ) &&
		//			                                    (binsof(cp_sew) intersect {64});
    //      ignore_bins IGNORE_LMUL025_SEW32 = (binsof(cp_lmul) intersect {2} ) &&
		//			                                    (binsof(cp_sew) intersect {32});
    //      ignore_bins IGNORE_LMUL025_SEW64 = (binsof(cp_lmul) intersect {2} ) &&
		//			                                    (binsof(cp_sew) intersect {64});
    //      ignore_bins IGNORE_LMUL05_SEW64  = (binsof(cp_lmul) intersect {3} ) &&
		//			                                    (binsof(cp_sew) intersect {64});
		//}
  `CG_END

  `V_INSTR_CG_BEGIN(vsrl)
	  cp_vl   : coverpoint instr.find_vl{
			     bins vl0 = {0};
					 bins vl0vlmax = {[1:127]};
					 bins vlmax = {128};
				 }
    cp_lmul : coverpoint instr.find_int_lmul{
           bins m0125 = {1}; 
           bins m025 = {2}; 
           bins m05 = {3}; 
           bins m1 = {4}; 
           bins m2 = {5}; 
           bins m4 = {6}; 
           bins m8 = {7}; 
        }
    cp_sew : coverpoint instr.find_sew{
           bins e8 = {8}; 
           bins e16 = {16}; 
           bins e32 = {32}; 
           bins e64 = {64}; 
        }
//    cp_variant : coverpoint instr.find_int_va_variant{
//           bins VV = {1}; 
//           bins VX = {3}; 
//           bins VI = {2}; 
//        }
    //cp_lmul_sew : cross cp_lmul, cp_sew{
    //      ignore_bins IGNORE_LMUL0125_SEW16 = (binsof(cp_lmul) intersect {1} ) &&
		//			                                    (binsof(cp_sew) intersect {16});
    //      ignore_bins IGNORE_LMUL0125_SEW32 = (binsof(cp_lmul) intersect {1} ) &&
		//			                                    (binsof(cp_sew) intersect {32});
    //      ignore_bins IGNORE_LMUL0125_SEW64 = (binsof(cp_lmul) intersect {1} ) &&
		//			                                    (binsof(cp_sew) intersect {64});
    //      ignore_bins IGNORE_LMUL025_SEW32 = (binsof(cp_lmul) intersect {2} ) &&
		//			                                    (binsof(cp_sew) intersect {32});
    //      ignore_bins IGNORE_LMUL025_SEW64 = (binsof(cp_lmul) intersect {2} ) &&
		//			                                    (binsof(cp_sew) intersect {64});
    //      ignore_bins IGNORE_LMUL05_SEW64  = (binsof(cp_lmul) intersect {3} ) &&
		//			                                    (binsof(cp_sew) intersect {64});
		//}
  `CG_END

  `V_INSTR_CG_BEGIN(vsra)
	  cp_vl   : coverpoint instr.find_vl{
			     bins vl0 = {0};
					 bins vl0vlmax = {[1:127]};
					 bins vlmax = {128};
				 }
    cp_lmul : coverpoint instr.find_int_lmul{
           bins m0125 = {1}; 
           bins m025 = {2}; 
           bins m05 = {3}; 
           bins m1 = {4}; 
           bins m2 = {5}; 
           bins m4 = {6}; 
           bins m8 = {7}; 
        }
    cp_sew : coverpoint instr.find_sew{
           bins e8 = {8}; 
           bins e16 = {16}; 
           bins e32 = {32}; 
           bins e64 = {64}; 
        }
    //cp_variant : coverpoint instr.find_int_va_variant{
    //       bins VV = {1}; 
    //       bins VX = {3}; 
    //       bins VI = {2}; 
    //    }
    //cp_lmul_sew : cross cp_lmul, cp_sew{
    //      ignore_bins IGNORE_LMUL0125_SEW16 = (binsof(cp_lmul) intersect {1} ) &&
		//			                                    (binsof(cp_sew) intersect {16});
    //      ignore_bins IGNORE_LMUL0125_SEW32 = (binsof(cp_lmul) intersect {1} ) &&
		//			                                    (binsof(cp_sew) intersect {32});
    //      ignore_bins IGNORE_LMUL0125_SEW64 = (binsof(cp_lmul) intersect {1} ) &&
		//			                                    (binsof(cp_sew) intersect {64});
    //      ignore_bins IGNORE_LMUL025_SEW32 = (binsof(cp_lmul) intersect {2} ) &&
		//			                                    (binsof(cp_sew) intersect {32});
    //      ignore_bins IGNORE_LMUL025_SEW64 = (binsof(cp_lmul) intersect {2} ) &&
		//			                                    (binsof(cp_sew) intersect {64});
    //      ignore_bins IGNORE_LMUL05_SEW64  = (binsof(cp_lmul) intersect {3} ) &&
		//			                                    (binsof(cp_sew) intersect {64});
		//}
  `CG_END

  `V_INSTR_CG_BEGIN(vnsrl)
	  cp_vl   : coverpoint instr.find_vl{
			     bins vl0 = {0};
					 bins vl0vlmax = {[1:63]};
					 bins vlmax = {64};
				 }
    cp_lmul : coverpoint instr.find_int_lmul{
           bins m0125 = {1}; 
           bins m025 = {2}; 
           bins m05 = {3}; 
           bins m1 = {4}; 
           bins m2 = {5}; 
           bins m4 = {6}; 
           bins m8 = {7}; 
        }
    cp_sew : coverpoint instr.find_sew{
           bins e8 = {8}; 
           bins e16 = {16}; 
           bins e32 = {32}; 
           bins e64 = {64}; 
        }
    //cp_variant : coverpoint instr.find_int_va_variant{
    //       bins WV = {5}; 
    //       bins WX = {7}; 
    //       bins WI = {6}; 
    //    }
    //cp_lmul_sew : cross cp_lmul, cp_sew{
    //      ignore_bins IGNORE_LMUL0125_SEW16 = (binsof(cp_lmul) intersect {1} ) &&
		//			                                    (binsof(cp_sew) intersect {16});
    //      ignore_bins IGNORE_LMUL0125_SEW32 = (binsof(cp_lmul) intersect {1} ) &&
		//			                                    (binsof(cp_sew) intersect {32});
    //      ignore_bins IGNORE_LMUL025_SEW32 = (binsof(cp_lmul) intersect {2} ) &&
		//			                                    (binsof(cp_sew) intersect {32});
		//}
  `CG_END

  `V_INSTR_CG_BEGIN(vnsra)
	  cp_vl   : coverpoint instr.find_vl{
			     bins vl0 = {0};
					 bins vl0vlmax = {[1:63]};
					 bins vlmax = {64};
				 }
    cp_lmul : coverpoint instr.find_int_lmul{
           bins m0125 = {1}; 
           bins m025 = {2}; 
           bins m05 = {3}; 
           bins m1 = {4}; 
           bins m2 = {5}; 
           bins m4 = {6}; 
           bins m8 = {7}; 
        }
    cp_sew : coverpoint instr.find_sew{
           bins e8 = {8}; 
           bins e16 = {16}; 
           bins e32 = {32}; 
           bins e64 = {64}; 
        }
    //cp_variant : coverpoint instr.find_int_va_variant{
    //       bins WV = {5}; 
    //       bins WX = {7}; 
    //       bins WI = {6}; 
    //    }
    //cp_lmul_sew : cross cp_lmul, cp_sew{
    //      ignore_bins IGNORE_LMUL0125_SEW16 = (binsof(cp_lmul) intersect {1} ) &&
		//			                                    (binsof(cp_sew) intersect {16});
    //      ignore_bins IGNORE_LMUL0125_SEW32 = (binsof(cp_lmul) intersect {1} ) &&
		//			                                    (binsof(cp_sew) intersect {32});
    //      ignore_bins IGNORE_LMUL025_SEW32 = (binsof(cp_lmul) intersect {2} ) &&
		//			                                    (binsof(cp_sew) intersect {32});
		//}
  `CG_END

  `V_INSTR_CG_BEGIN(vmseq)
	  cp_vl   : coverpoint instr.find_vl{
			     bins vl0 = {0};
					 bins vl0vlmax = {[1:127]};
					 bins vlmax = {128};
				 }
    cp_lmul : coverpoint instr.find_int_lmul{
           bins m0125 = {1}; 
           bins m025 = {2}; 
           bins m05 = {3}; 
           bins m1 = {4}; 
           bins m2 = {5}; 
           bins m4 = {6}; 
           bins m8 = {7}; 
        }
    cp_sew : coverpoint instr.find_sew{
           bins e8 = {8}; 
           bins e16 = {16}; 
           bins e32 = {32}; 
           bins e64 = {64}; 
        }
    //cp_variant : coverpoint instr.find_int_va_variant{
    //       bins VV = {1}; 
    //       bins VX = {3}; 
    //       bins VI = {2}; 
    //    }
  `CG_END

  `V_INSTR_CG_BEGIN(vmsne)
	  cp_vl   : coverpoint instr.find_vl{
			     bins vl0 = {0};
					 bins vl0vlmax = {[1:127]};
					 bins vlmax = {128};
				 }
    cp_lmul : coverpoint instr.find_int_lmul{
           bins m0125 = {1}; 
           bins m025 = {2}; 
           bins m05 = {3}; 
           bins m1 = {4}; 
           bins m2 = {5}; 
           bins m4 = {6}; 
           bins m8 = {7}; 
        }
    cp_sew : coverpoint instr.find_sew{
           bins e8 = {8}; 
           bins e16 = {16}; 
           bins e32 = {32}; 
           bins e64 = {64}; 
        }
    //cp_variant : coverpoint instr.find_int_va_variant{
    //       bins VV = {1}; 
    //       bins VX = {3}; 
    //       bins VI = {2}; 
    //    }
  `CG_END

  `V_INSTR_CG_BEGIN(vmsltu)
	  cp_vl   : coverpoint instr.find_vl{
			     bins vl0 = {0};
					 bins vl0vlmax = {[1:127]};
					 bins vlmax = {128};
				 }
    cp_lmul : coverpoint instr.find_int_lmul{
           bins m0125 = {1}; 
           bins m025 = {2}; 
           bins m05 = {3}; 
           bins m1 = {4}; 
           bins m2 = {5}; 
           bins m4 = {6}; 
           bins m8 = {7}; 
        }
    cp_sew : coverpoint instr.find_sew{
           bins e8 = {8}; 
           bins e16 = {16}; 
           bins e32 = {32}; 
           bins e64 = {64}; 
        }
    //cp_variant : coverpoint instr.find_int_va_variant{
    //       bins VV = {1}; 
    //       bins VX = {3}; 
    //    }
  `CG_END

  `V_INSTR_CG_BEGIN(vmslt)
	  cp_vl   : coverpoint instr.find_vl{
			     bins vl0 = {0};
					 bins vl0vlmax = {[1:127]};
					 bins vlmax = {128};
				 }
    cp_lmul : coverpoint instr.find_int_lmul{
           bins m0125 = {1}; 
           bins m025 = {2}; 
           bins m05 = {3}; 
           bins m1 = {4}; 
           bins m2 = {5}; 
           bins m4 = {6}; 
           bins m8 = {7}; 
        }
    cp_sew : coverpoint instr.find_sew{
           bins e8 = {8}; 
           bins e16 = {16}; 
           bins e32 = {32}; 
           bins e64 = {64}; 
        }
    //cp_variant : coverpoint instr.find_int_va_variant{
    //       bins VV = {1}; 
    //       bins VX = {3}; 
    //    }
  `CG_END

  `V_INSTR_CG_BEGIN(vmsleu)
	  cp_vl   : coverpoint instr.find_vl{
			     bins vl0 = {0};
					 bins vl0vlmax = {[1:127]};
					 bins vlmax = {128};
				 }
    cp_lmul : coverpoint instr.find_int_lmul{
           bins m0125 = {1}; 
           bins m025 = {2}; 
           bins m05 = {3}; 
           bins m1 = {4}; 
           bins m2 = {5}; 
           bins m4 = {6}; 
           bins m8 = {7}; 
        }
    cp_sew : coverpoint instr.find_sew{
           bins e8 = {8}; 
           bins e16 = {16}; 
           bins e32 = {32}; 
           bins e64 = {64}; 
        }
    //cp_variant : coverpoint instr.find_int_va_variant{
    //       bins VV = {1}; 
    //       bins VX = {3}; 
    //       bins VI = {2}; 
    //    }
  `CG_END

  `V_INSTR_CG_BEGIN(vmsle)
	  cp_vl   : coverpoint instr.find_vl{
			     bins vl0 = {0};
					 bins vl0vlmax = {[1:127]};
					 bins vlmax = {128};
				 }
    cp_lmul : coverpoint instr.find_int_lmul{
           bins m0125 = {1}; 
           bins m025 = {2}; 
           bins m05 = {3}; 
           bins m1 = {4}; 
           bins m2 = {5}; 
           bins m4 = {6}; 
           bins m8 = {7}; 
        }
    cp_sew : coverpoint instr.find_sew{
           bins e8 = {8}; 
           bins e16 = {16}; 
           bins e32 = {32}; 
           bins e64 = {64}; 
        }
    //cp_variant : coverpoint instr.find_int_va_variant{
    //       bins VV = {1}; 
    //       bins VX = {3}; 
    //       bins VI = {2}; 
    //    }
  `CG_END

  `V_INSTR_CG_BEGIN(vmsgtu)
	  cp_vl   : coverpoint instr.find_vl{
			     bins vl0 = {0};
					 bins vl0vlmax = {[1:127]};
					 bins vlmax = {128};
				 }
    cp_lmul : coverpoint instr.find_int_lmul{
           bins m0125 = {1}; 
           bins m025 = {2}; 
           bins m05 = {3}; 
           bins m1 = {4}; 
           bins m2 = {5}; 
           bins m4 = {6}; 
           bins m8 = {7}; 
        }
    cp_sew : coverpoint instr.find_sew{
           bins e8 = {8}; 
           bins e16 = {16}; 
           bins e32 = {32}; 
           bins e64 = {64}; 
        }
    //cp_variant : coverpoint instr.find_int_va_variant{
    //       bins VX = {3}; 
    //       bins VI = {2}; 
    //    }
  `CG_END

  `V_INSTR_CG_BEGIN(vmsgt)
	  cp_vl   : coverpoint instr.find_vl{
			     bins vl0 = {0};
					 bins vl0vlmax = {[1:127]};
					 bins vlmax = {128};
				 }
    cp_lmul : coverpoint instr.find_int_lmul{
           bins m0125 = {1}; 
           bins m025 = {2}; 
           bins m05 = {3}; 
           bins m1 = {4}; 
           bins m2 = {5}; 
           bins m4 = {6}; 
           bins m8 = {7}; 
        }
    cp_sew : coverpoint instr.find_sew{
           bins e8 = {8}; 
           bins e16 = {16}; 
           bins e32 = {32}; 
           bins e64 = {64}; 
        }
    //cp_variant : coverpoint instr.find_int_va_variant{
    //       bins VX = {3}; 
    //       bins VI = {2}; 
    //    }
  `CG_END

  `V_INSTR_CG_BEGIN(vminu)
	  cp_vl   : coverpoint instr.find_vl{
			     bins vl0 = {0};
					 bins vl0vlmax = {[1:127]};
					 bins vlmax = {128};
				 }
    cp_lmul : coverpoint instr.find_int_lmul{
           bins m0125 = {1}; 
           bins m025 = {2}; 
           bins m05 = {3}; 
           bins m1 = {4}; 
           bins m2 = {5}; 
           bins m4 = {6}; 
           bins m8 = {7}; 
        }
    cp_sew : coverpoint instr.find_sew{
           bins e8 = {8}; 
           bins e16 = {16}; 
           bins e32 = {32}; 
           bins e64 = {64}; 
        }
    //cp_variant : coverpoint instr.find_int_va_variant{
    //       bins VV = {1}; 
    //       bins VX = {3}; 
    //    }
    //cp_lmul_sew : cross cp_lmul, cp_sew{
    //      ignore_bins IGNORE_LMUL0125_SEW16 = (binsof(cp_lmul) intersect {1} ) &&
		//			                                    (binsof(cp_sew) intersect {16});
    //      ignore_bins IGNORE_LMUL0125_SEW32 = (binsof(cp_lmul) intersect {1} ) &&
		//			                                    (binsof(cp_sew) intersect {32});
    //      ignore_bins IGNORE_LMUL0125_SEW64 = (binsof(cp_lmul) intersect {1} ) &&
		//			                                    (binsof(cp_sew) intersect {64});
    //      ignore_bins IGNORE_LMUL025_SEW32 = (binsof(cp_lmul) intersect {2} ) &&
		//			                                    (binsof(cp_sew) intersect {32});
    //      ignore_bins IGNORE_LMUL025_SEW64 = (binsof(cp_lmul) intersect {2} ) &&
		//			                                    (binsof(cp_sew) intersect {64});
    //      ignore_bins IGNORE_LMUL05_SEW64  = (binsof(cp_lmul) intersect {3} ) &&
		//			                                    (binsof(cp_sew) intersect {64});
		//}
  `CG_END

  `V_INSTR_CG_BEGIN(vmin)
	  cp_vl   : coverpoint instr.find_vl{
			     bins vl0 = {0};
					 bins vl0vlmax = {[1:127]};
					 bins vlmax = {128};
				 }
    cp_lmul : coverpoint instr.find_int_lmul{
           bins m0125 = {1}; 
           bins m025 = {2}; 
           bins m05 = {3}; 
           bins m1 = {4}; 
           bins m2 = {5}; 
           bins m4 = {6}; 
           bins m8 = {7}; 
        }
    cp_sew : coverpoint instr.find_sew{
           bins e8 = {8}; 
           bins e16 = {16}; 
           bins e32 = {32}; 
           bins e64 = {64}; 
        }
    //cp_variant : coverpoint instr.find_int_va_variant{
    //       bins VV = {1}; 
    //       bins VX = {3}; 
    //    }
    //cp_lmul_sew : cross cp_lmul, cp_sew{
    //      ignore_bins IGNORE_LMUL0125_SEW16 = (binsof(cp_lmul) intersect {1} ) &&
		//			                                    (binsof(cp_sew) intersect {16});
    //      ignore_bins IGNORE_LMUL0125_SEW32 = (binsof(cp_lmul) intersect {1} ) &&
		//			                                    (binsof(cp_sew) intersect {32});
    //      ignore_bins IGNORE_LMUL0125_SEW64 = (binsof(cp_lmul) intersect {1} ) &&
		//			                                    (binsof(cp_sew) intersect {64});
    //      ignore_bins IGNORE_LMUL025_SEW32 = (binsof(cp_lmul) intersect {2} ) &&
		//			                                    (binsof(cp_sew) intersect {32});
    //      ignore_bins IGNORE_LMUL025_SEW64 = (binsof(cp_lmul) intersect {2} ) &&
		//			                                    (binsof(cp_sew) intersect {64});
    //      ignore_bins IGNORE_LMUL05_SEW64  = (binsof(cp_lmul) intersect {3} ) &&
		//			                                    (binsof(cp_sew) intersect {64});
		//}
  `CG_END

  `V_INSTR_CG_BEGIN(vmaxu)
	  cp_vl   : coverpoint instr.find_vl{
			     bins vl0 = {0};
					 bins vl0vlmax = {[1:127]};
					 bins vlmax = {128};
				 }
    cp_lmul : coverpoint instr.find_int_lmul{
           bins m0125 = {1}; 
           bins m025 = {2}; 
           bins m05 = {3}; 
           bins m1 = {4}; 
           bins m2 = {5}; 
           bins m4 = {6}; 
           bins m8 = {7}; 
        }
    cp_sew : coverpoint instr.find_sew{
           bins e8 = {8}; 
           bins e16 = {16}; 
           bins e32 = {32}; 
           bins e64 = {64}; 
        }
    //cp_variant : coverpoint instr.find_int_va_variant{
    //       bins VV = {1}; 
    //       bins VX = {3}; 
    //    }
    //cp_lmul_sew : cross cp_lmul, cp_sew{
    //      ignore_bins IGNORE_LMUL0125_SEW16 = (binsof(cp_lmul) intersect {1} ) &&
		//			                                    (binsof(cp_sew) intersect {16});
    //      ignore_bins IGNORE_LMUL0125_SEW32 = (binsof(cp_lmul) intersect {1} ) &&
		//			                                    (binsof(cp_sew) intersect {32});
    //      ignore_bins IGNORE_LMUL0125_SEW64 = (binsof(cp_lmul) intersect {1} ) &&
		//			                                    (binsof(cp_sew) intersect {64});
    //      ignore_bins IGNORE_LMUL025_SEW32 = (binsof(cp_lmul) intersect {2} ) &&
		//			                                    (binsof(cp_sew) intersect {32});
    //      ignore_bins IGNORE_LMUL025_SEW64 = (binsof(cp_lmul) intersect {2} ) &&
		//			                                    (binsof(cp_sew) intersect {64});
    //      ignore_bins IGNORE_LMUL05_SEW64  = (binsof(cp_lmul) intersect {3} ) &&
		//			                                    (binsof(cp_sew) intersect {64});
		//}
  `CG_END

  `V_INSTR_CG_BEGIN(vmax)
	  cp_vl   : coverpoint instr.find_vl{
			     bins vl0 = {0};
					 bins vl0vlmax = {[1:127]};
					 bins vlmax = {128};
				 }
    cp_lmul : coverpoint instr.find_int_lmul{
           bins m0125 = {1}; 
           bins m025 = {2}; 
           bins m05 = {3}; 
           bins m1 = {4}; 
           bins m2 = {5}; 
           bins m4 = {6}; 
           bins m8 = {7}; 
        }
    cp_sew : coverpoint instr.find_sew{
           bins e8 = {8}; 
           bins e16 = {16}; 
           bins e32 = {32}; 
           bins e64 = {64}; 
        }
    //cp_variant : coverpoint instr.find_int_va_variant{
    //       bins VV = {1}; 
    //       bins VX = {3}; 
    //    }
    //cp_lmul_sew : cross cp_lmul, cp_sew{
    //      ignore_bins IGNORE_LMUL0125_SEW16 = (binsof(cp_lmul) intersect {1} ) &&
		//			                                    (binsof(cp_sew) intersect {16});
    //      ignore_bins IGNORE_LMUL0125_SEW32 = (binsof(cp_lmul) intersect {1} ) &&
		//			                                    (binsof(cp_sew) intersect {32});
    //      ignore_bins IGNORE_LMUL0125_SEW64 = (binsof(cp_lmul) intersect {1} ) &&
		//			                                    (binsof(cp_sew) intersect {64});
    //      ignore_bins IGNORE_LMUL025_SEW32 = (binsof(cp_lmul) intersect {2} ) &&
		//			                                    (binsof(cp_sew) intersect {32});
    //      ignore_bins IGNORE_LMUL025_SEW64 = (binsof(cp_lmul) intersect {2} ) &&
		//			                                    (binsof(cp_sew) intersect {64});
    //      ignore_bins IGNORE_LMUL05_SEW64  = (binsof(cp_lmul) intersect {3} ) &&
		//			                                    (binsof(cp_sew) intersect {64});
		//}
  `CG_END

  `V_INSTR_CG_BEGIN(vmul)
	  cp_vl   : coverpoint instr.find_vl{
			     bins vl0 = {0};
					 bins vl0vlmax = {[1:63]};
					 bins vlmax = {64};
				 }
    cp_lmul : coverpoint instr.find_int_lmul{
           bins m0125 = {1}; 
           bins m025 = {2}; 
           bins m05 = {3}; 
           bins m1 = {4}; 
           bins m2 = {5}; 
           bins m4 = {6}; 
           bins m8 = {7}; 
        }
    cp_sew : coverpoint instr.find_sew{
           bins e8 = {8}; 
           bins e16 = {16}; 
           bins e32 = {32}; 
           bins e64 = {64}; 
        }
    //cp_variant : coverpoint instr.find_int_va_variant{
    //       bins VV = {1}; 
    //       bins VX = {3}; 
    //    }
  `CG_END

  `V_INSTR_CG_BEGIN(vmulh)
	  cp_vl   : coverpoint instr.find_vl{
			     bins vl0 = {0};
					 bins vl0vlmax = {[1:63]};
					 bins vlmax = {64};
				 }
    cp_lmul : coverpoint instr.find_int_lmul{
           bins m0125 = {1}; 
           bins m025 = {2}; 
           bins m05 = {3}; 
           bins m1 = {4}; 
           bins m2 = {5}; 
           bins m4 = {6}; 
           bins m8 = {7}; 
        }
    cp_sew : coverpoint instr.find_sew{
           bins e8 = {8}; 
           bins e16 = {16}; 
           bins e32 = {32}; 
           bins e64 = {64}; 
        }
    //cp_variant : coverpoint instr.find_int_va_variant{
    //       bins VV = {1}; 
    //       bins VX = {3}; 
    //    }
  `CG_END

  `V_INSTR_CG_BEGIN(vmulhu)
	  cp_vl   : coverpoint instr.find_vl{
			     bins vl0 = {0};
					 bins vl0vlmax = {[1:63]};
					 bins vlmax = {64};
				 }
    cp_lmul : coverpoint instr.find_int_lmul{
           bins m0125 = {1}; 
           bins m025 = {2}; 
           bins m05 = {3}; 
           bins m1 = {4}; 
           bins m2 = {5}; 
           bins m4 = {6}; 
           bins m8 = {7}; 
        }
    cp_sew : coverpoint instr.find_sew{
           bins e8 = {8}; 
           bins e16 = {16}; 
           bins e32 = {32}; 
           bins e64 = {64}; 
        }
    //cp_variant : coverpoint instr.find_int_va_variant{
    //       bins VV = {1}; 
    //       bins VX = {3}; 
    //    }
  `CG_END

  `V_INSTR_CG_BEGIN(vmulhsu)
	  cp_vl   : coverpoint instr.find_vl{
			     bins vl0 = {0};
					 bins vl0vlmax = {[1:63]};
					 bins vlmax = {64};
				 }
    cp_lmul : coverpoint instr.find_int_lmul{
           bins m0125 = {1}; 
           bins m025 = {2}; 
           bins m05 = {3}; 
           bins m1 = {4}; 
           bins m2 = {5}; 
           bins m4 = {6}; 
           bins m8 = {7}; 
        }
    cp_sew : coverpoint instr.find_sew{
           bins e8 = {8}; 
           bins e16 = {16}; 
           bins e32 = {32}; 
           bins e64 = {64}; 
        }
    //cp_variant : coverpoint instr.find_int_va_variant{
    //       bins VV = {1}; 
    //       bins VX = {3}; 
    //    }
  `CG_END

  `V_INSTR_CG_BEGIN(vdivu)
	  cp_vl   : coverpoint instr.find_vl{
			     bins vl0 = {0};
					 bins vl0vlmax = {[1:127]};
					 bins vlmax = {128};
				 }
    cp_lmul : coverpoint instr.find_int_lmul{
           bins m0125 = {1}; 
           bins m025 = {2}; 
           bins m05 = {3}; 
           bins m1 = {4}; 
           bins m2 = {5}; 
           bins m4 = {6}; 
           bins m8 = {7}; 
        }
    cp_sew : coverpoint instr.find_sew{
           bins e8 = {8}; 
           bins e16 = {16}; 
           bins e32 = {32}; 
           bins e64 = {64}; 
        }
    //cp_variant : coverpoint instr.find_int_va_variant{
    //       bins VV = {1}; 
    //       bins VX = {3}; 
    //    }
  `CG_END

  `V_INSTR_CG_BEGIN(vdiv)
	  cp_vl   : coverpoint instr.find_vl{
			     bins vl0 = {0};
					 bins vl0vlmax = {[1:127]};
					 bins vlmax = {128};
				 }
    cp_lmul : coverpoint instr.find_int_lmul{
           bins m0125 = {1}; 
           bins m025 = {2}; 
           bins m05 = {3}; 
           bins m1 = {4}; 
           bins m2 = {5}; 
           bins m4 = {6}; 
           bins m8 = {7}; 
        }
    cp_sew : coverpoint instr.find_sew{
           bins e8 = {8}; 
           bins e16 = {16}; 
           bins e32 = {32}; 
           bins e64 = {64}; 
        }
    //cp_variant : coverpoint instr.find_int_va_variant{
    //       bins VV = {1}; 
    //       bins VX = {3}; 
    //    }
  `CG_END

  `V_INSTR_CG_BEGIN(vremu)
	  cp_vl   : coverpoint instr.find_vl{
			     bins vl0 = {0};
					 bins vl0vlmax = {[1:127]};
					 bins vlmax = {128};
				 }
    cp_lmul : coverpoint instr.find_int_lmul{
           bins m0125 = {1}; 
           bins m025 = {2}; 
           bins m05 = {3}; 
           bins m1 = {4}; 
           bins m2 = {5}; 
           bins m4 = {6}; 
           bins m8 = {7}; 
        }
    cp_sew : coverpoint instr.find_sew{
           bins e8 = {8}; 
           bins e16 = {16}; 
           bins e32 = {32}; 
           bins e64 = {64}; 
        }
    //cp_variant : coverpoint instr.find_int_va_variant{
    //       bins VV = {1}; 
    //       bins VX = {3}; 
    //    }
  `CG_END

  `V_INSTR_CG_BEGIN(vrem)
	  cp_vl   : coverpoint instr.find_vl{
			     bins vl0 = {0};
					 bins vl0vlmax = {[1:127]};
					 bins vlmax = {128};
				 }
    cp_lmul : coverpoint instr.find_int_lmul{
           bins m0125 = {1}; 
           bins m025 = {2}; 
           bins m05 = {3}; 
           bins m1 = {4}; 
           bins m2 = {5}; 
           bins m4 = {6}; 
           bins m8 = {7}; 
        }
    cp_sew : coverpoint instr.find_sew{
           bins e8 = {8}; 
           bins e16 = {16}; 
           bins e32 = {32}; 
           bins e64 = {64}; 
        }
    //cp_variant : coverpoint instr.find_int_va_variant{
    //       bins VV = {1}; 
    //       bins VX = {3}; 
    //    }
  `CG_END

  `V_INSTR_CG_BEGIN(vwmulu)
	  cp_vl   : coverpoint instr.find_vl{
			     bins vl0 = {0};
					 bins vl0vlmax = {[1:63]};
					 bins vlmax = {64};
				 }
    cp_lmul : coverpoint instr.find_int_lmul{
           bins m0125 = {1}; 
           bins m025 = {2}; 
           bins m05 = {3}; 
           bins m1 = {4}; 
           bins m2 = {5}; 
           bins m4 = {6}; 
           bins m8 = {7}; 
        }
    cp_sew : coverpoint instr.find_sew{
           bins e8 = {8}; 
           bins e16 = {16}; 
           bins e32 = {32}; 
           bins e64 = {64}; 
        }
    //cp_variant : coverpoint instr.find_int_va_variant{
    //       bins VV = {1}; 
    //       bins VX = {3}; 
    //    }
  `CG_END

  `V_INSTR_CG_BEGIN(vwmul)
	  cp_vl   : coverpoint instr.find_vl{
			     bins vl0 = {0};
					 bins vl0vlmax = {[1:63]};
					 bins vlmax = {64};
				 }
    cp_lmul : coverpoint instr.find_int_lmul{
           bins m0125 = {1}; 
           bins m025 = {2}; 
           bins m05 = {3}; 
           bins m1 = {4}; 
           bins m2 = {5}; 
           bins m4 = {6}; 
           bins m8 = {7}; 
        }
    cp_sew : coverpoint instr.find_sew{
           bins e8 = {8}; 
           bins e16 = {16}; 
           bins e32 = {32}; 
           bins e64 = {64}; 
        }
    //cp_variant : coverpoint instr.find_int_va_variant{
    //       bins VV = {1}; 
    //       bins VX = {3}; 
    //    }
  `CG_END

  `V_INSTR_CG_BEGIN(vwmulsu)
	  cp_vl   : coverpoint instr.find_vl{
			     bins vl0 = {0};
					 bins vl0vlmax = {[1:63]};
					 bins vlmax = {64};
				 }
    cp_lmul : coverpoint instr.find_int_lmul{
           bins m0125 = {1}; 
           bins m025 = {2}; 
           bins m05 = {3}; 
           bins m1 = {4}; 
           bins m2 = {5}; 
           bins m4 = {6}; 
           bins m8 = {7}; 
        }
    cp_sew : coverpoint instr.find_sew{
           bins e8 = {8}; 
           bins e16 = {16}; 
           bins e32 = {32}; 
           bins e64 = {64}; 
        }
    //cp_variant : coverpoint instr.find_int_va_variant{
    //       bins VV = {1}; 
    //       bins VX = {3}; 
    //    }
  `CG_END

  `V_INSTR_CG_BEGIN(vmacc)
	  cp_vl   : coverpoint instr.find_vl{
			     bins vl0 = {0};
					 bins vl0vlmax = {[1:127]};
					 bins vlmax = {128};
				 }
    cp_lmul : coverpoint instr.find_int_lmul{
           bins m0125 = {1}; 
           bins m025 = {2}; 
           bins m05 = {3}; 
           bins m1 = {4}; 
           bins m2 = {5}; 
           bins m4 = {6}; 
           bins m8 = {7}; 
        }
    cp_sew : coverpoint instr.find_sew{
           bins e8 = {8}; 
           bins e16 = {16}; 
           bins e32 = {32}; 
           bins e64 = {64}; 
        }
    //cp_variant : coverpoint instr.find_int_va_variant{
    //       bins VV = {1}; 
    //       bins VX = {3}; 
    //    }
  `CG_END

  `V_INSTR_CG_BEGIN(vnmsac)
	  cp_vl   : coverpoint instr.find_vl{
			     bins vl0 = {0};
					 bins vl0vlmax = {[1:63]};
					 bins vlmax = {64};
				 }
    cp_lmul : coverpoint instr.find_int_lmul{
           bins m0125 = {1}; 
           bins m025 = {2}; 
           bins m05 = {3}; 
           bins m1 = {4}; 
           bins m2 = {5}; 
           bins m4 = {6}; 
           bins m8 = {7}; 
        }
    cp_sew : coverpoint instr.find_sew{
           bins e8 = {8}; 
           bins e16 = {16}; 
           bins e32 = {32}; 
           bins e64 = {64}; 
        }
    //cp_variant : coverpoint instr.find_int_va_variant{
    //       bins VV = {1}; 
    //       bins VX = {3}; 
    //    }
  `CG_END

  `V_INSTR_CG_BEGIN(vmadd)
	  cp_vl   : coverpoint instr.find_vl{
			     bins vl0 = {0};
					 bins vl0vlmax = {[1:63]};
					 bins vlmax = {64};
				 }
    cp_lmul : coverpoint instr.find_int_lmul{
           bins m0125 = {1}; 
           bins m025 = {2}; 
           bins m05 = {3}; 
           bins m1 = {4}; 
           bins m2 = {5}; 
           bins m4 = {6}; 
           bins m8 = {7}; 
        }
    cp_sew : coverpoint instr.find_sew{
           bins e8 = {8}; 
           bins e16 = {16}; 
           bins e32 = {32}; 
           bins e64 = {64}; 
        }
    //cp_variant : coverpoint instr.find_int_va_variant{
    //       bins VV = {1}; 
    //       bins VX = {3}; 
    //    }
  `CG_END

  `V_INSTR_CG_BEGIN(vnmsub)
	  cp_vl   : coverpoint instr.find_vl{
			     bins vl0 = {0};
					 bins vl0vlmax = {[1:63]};
					 bins vlmax = {64};
				 }
    cp_lmul : coverpoint instr.find_int_lmul{
           bins m0125 = {1}; 
           bins m025 = {2}; 
           bins m05 = {3}; 
           bins m1 = {4}; 
           bins m2 = {5}; 
           bins m4 = {6}; 
           bins m8 = {7}; 
        }
    cp_sew : coverpoint instr.find_sew{
           bins e8 = {8}; 
           bins e16 = {16}; 
           bins e32 = {32}; 
           bins e64 = {64}; 
        }
    //cp_variant : coverpoint instr.find_int_va_variant{
    //       bins VV = {1}; 
    //       bins VX = {3}; 
    //    }
  `CG_END

  `V_INSTR_CG_BEGIN(vwmaccu)
	  cp_vl   : coverpoint instr.find_vl{
			     bins vl0 = {0};
					 bins vl0vlmax = {[1:63]};
					 bins vlmax = {64};
				 }
    cp_lmul : coverpoint instr.find_int_lmul{
           bins m0125 = {1}; 
           bins m025 = {2}; 
           bins m05 = {3}; 
           bins m1 = {4}; 
           bins m2 = {5}; 
           bins m4 = {6}; 
           bins m8 = {7}; 
        }
    cp_sew : coverpoint instr.find_sew{
           bins e8 = {8}; 
           bins e16 = {16}; 
           bins e32 = {32}; 
           bins e64 = {64}; 
        }
    //cp_variant : coverpoint instr.find_int_va_variant{
    //       bins VV = {1}; 
    //       bins VX = {3}; 
    //    }
    //cp_lmul_sew : cross cp_lmul, cp_sew{
    //      ignore_bins IGNORE_LMUL0125_SEW16 = (binsof(cp_lmul) intersect {1} ) &&
		//			                                    (binsof(cp_sew) intersect {16});
    //      ignore_bins IGNORE_LMUL0125_SEW32 = (binsof(cp_lmul) intersect {1} ) &&
		//			                                    (binsof(cp_sew) intersect {32});
    //      ignore_bins IGNORE_LMUL025_SEW32 = (binsof(cp_lmul) intersect {2} ) &&
		//			                                    (binsof(cp_sew) intersect {32});
		//}
  `CG_END

  `V_INSTR_CG_BEGIN(vwmacc)
	  cp_vl   : coverpoint instr.find_vl{
			     bins vl0 = {0};
					 bins vl0vlmax = {[1:63]};
					 bins vlmax = {64};
				 }
    cp_lmul : coverpoint instr.find_int_lmul{
           bins m0125 = {1}; 
           bins m025 = {2}; 
           bins m05 = {3}; 
           bins m1 = {4}; 
           bins m2 = {5}; 
           bins m4 = {6}; 
           bins m8 = {7}; 
        }
    cp_sew : coverpoint instr.find_sew{
           bins e8 = {8}; 
           bins e16 = {16}; 
           bins e32 = {32}; 
           bins e64 = {64}; 
        }
    //cp_variant : coverpoint instr.find_int_va_variant{
    //       bins VV = {1}; 
    //       bins VX = {3}; 
    //    }
    //cp_lmul_sew : cross cp_lmul, cp_sew{
    //      ignore_bins IGNORE_LMUL0125_SEW16 = (binsof(cp_lmul) intersect {1} ) &&
		//			                                    (binsof(cp_sew) intersect {16});
    //      ignore_bins IGNORE_LMUL0125_SEW32 = (binsof(cp_lmul) intersect {1} ) &&
		//			                                    (binsof(cp_sew) intersect {32});
    //      ignore_bins IGNORE_LMUL025_SEW32 = (binsof(cp_lmul) intersect {2} ) &&
		//			                                    (binsof(cp_sew) intersect {32});
		//}
  `CG_END

  `V_INSTR_CG_BEGIN(vwmaccsu)
	  cp_vl   : coverpoint instr.find_vl{
			     bins vl0 = {0};
					 bins vl0vlmax = {[1:63]};
					 bins vlmax = {64};
				 }
    cp_lmul : coverpoint instr.find_int_lmul{
           bins m0125 = {1}; 
           bins m025 = {2}; 
           bins m05 = {3}; 
           bins m1 = {4}; 
           bins m2 = {5}; 
           bins m4 = {6}; 
           bins m8 = {7}; 
        }
    cp_sew : coverpoint instr.find_sew{
           bins e8 = {8}; 
           bins e16 = {16}; 
           bins e32 = {32}; 
           bins e64 = {64}; 
        }
    //cp_variant : coverpoint instr.find_int_va_variant{
    //       bins VV = {1}; 
    //       bins VX = {3}; 
    //    }
    //cp_lmul_sew : cross cp_lmul, cp_sew{
    //      ignore_bins IGNORE_LMUL0125_SEW16 = (binsof(cp_lmul) intersect {1} ) &&
		//			                                    (binsof(cp_sew) intersect {16});
    //      ignore_bins IGNORE_LMUL0125_SEW32 = (binsof(cp_lmul) intersect {1} ) &&
		//			                                    (binsof(cp_sew) intersect {32});
    //      ignore_bins IGNORE_LMUL025_SEW32 = (binsof(cp_lmul) intersect {2} ) &&
		//			                                    (binsof(cp_sew) intersect {32});
		//}
  `CG_END

  `V_INSTR_CG_BEGIN(vwmaccus)
	  cp_vl   : coverpoint instr.find_vl{
			     bins vl0 = {0};
					 bins vl0vlmax = {[1:63]};
					 bins vlmax = {64};
				 }
    cp_lmul : coverpoint instr.find_int_lmul{
           bins m0125 = {1}; 
           bins m025 = {2}; 
           bins m05 = {3}; 
           bins m1 = {4}; 
           bins m2 = {5}; 
           bins m4 = {6}; 
           bins m8 = {7}; 
        }
    cp_sew : coverpoint instr.find_sew{
           bins e8 = {8}; 
           bins e16 = {16}; 
           bins e32 = {32}; 
           bins e64 = {64}; 
        }
    //cp_variant : coverpoint instr.find_int_va_variant{
    //       bins VX = {3}; 
    //    }
    //cp_lmul_sew : cross cp_lmul, cp_sew{
    //      ignore_bins IGNORE_LMUL0125_SEW16 = (binsof(cp_lmul) intersect {1} ) &&
		//			                                    (binsof(cp_sew) intersect {16});
    //      ignore_bins IGNORE_LMUL0125_SEW32 = (binsof(cp_lmul) intersect {1} ) &&
		//			                                    (binsof(cp_sew) intersect {32});
    //      ignore_bins IGNORE_LMUL025_SEW32 = (binsof(cp_lmul) intersect {2} ) &&
		//			                                    (binsof(cp_sew) intersect {32});
		//}
  `CG_END

  `V_INSTR_CG_BEGIN(vmerge)
	  cp_vl   : coverpoint instr.find_vl{
			     bins vl0 = {0};
					 bins vl0vlmax = {[1:127]};
					 bins vlmax = {128};
				 }
    cp_lmul : coverpoint instr.find_int_lmul{
           bins m0125 = {1}; 
           bins m025 = {2}; 
           bins m05 = {3}; 
           bins m1 = {4}; 
           bins m2 = {5}; 
           bins m4 = {6}; 
           bins m8 = {7}; 
        }
    cp_sew : coverpoint instr.find_sew{
           bins e8 = {8}; 
           bins e16 = {16}; 
           bins e32 = {32}; 
           bins e64 = {64}; 
        }
    //cp_variant : coverpoint instr.find_int_va_variant{
    //       bins VVM = {9}; 
    //       bins VXM = {11}; 
    //       bins VIM = {10}; 
    //    }
    //cp_lmul_sew : cross cp_lmul, cp_sew{
    //      ignore_bins IGNORE_LMUL0125_SEW16 = (binsof(cp_lmul) intersect {1} ) &&
		//			                                    (binsof(cp_sew) intersect {16});
    //      ignore_bins IGNORE_LMUL0125_SEW32 = (binsof(cp_lmul) intersect {1} ) &&
		//			                                    (binsof(cp_sew) intersect {32});
    //      ignore_bins IGNORE_LMUL0125_SEW64 = (binsof(cp_lmul) intersect {1} ) &&
		//			                                    (binsof(cp_sew) intersect {64});
    //      ignore_bins IGNORE_LMUL025_SEW32 = (binsof(cp_lmul) intersect {2} ) &&
		//			                                    (binsof(cp_sew) intersect {32});
    //      ignore_bins IGNORE_LMUL025_SEW64 = (binsof(cp_lmul) intersect {2} ) &&
		//			                                    (binsof(cp_sew) intersect {64});
    //      ignore_bins IGNORE_LMUL05_SEW64  = (binsof(cp_lmul) intersect {3} ) &&
		//			                                    (binsof(cp_sew) intersect {64});
		//}
  `CG_END

  `V_INSTR_CG_BEGIN(vmv)
	  cp_vl   : coverpoint instr.find_vl{
			     bins vl0 = {0};
					 bins vl0vlmax = {[1:127]};
					 bins vlmax = {128};
				 }
    cp_lmul : coverpoint instr.find_int_lmul{
           bins m0125 = {1}; 
           bins m025 = {2}; 
           bins m05 = {3}; 
           bins m1 = {4}; 
           bins m2 = {5}; 
           bins m4 = {6}; 
           bins m8 = {7}; 
        }
    cp_sew : coverpoint instr.find_sew{
           bins e8 = {8}; 
           bins e16 = {16}; 
           bins e32 = {32}; 
           bins e64 = {64}; 
        }
    //cp_variant : coverpoint instr.find_int_va_variant{
    //       bins VV = {1}; 
    //       bins VX = {3}; 
    //       bins VI = {2}; 
    //    }
    //cp_lmul_sew : cross cp_lmul, cp_sew{
    //      ignore_bins IGNORE_LMUL0125_SEW16 = (binsof(cp_lmul) intersect {1} ) &&
		//			                                    (binsof(cp_sew) intersect {16});
    //      ignore_bins IGNORE_LMUL0125_SEW32 = (binsof(cp_lmul) intersect {1} ) &&
		//			                                    (binsof(cp_sew) intersect {32});
    //      ignore_bins IGNORE_LMUL0125_SEW64 = (binsof(cp_lmul) intersect {1} ) &&
		//			                                    (binsof(cp_sew) intersect {64});
    //      ignore_bins IGNORE_LMUL025_SEW32 = (binsof(cp_lmul) intersect {2} ) &&
		//			                                    (binsof(cp_sew) intersect {32});
    //      ignore_bins IGNORE_LMUL025_SEW64 = (binsof(cp_lmul) intersect {2} ) &&
		//			                                    (binsof(cp_sew) intersect {64});
    //      ignore_bins IGNORE_LMUL05_SEW64  = (binsof(cp_lmul) intersect {3} ) &&
		//			                                    (binsof(cp_sew) intersect {64});
		//}
  `CG_END

  `V_INSTR_CG_BEGIN(vsaddu)
	  cp_vl   : coverpoint instr.find_vl{
			     bins vl0 = {0};
					 bins vl0vlmax = {[1:127]};
					 bins vlmax = {128};
				 }
		cp_vxrm  : coverpoint instr.find_vxrm[1:0];
		cp_vxsat  : coverpoint instr.find_vxsat[0];
    cp_lmul : coverpoint instr.find_int_lmul{
           bins m0125 = {1}; 
           bins m025 = {2}; 
           bins m05 = {3}; 
           bins m1 = {4}; 
           bins m2 = {5}; 
           bins m4 = {6}; 
           bins m8 = {7}; 
        }
    cp_sew : coverpoint instr.find_sew{
           bins e8 = {8}; 
           bins e16 = {16}; 
           bins e32 = {32}; 
           bins e64 = {64}; 
        }
    //cp_variant : coverpoint instr.find_int_va_variant{
    //       bins VV = {1}; 
    //       bins VX = {3}; 
    //       bins VI = {2}; 
    //    }
  `CG_END

  `V_INSTR_CG_BEGIN(vsadd)
	  cp_vl   : coverpoint instr.find_vl{
			     bins vl0 = {0};
					 bins vl0vlmax = {[1:127]};
					 bins vlmax = {128};
				 }
		cp_vxrm  : coverpoint instr.find_vxrm[1:0];
		cp_vxsat  : coverpoint instr.find_vxsat[0];
    cp_lmul : coverpoint instr.find_int_lmul{
           bins m0125 = {1}; 
           bins m025 = {2}; 
           bins m05 = {3}; 
           bins m1 = {4}; 
           bins m2 = {5}; 
           bins m4 = {6}; 
           bins m8 = {7}; 
        }
    cp_sew : coverpoint instr.find_sew{
           bins e8 = {8}; 
           bins e16 = {16}; 
           bins e32 = {32}; 
           bins e64 = {64}; 
        }
    //cp_variant : coverpoint instr.find_int_va_variant{
    //       bins VV = {1}; 
    //       bins VX = {3}; 
    //       bins VI = {2}; 
    //    }
  `CG_END

  `V_INSTR_CG_BEGIN(vssubu)
	  cp_vl   : coverpoint instr.find_vl{
			     bins vl0 = {0};
					 bins vl0vlmax = {[1:127]};
					 bins vlmax = {128};
				 }
		cp_vxrm  : coverpoint instr.find_vxrm[1:0];
		cp_vxsat  : coverpoint instr.find_vxsat[0];
    cp_lmul : coverpoint instr.find_int_lmul{
           bins m0125 = {1}; 
           bins m025 = {2}; 
           bins m05 = {3}; 
           bins m1 = {4}; 
           bins m2 = {5}; 
           bins m4 = {6}; 
           bins m8 = {7}; 
        }
    cp_sew : coverpoint instr.find_sew{
           bins e8 = {8}; 
           bins e16 = {16}; 
           bins e32 = {32}; 
           bins e64 = {64}; 
        }
    //cp_variant : coverpoint instr.find_int_va_variant{
    //       bins VV = {1}; 
    //       bins VX = {3}; 
    //    }
  `CG_END

  `V_INSTR_CG_BEGIN(vssub)
	  cp_vl   : coverpoint instr.find_vl{
			     bins vl0 = {0};
					 bins vl0vlmax = {[1:127]};
					 bins vlmax = {128};
				 }
		cp_vxrm  : coverpoint instr.find_vxrm[1:0];
		cp_vxsat  : coverpoint instr.find_vxsat[0];
    cp_lmul : coverpoint instr.find_int_lmul{
           bins m0125 = {1}; 
           bins m025 = {2}; 
           bins m05 = {3}; 
           bins m1 = {4}; 
           bins m2 = {5}; 
           bins m4 = {6}; 
           bins m8 = {7}; 
        }
    cp_sew : coverpoint instr.find_sew{
           bins e8 = {8}; 
           bins e16 = {16}; 
           bins e32 = {32}; 
           bins e64 = {64}; 
        }
    //cp_variant : coverpoint instr.find_int_va_variant{
    //       bins VV = {1}; 
    //       bins VX = {3}; 
    //    }
  `CG_END

  `V_INSTR_CG_BEGIN(vaaddu)
	  cp_vl   : coverpoint instr.find_vl{
			     bins vl0 = {0};
					 bins vl0vlmax = {[1:127]};
					 bins vlmax = {128};
				 }
		cp_vxrm  : coverpoint instr.find_vxrm[1:0];
		cp_vxsat  : coverpoint instr.find_vxsat[0];
    cp_lmul : coverpoint instr.find_int_lmul{
           bins m0125 = {1}; 
           bins m025 = {2}; 
           bins m05 = {3}; 
           bins m1 = {4}; 
           bins m2 = {5}; 
           bins m4 = {6}; 
           bins m8 = {7}; 
        }
    cp_sew : coverpoint instr.find_sew{
           bins e8 = {8}; 
           bins e16 = {16}; 
           bins e32 = {32}; 
           bins e64 = {64}; 
        }
    //cp_variant : coverpoint instr.find_int_va_variant{
    //       bins VV = {1}; 
    //       bins VX = {3}; 
    //    }
  `CG_END

  `V_INSTR_CG_BEGIN(vaadd)
	  cp_vl   : coverpoint instr.find_vl{
			     bins vl0 = {0};
					 bins vl0vlmax = {[1:127]};
					 bins vlmax = {128};
				 }
		cp_vxrm  : coverpoint instr.find_vxrm[1:0];
		cp_vxsat  : coverpoint instr.find_vxsat[0];
    cp_lmul : coverpoint instr.find_int_lmul{
           bins m0125 = {1}; 
           bins m025 = {2}; 
           bins m05 = {3}; 
           bins m1 = {4}; 
           bins m2 = {5}; 
           bins m4 = {6}; 
           bins m8 = {7}; 
        }
    cp_sew : coverpoint instr.find_sew{
           bins e8 = {8}; 
           bins e16 = {16}; 
           bins e32 = {32}; 
           bins e64 = {64}; 
        }
    //cp_variant : coverpoint instr.find_int_va_variant{
    //       bins VV = {1}; 
    //       bins VX = {3}; 
    //    }
  `CG_END

  `V_INSTR_CG_BEGIN(vasubu)
	  cp_vl   : coverpoint instr.find_vl{
			     bins vl0 = {0};
					 bins vl0vlmax = {[1:127]};
					 bins vlmax = {128};
				 }
		cp_vxrm  : coverpoint instr.find_vxrm[1:0];
		cp_vxsat  : coverpoint instr.find_vxsat[0];
    cp_lmul : coverpoint instr.find_int_lmul{
           bins m0125 = {1}; 
           bins m025 = {2}; 
           bins m05 = {3}; 
           bins m1 = {4}; 
           bins m2 = {5}; 
           bins m4 = {6}; 
           bins m8 = {7}; 
        }
    cp_sew : coverpoint instr.find_sew{
           bins e8 = {8}; 
           bins e16 = {16}; 
           bins e32 = {32}; 
           bins e64 = {64}; 
        }
    //cp_variant : coverpoint instr.find_int_va_variant{
    //       bins VV = {1}; 
    //       bins VX = {3}; 
    //    }
  `CG_END

  `V_INSTR_CG_BEGIN(vasub)
	  cp_vl   : coverpoint instr.find_vl{
			     bins vl0 = {0};
					 bins vl0vlmax = {[1:127]};
					 bins vlmax = {128};
				 }
		cp_vxrm  : coverpoint instr.find_vxrm[1:0];
		cp_vxsat  : coverpoint instr.find_vxsat[0];
    cp_lmul : coverpoint instr.find_int_lmul{
           bins m0125 = {1}; 
           bins m025 = {2}; 
           bins m05 = {3}; 
           bins m1 = {4}; 
           bins m2 = {5}; 
           bins m4 = {6}; 
           bins m8 = {7}; 
        }
    cp_sew : coverpoint instr.find_sew{
           bins e8 = {8}; 
           bins e16 = {16}; 
           bins e32 = {32}; 
           bins e64 = {64}; 
        }
    //cp_variant : coverpoint instr.find_int_va_variant{
    //       bins VV = {1}; 
    //       bins VX = {3}; 
    //    }
  `CG_END

  `V_INSTR_CG_BEGIN(vsmul)
	  cp_vl   : coverpoint instr.find_vl{
			     bins vl0 = {0};
					 bins vl0vlmax = {[1:63]};
					 bins vlmax = {64};
				 }
		cp_vxrm  : coverpoint instr.find_vxrm[1:0];
		cp_vxsat  : coverpoint instr.find_vxsat[0];
    cp_lmul : coverpoint instr.find_int_lmul{
           bins m0125 = {1}; 
           bins m025 = {2}; 
           bins m05 = {3}; 
           bins m1 = {4}; 
           bins m2 = {5}; 
           bins m4 = {6}; 
           bins m8 = {7}; 
        }
    cp_sew : coverpoint instr.find_sew{
           bins e8 = {8}; 
           bins e16 = {16}; 
           bins e32 = {32}; 
           bins e64 = {64}; 
        }
    //cp_variant : coverpoint instr.find_int_va_variant{
    //       bins VV = {1}; 
    //       bins VX = {3}; 
    //    }
  `CG_END

  `V_INSTR_CG_BEGIN(vssrl)
	  cp_vl   : coverpoint instr.find_vl{
			     bins vl0 = {0};
					 bins vl0vlmax = {[1:127]};
					 bins vlmax = {128};
				 }
		cp_vxrm  : coverpoint instr.find_vxrm[1:0];
		cp_vxsat  : coverpoint instr.find_vxsat[0];
    cp_lmul : coverpoint instr.find_int_lmul{
           bins m0125 = {1}; 
           bins m025 = {2}; 
           bins m05 = {3}; 
           bins m1 = {4}; 
           bins m2 = {5}; 
           bins m4 = {6}; 
           bins m8 = {7}; 
        }
    cp_sew : coverpoint instr.find_sew{
           bins e8 = {8}; 
           bins e16 = {16}; 
           bins e32 = {32}; 
           bins e64 = {64}; 
        }
    //cp_variant : coverpoint instr.find_int_va_variant{
    //       bins VV = {1}; 
    //       bins VX = {3}; 
    //       bins VI = {2}; 
    //    }
  `CG_END

  `V_INSTR_CG_BEGIN(vssra)
	  cp_vl   : coverpoint instr.find_vl{
			     bins vl0 = {0};
					 bins vl0vlmax = {[1:127]};
					 bins vlmax = {128};
				 }
		cp_vxrm  : coverpoint instr.find_vxrm[1:0];
		cp_vxsat  : coverpoint instr.find_vxsat[0];
    cp_lmul : coverpoint instr.find_int_lmul{
           bins m0125 = {1}; 
           bins m025 = {2}; 
           bins m05 = {3}; 
           bins m1 = {4}; 
           bins m2 = {5}; 
           bins m4 = {6}; 
           bins m8 = {7}; 
        }
    cp_sew : coverpoint instr.find_sew{
           bins e8 = {8}; 
           bins e16 = {16}; 
           bins e32 = {32}; 
           bins e64 = {64}; 
        }
    //cp_variant : coverpoint instr.find_int_va_variant{
    //       bins VV = {1}; 
    //       bins VX = {3}; 
    //       bins VI = {2}; 
    //    }
  `CG_END

  `V_INSTR_CG_BEGIN(vnclipu)
	  cp_vl   : coverpoint instr.find_vl{
			     bins vl0 = {0};
					 bins vl0vlmax = {[1:63]};
					 bins vlmax = {64};
				 }
		cp_vxrm  : coverpoint instr.find_vxrm[1:0];
		cp_vxsat  : coverpoint instr.find_vxsat[0];
    cp_lmul : coverpoint instr.find_int_lmul{
           bins m0125 = {1}; 
           bins m025 = {2}; 
           bins m05 = {3}; 
           bins m1 = {4}; 
           bins m2 = {5}; 
           bins m4 = {6}; 
           bins m8 = {7}; 
        }
    cp_sew : coverpoint instr.find_sew{
           bins e8 = {8}; 
           bins e16 = {16}; 
           bins e32 = {32}; 
           bins e64 = {64}; 
        }
    //cp_variant : coverpoint instr.find_int_va_variant{
    //       bins WV = {5}; 
    //       bins WX = {7}; 
    //       bins WI = {6}; 
    //    }
  `CG_END

  `V_INSTR_CG_BEGIN(vnclip)
	  cp_vl   : coverpoint instr.find_vl{
			     bins vl0 = {0};
					 bins vl0vlmax = {[1:63]};
					 bins vlmax = {64};
				 }
		cp_vxrm  : coverpoint instr.find_vxrm[1:0];
		cp_vxsat  : coverpoint instr.find_vxsat[0];
    cp_lmul : coverpoint instr.find_int_lmul{
           bins m0125 = {1}; 
           bins m025 = {2}; 
           bins m05 = {3}; 
           bins m1 = {4}; 
           bins m2 = {5}; 
           bins m4 = {6}; 
           bins m8 = {7}; 
        }
    cp_sew : coverpoint instr.find_sew{
           bins e8 = {8}; 
           bins e16 = {16}; 
           bins e32 = {32}; 
           bins e64 = {64}; 
        }
    //cp_variant : coverpoint instr.find_int_va_variant{
    //       bins WV = {5}; 
    //       bins WX = {7}; 
    //       bins WI = {6}; 
    //    }
  `CG_END


  `V_INSTR_CG_BEGIN(vfadd)
	  cp_vl   : coverpoint instr.find_vl{
			     bins vl0 = {0};
					 bins vl0vlmax = {[1:31]};
					 bins vlmax = {32};
				 }
    cp_frm  : coverpoint instr.find_frm[2:0];
		cp_fflags4  : coverpoint instr.find_fflags[4];
		cp_fflags3  : coverpoint instr.find_fflags[3];
		cp_fflags2  : coverpoint instr.find_fflags[2];
		cp_fflags1  : coverpoint instr.find_fflags[1];
		cp_fflags0  : coverpoint instr.find_fflags[0];
	  cp_lmul : coverpoint instr.find_int_lmul{
           bins m0125 = {1}; 
           bins m025 = {2}; 
           bins m05 = {3}; 
           bins m1 = {4}; 
           bins m2 = {5}; 
           bins m4 = {6}; 
           bins m8 = {7}; 
        }
    cp_sew : coverpoint instr.find_sew{
           bins e8 = {8}; 
           bins e16 = {16}; 
           bins e32 = {32}; 
           bins e64 = {64}; 
        }
    //cp_variant : coverpoint instr.find_int_va_variant{
    //       bins VV = {1}; 
    //       bins VF = {4}; 
    //    }
  `CG_END

  `V_INSTR_CG_BEGIN(vfsub)
	  cp_vl   : coverpoint instr.find_vl{
			     bins vl0 = {0};
					 bins vl0vlmax = {[1:31]};
					 bins vlmax = {32};
				 }
    cp_frm  : coverpoint instr.find_frm[2:0];
		cp_fflags4  : coverpoint instr.find_fflags[4];
		cp_fflags3  : coverpoint instr.find_fflags[3];
		cp_fflags2  : coverpoint instr.find_fflags[2];
		cp_fflags1  : coverpoint instr.find_fflags[1];
		cp_fflags0  : coverpoint instr.find_fflags[0];
    cp_lmul : coverpoint instr.find_int_lmul{
           bins m0125 = {1}; 
           bins m025 = {2}; 
           bins m05 = {3}; 
           bins m1 = {4}; 
           bins m2 = {5}; 
           bins m4 = {6}; 
           bins m8 = {7}; 
        }
    cp_sew : coverpoint instr.find_sew{
           bins e8 = {8}; 
           bins e16 = {16}; 
           bins e32 = {32}; 
           bins e64 = {64}; 
        }
    //cp_variant : coverpoint instr.find_int_va_variant{
    //       bins VV = {1}; 
    //       bins VF = {4}; 
    //    }
  `CG_END

  `V_INSTR_CG_BEGIN(vfrsub)
	  cp_vl   : coverpoint instr.find_vl{
			     bins vl0 = {0};
					 bins vl0vlmax = {[1:31]};
					 bins vlmax = {32};
				 }
    cp_frm  : coverpoint instr.find_frm[2:0];
		cp_fflags4  : coverpoint instr.find_fflags[4];
		cp_fflags3  : coverpoint instr.find_fflags[3];
		cp_fflags2  : coverpoint instr.find_fflags[2];
		cp_fflags1  : coverpoint instr.find_fflags[1];
		cp_fflags0  : coverpoint instr.find_fflags[0];
    cp_lmul : coverpoint instr.find_int_lmul{
           bins m0125 = {1}; 
           bins m025 = {2}; 
           bins m05 = {3}; 
           bins m1 = {4}; 
           bins m2 = {5}; 
           bins m4 = {6}; 
           bins m8 = {7}; 
        }
    cp_sew : coverpoint instr.find_sew{
           bins e8 = {8}; 
           bins e16 = {16}; 
           bins e32 = {32}; 
           bins e64 = {64}; 
        }
    //cp_variant : coverpoint instr.find_int_va_variant{
    //       bins VF = {4}; 
    //    }
  `CG_END

  `V_INSTR_CG_BEGIN(vfwadd)
	  cp_vl   : coverpoint instr.find_vl{
			     bins vl0 = {0};
					 bins vl0vlmax = {[1:15]};
					 bins vlmax = {16};
				 }
    cp_frm  : coverpoint instr.find_frm[2:0];
		cp_fflags4  : coverpoint instr.find_fflags[4];
		cp_fflags3  : coverpoint instr.find_fflags[3];
		cp_fflags2  : coverpoint instr.find_fflags[2];
		cp_fflags1  : coverpoint instr.find_fflags[1];
		cp_fflags0  : coverpoint instr.find_fflags[0];
    cp_lmul : coverpoint instr.find_int_lmul{
           bins m0125 = {1}; 
           bins m025 = {2}; 
           bins m05 = {3}; 
           bins m1 = {4}; 
           bins m2 = {5}; 
           bins m4 = {6}; 
           bins m8 = {7}; 
        }
    cp_sew : coverpoint instr.find_sew{
           bins e8 = {8}; 
           bins e16 = {16}; 
           bins e32 = {32}; 
           bins e64 = {64}; 
        }
    //cp_variant : coverpoint instr.find_int_va_variant{
    //       bins VV = {1}; 
    //       bins VF = {4}; 
    //       bins WV = {5}; 
    //       bins WF = {8}; 
    //    }
  `CG_END

  `V_INSTR_CG_BEGIN(vfwsub)
	  cp_vl   : coverpoint instr.find_vl{
			     bins vl0 = {0};
					 bins vl0vlmax = {[1:15]};
					 bins vlmax = {16};
				 }
    cp_frm  : coverpoint instr.find_frm[2:0];
		cp_fflags4  : coverpoint instr.find_fflags[4];
		cp_fflags3  : coverpoint instr.find_fflags[3];
		cp_fflags2  : coverpoint instr.find_fflags[2];
		cp_fflags1  : coverpoint instr.find_fflags[1];
		cp_fflags0  : coverpoint instr.find_fflags[0];
    cp_lmul : coverpoint instr.find_int_lmul{
           bins m0125 = {1}; 
           bins m025 = {2}; 
           bins m05 = {3}; 
           bins m1 = {4}; 
           bins m2 = {5}; 
           bins m4 = {6}; 
           bins m8 = {7}; 
        }
    cp_sew : coverpoint instr.find_sew{
           bins e8 = {8}; 
           bins e16 = {16}; 
           bins e32 = {32}; 
           bins e64 = {64}; 
        }
    //cp_variant : coverpoint instr.find_int_va_variant{
    //       bins VV = {1}; 
    //       bins VF = {4}; 
    //       bins WV = {5}; 
    //       bins WF = {8}; 
    //    }
  `CG_END

  `V_INSTR_CG_BEGIN(vfmul)
	  cp_vl   : coverpoint instr.find_vl{
			     bins vl0 = {0};
					 bins vl0vlmax = {[1:31]};
					 bins vlmax = {32};
				 }
    cp_frm  : coverpoint instr.find_frm[2:0];
		cp_fflags4  : coverpoint instr.find_fflags[4];
		cp_fflags3  : coverpoint instr.find_fflags[3];
		cp_fflags2  : coverpoint instr.find_fflags[2];
		cp_fflags1  : coverpoint instr.find_fflags[1];
		cp_fflags0  : coverpoint instr.find_fflags[0];
    cp_lmul : coverpoint instr.find_int_lmul{
           bins m0125 = {1}; 
           bins m025 = {2}; 
           bins m05 = {3}; 
           bins m1 = {4}; 
           bins m2 = {5}; 
           bins m4 = {6}; 
           bins m8 = {7}; 
        }
    cp_sew : coverpoint instr.find_sew{
           bins e8 = {8}; 
           bins e16 = {16}; 
           bins e32 = {32}; 
           bins e64 = {64}; 
        }
    //cp_variant : coverpoint instr.find_int_va_variant{
    //       bins VV = {1}; 
    //       bins VF = {4}; 
    //    }
  `CG_END

  `V_INSTR_CG_BEGIN(vfdiv)
	  cp_vl   : coverpoint instr.find_vl{
			     bins vl0 = {0};
					 bins vl0vlmax = {[1:31]};
					 bins vlmax = {32};
				 }
    cp_frm  : coverpoint instr.find_frm[2:0];
		cp_fflags4  : coverpoint instr.find_fflags[4];
		cp_fflags3  : coverpoint instr.find_fflags[3];
		cp_fflags2  : coverpoint instr.find_fflags[2];
		cp_fflags1  : coverpoint instr.find_fflags[1];
		cp_fflags0  : coverpoint instr.find_fflags[0];
    cp_lmul : coverpoint instr.find_int_lmul{
           bins m0125 = {1}; 
           bins m025 = {2}; 
           bins m05 = {3}; 
           bins m1 = {4}; 
           bins m2 = {5}; 
           bins m4 = {6}; 
           bins m8 = {7}; 
        }
    cp_sew : coverpoint instr.find_sew{
           bins e8 = {8}; 
           bins e16 = {16}; 
           bins e32 = {32}; 
           bins e64 = {64}; 
        }
    //cp_variant : coverpoint instr.find_int_va_variant{
    //       bins VV = {1}; 
    //       bins VF = {4}; 
    //    }
  `CG_END

  `V_INSTR_CG_BEGIN(vfrdiv)
	  cp_vl   : coverpoint instr.find_vl{
			     bins vl0 = {0};
					 bins vl0vlmax = {[1:31]};
					 bins vlmax = {32};
				 }
    cp_frm  : coverpoint instr.find_frm[2:0];
		cp_fflags4  : coverpoint instr.find_fflags[4];
		cp_fflags3  : coverpoint instr.find_fflags[3];
		cp_fflags2  : coverpoint instr.find_fflags[2];
		cp_fflags1  : coverpoint instr.find_fflags[1];
		cp_fflags0  : coverpoint instr.find_fflags[0];
    cp_lmul : coverpoint instr.find_int_lmul{
           bins m0125 = {1}; 
           bins m025 = {2}; 
           bins m05 = {3}; 
           bins m1 = {4}; 
           bins m2 = {5}; 
           bins m4 = {6}; 
           bins m8 = {7}; 
        }
    cp_sew : coverpoint instr.find_sew{
           bins e8 = {8}; 
           bins e16 = {16}; 
           bins e32 = {32}; 
           bins e64 = {64}; 
        }
    //cp_variant : coverpoint instr.find_int_va_variant{
    //       bins VF = {4}; 
    //    }
  `CG_END

  `V_INSTR_CG_BEGIN(vfwmul)
	  cp_vl   : coverpoint instr.find_vl{
			     bins vl0 = {0};
					 bins vl0vlmax = {[1:15]};
					 bins vlmax = {16};
				 }
    cp_frm  : coverpoint instr.find_frm[2:0];
		cp_fflags4  : coverpoint instr.find_fflags[4];
		cp_fflags3  : coverpoint instr.find_fflags[3];
		cp_fflags2  : coverpoint instr.find_fflags[2];
		cp_fflags1  : coverpoint instr.find_fflags[1];
		cp_fflags0  : coverpoint instr.find_fflags[0];
    cp_lmul : coverpoint instr.find_int_lmul{
           bins m0125 = {1}; 
           bins m025 = {2}; 
           bins m05 = {3}; 
           bins m1 = {4}; 
           bins m2 = {5}; 
           bins m4 = {6}; 
           bins m8 = {7}; 
        }
    cp_sew : coverpoint instr.find_sew{
           bins e8 = {8}; 
           bins e16 = {16}; 
           bins e32 = {32}; 
           bins e64 = {64}; 
        }
    //cp_variant : coverpoint instr.find_int_va_variant{
    //       bins VV = {1}; 
    //       bins VF = {4}; 
    //    }
  `CG_END

  `V_INSTR_CG_BEGIN(vfmacc)
	  cp_vl   : coverpoint instr.find_vl{
			     bins vl0 = {0};
					 bins vl0vlmax = {[1:31]};
					 bins vlmax = {32};
				 }
    cp_frm  : coverpoint instr.find_frm[2:0];
		cp_fflags4  : coverpoint instr.find_fflags[4];
		cp_fflags3  : coverpoint instr.find_fflags[3];
		cp_fflags2  : coverpoint instr.find_fflags[2];
		cp_fflags1  : coverpoint instr.find_fflags[1];
		cp_fflags0  : coverpoint instr.find_fflags[0];
    cp_lmul : coverpoint instr.find_int_lmul{
           bins m0125 = {1}; 
           bins m025 = {2}; 
           bins m05 = {3}; 
           bins m1 = {4}; 
           bins m2 = {5}; 
           bins m4 = {6}; 
           bins m8 = {7}; 
        }
    cp_sew : coverpoint instr.find_sew{
           bins e8 = {8}; 
           bins e16 = {16}; 
           bins e32 = {32}; 
           bins e64 = {64}; 
        }
    //cp_variant : coverpoint instr.find_int_va_variant{
    //       bins VV = {1}; 
    //       bins VF = {4}; 
    //    }
  `CG_END

  `V_INSTR_CG_BEGIN(vfnmacc)
	  cp_vl   : coverpoint instr.find_vl{
			     bins vl0 = {0};
					 bins vl0vlmax = {[1:31]};
					 bins vlmax = {32};
				 }
    cp_frm  : coverpoint instr.find_frm[2:0];
		cp_fflags4  : coverpoint instr.find_fflags[4];
		cp_fflags3  : coverpoint instr.find_fflags[3];
		cp_fflags2  : coverpoint instr.find_fflags[2];
		cp_fflags1  : coverpoint instr.find_fflags[1];
		cp_fflags0  : coverpoint instr.find_fflags[0];
    cp_lmul : coverpoint instr.find_int_lmul{
           bins m0125 = {1}; 
           bins m025 = {2}; 
           bins m05 = {3}; 
           bins m1 = {4}; 
           bins m2 = {5}; 
           bins m4 = {6}; 
           bins m8 = {7}; 
        }
    cp_sew : coverpoint instr.find_sew{
           bins e8 = {8}; 
           bins e16 = {16}; 
           bins e32 = {32}; 
           bins e64 = {64}; 
        }
    //cp_variant : coverpoint instr.find_int_va_variant{
    //       bins VV = {1}; 
    //       bins VF = {4}; 
    //    }
  `CG_END

  `V_INSTR_CG_BEGIN(vfmsac)
	  cp_vl   : coverpoint instr.find_vl{
			     bins vl0 = {0};
					 bins vl0vlmax = {[1:31]};
					 bins vlmax = {32};
				 }
    cp_frm  : coverpoint instr.find_frm[2:0];
		cp_fflags4  : coverpoint instr.find_fflags[4];
		cp_fflags3  : coverpoint instr.find_fflags[3];
		cp_fflags2  : coverpoint instr.find_fflags[2];
		cp_fflags1  : coverpoint instr.find_fflags[1];
		cp_fflags0  : coverpoint instr.find_fflags[0];
    cp_lmul : coverpoint instr.find_int_lmul{
           bins m0125 = {1}; 
           bins m025 = {2}; 
           bins m05 = {3}; 
           bins m1 = {4}; 
           bins m2 = {5}; 
           bins m4 = {6}; 
           bins m8 = {7}; 
        }
    cp_sew : coverpoint instr.find_sew{
           bins e8 = {8}; 
           bins e16 = {16}; 
           bins e32 = {32}; 
           bins e64 = {64}; 
        }
    //cp_variant : coverpoint instr.find_int_va_variant{
    //       bins VV = {1}; 
    //       bins VF = {4}; 
    //    }
  `CG_END

  `V_INSTR_CG_BEGIN(vfnmsac)
	  cp_vl   : coverpoint instr.find_vl{
			     bins vl0 = {0};
					 bins vl0vlmax = {[1:31]};
					 bins vlmax = {32};
				 }
    cp_frm  : coverpoint instr.find_frm[2:0];
		cp_fflags4  : coverpoint instr.find_fflags[4];
		cp_fflags3  : coverpoint instr.find_fflags[3];
		cp_fflags2  : coverpoint instr.find_fflags[2];
		cp_fflags1  : coverpoint instr.find_fflags[1];
		cp_fflags0  : coverpoint instr.find_fflags[0];
    cp_lmul : coverpoint instr.find_int_lmul{
           bins m0125 = {1}; 
           bins m025 = {2}; 
           bins m05 = {3}; 
           bins m1 = {4}; 
           bins m2 = {5}; 
           bins m4 = {6}; 
           bins m8 = {7}; 
        }
    cp_sew : coverpoint instr.find_sew{
           bins e8 = {8}; 
           bins e16 = {16}; 
           bins e32 = {32}; 
           bins e64 = {64}; 
        }
    //cp_variant : coverpoint instr.find_int_va_variant{
    //       bins VV = {1}; 
    //       bins VF = {4}; 
    //    }
  `CG_END

  `V_INSTR_CG_BEGIN(vfmadd)
	  cp_vl   : coverpoint instr.find_vl{
			     bins vl0 = {0};
					 bins vl0vlmax = {[1:31]};
					 bins vlmax = {32};
				 }
    cp_frm  : coverpoint instr.find_frm[2:0];
		cp_fflags4  : coverpoint instr.find_fflags[4];
		cp_fflags3  : coverpoint instr.find_fflags[3];
		cp_fflags2  : coverpoint instr.find_fflags[2];
		cp_fflags1  : coverpoint instr.find_fflags[1];
		cp_fflags0  : coverpoint instr.find_fflags[0];
    cp_lmul : coverpoint instr.find_int_lmul{
           bins m0125 = {1}; 
           bins m025 = {2}; 
           bins m05 = {3}; 
           bins m1 = {4}; 
           bins m2 = {5}; 
           bins m4 = {6}; 
           bins m8 = {7}; 
        }
    cp_sew : coverpoint instr.find_sew{
           bins e8 = {8}; 
           bins e16 = {16}; 
           bins e32 = {32}; 
           bins e64 = {64}; 
        }
    //cp_variant : coverpoint instr.find_int_va_variant{
    //       bins VV = {1}; 
    //       bins VF = {4}; 
    //    }
  `CG_END

  `V_INSTR_CG_BEGIN(vfnmadd)
	  cp_vl   : coverpoint instr.find_vl{
			     bins vl0 = {0};
					 bins vl0vlmax = {[1:31]};
					 bins vlmax = {32};
				 }
    cp_frm  : coverpoint instr.find_frm[2:0];
		cp_fflags4  : coverpoint instr.find_fflags[4];
		cp_fflags3  : coverpoint instr.find_fflags[3];
		cp_fflags2  : coverpoint instr.find_fflags[2];
		cp_fflags1  : coverpoint instr.find_fflags[1];
		cp_fflags0  : coverpoint instr.find_fflags[0];
    cp_lmul : coverpoint instr.find_int_lmul{
           bins m0125 = {1}; 
           bins m025 = {2}; 
           bins m05 = {3}; 
           bins m1 = {4}; 
           bins m2 = {5}; 
           bins m4 = {6}; 
           bins m8 = {7}; 
        }
    cp_sew : coverpoint instr.find_sew{
           bins e8 = {8}; 
           bins e16 = {16}; 
           bins e32 = {32}; 
           bins e64 = {64}; 
        }
    //cp_variant : coverpoint instr.find_int_va_variant{
    //       bins VV = {1}; 
    //       bins VF = {4}; 
    //    }
  `CG_END

  `V_INSTR_CG_BEGIN(vfmsub)
	  cp_vl   : coverpoint instr.find_vl{
			     bins vl0 = {0};
					 bins vl0vlmax = {[1:31]};
					 bins vlmax = {32};
				 }
    cp_frm  : coverpoint instr.find_frm[2:0];
		cp_fflags4  : coverpoint instr.find_fflags[4];
		cp_fflags3  : coverpoint instr.find_fflags[3];
		cp_fflags2  : coverpoint instr.find_fflags[2];
		cp_fflags1  : coverpoint instr.find_fflags[1];
		cp_fflags0  : coverpoint instr.find_fflags[0];
    cp_lmul : coverpoint instr.find_int_lmul{
           bins m0125 = {1}; 
           bins m025 = {2}; 
           bins m05 = {3}; 
           bins m1 = {4}; 
           bins m2 = {5}; 
           bins m4 = {6}; 
           bins m8 = {7}; 
        }
    cp_sew : coverpoint instr.find_sew{
           bins e8 = {8}; 
           bins e16 = {16}; 
           bins e32 = {32}; 
           bins e64 = {64}; 
        }
    //cp_variant : coverpoint instr.find_int_va_variant{
    //       bins VV = {1}; 
    //       bins VF = {4}; 
    //    }
  `CG_END

  `V_INSTR_CG_BEGIN(vfnmsub)
	  cp_vl   : coverpoint instr.find_vl{
			     bins vl0 = {0};
					 bins vl0vlmax = {[1:31]};
					 bins vlmax = {32};
				 }
    cp_frm  : coverpoint instr.find_frm[2:0];
		cp_fflags4  : coverpoint instr.find_fflags[4];
		cp_fflags3  : coverpoint instr.find_fflags[3];
		cp_fflags2  : coverpoint instr.find_fflags[2];
		cp_fflags1  : coverpoint instr.find_fflags[1];
		cp_fflags0  : coverpoint instr.find_fflags[0];
    cp_lmul : coverpoint instr.find_int_lmul{
           bins m0125 = {1}; 
           bins m025 = {2}; 
           bins m05 = {3}; 
           bins m1 = {4}; 
           bins m2 = {5}; 
           bins m4 = {6}; 
           bins m8 = {7}; 
        }
    cp_sew : coverpoint instr.find_sew{
           bins e8 = {8}; 
           bins e16 = {16}; 
           bins e32 = {32}; 
           bins e64 = {64}; 
        }
    //cp_variant : coverpoint instr.find_int_va_variant{
    //       bins VV = {1}; 
    //       bins VF = {4}; 
    //    }
  `CG_END

  `V_INSTR_CG_BEGIN(vfwmacc)
	  cp_vl   : coverpoint instr.find_vl{
			     bins vl0 = {0};
					 bins vl0vlmax = {[1:15]};
					 bins vlmax = {16};
				 }
    cp_frm  : coverpoint instr.find_frm[2:0];
		cp_fflags4  : coverpoint instr.find_fflags[4];
		cp_fflags3  : coverpoint instr.find_fflags[3];
		cp_fflags2  : coverpoint instr.find_fflags[2];
		cp_fflags1  : coverpoint instr.find_fflags[1];
		cp_fflags0  : coverpoint instr.find_fflags[0];
    cp_lmul : coverpoint instr.find_int_lmul{
           bins m0125 = {1}; 
           bins m025 = {2}; 
           bins m05 = {3}; 
           bins m1 = {4}; 
           bins m2 = {5}; 
           bins m4 = {6}; 
           bins m8 = {7}; 
        }
    cp_sew : coverpoint instr.find_sew{
           bins e8 = {8}; 
           bins e16 = {16}; 
           bins e32 = {32}; 
           bins e64 = {64}; 
        }
    //cp_variant : coverpoint instr.find_int_va_variant{
    //       bins VV = {1}; 
    //       bins VF = {4}; 
    //    }
  `CG_END

  `V_INSTR_CG_BEGIN(vfwnmacc)
	  cp_vl   : coverpoint instr.find_vl{
			     bins vl0 = {0};
					 bins vl0vlmax = {[1:15]};
					 bins vlmax = {16};
				 }
    cp_frm  : coverpoint instr.find_frm[2:0];
		cp_fflags4  : coverpoint instr.find_fflags[4];
		cp_fflags3  : coverpoint instr.find_fflags[3];
		cp_fflags2  : coverpoint instr.find_fflags[2];
		cp_fflags1  : coverpoint instr.find_fflags[1];
		cp_fflags0  : coverpoint instr.find_fflags[0];
    cp_lmul : coverpoint instr.find_int_lmul{
           bins m0125 = {1}; 
           bins m025 = {2}; 
           bins m05 = {3}; 
           bins m1 = {4}; 
           bins m2 = {5}; 
           bins m4 = {6}; 
           bins m8 = {7}; 
        }
    cp_sew : coverpoint instr.find_sew{
           bins e8 = {8}; 
           bins e16 = {16}; 
           bins e32 = {32}; 
           bins e64 = {64}; 
        }
    //cp_variant : coverpoint instr.find_int_va_variant{
    //       bins VV = {1}; 
    //       bins VF = {4}; 
    //    }
  `CG_END

  `V_INSTR_CG_BEGIN(vfwmsac)
	  cp_vl   : coverpoint instr.find_vl{
			     bins vl0 = {0};
					 bins vl0vlmax = {[1:15]};
					 bins vlmax = {16};
				 }
    cp_frm  : coverpoint instr.find_frm[2:0];
		cp_fflags4  : coverpoint instr.find_fflags[4];
		cp_fflags3  : coverpoint instr.find_fflags[3];
		cp_fflags2  : coverpoint instr.find_fflags[2];
		cp_fflags1  : coverpoint instr.find_fflags[1];
		cp_fflags0  : coverpoint instr.find_fflags[0];
    cp_lmul : coverpoint instr.find_int_lmul{
           bins m0125 = {1}; 
           bins m025 = {2}; 
           bins m05 = {3}; 
           bins m1 = {4}; 
           bins m2 = {5}; 
           bins m4 = {6}; 
           bins m8 = {7}; 
        }
    cp_sew : coverpoint instr.find_sew{
           bins e8 = {8}; 
           bins e16 = {16}; 
           bins e32 = {32}; 
           bins e64 = {64}; 
        }
    //cp_variant : coverpoint instr.find_int_va_variant{
    //       bins VV = {1}; 
    //       bins VF = {4}; 
    //    }
  `CG_END

  `V_INSTR_CG_BEGIN(vfwnmsac)
	  cp_vl   : coverpoint instr.find_vl{
			     bins vl0 = {0};
					 bins vl0vlmax = {[1:15]};
					 bins vlmax = {16};
				 }
    cp_frm  : coverpoint instr.find_frm[2:0];
		cp_fflags4  : coverpoint instr.find_fflags[4];
		cp_fflags3  : coverpoint instr.find_fflags[3];
		cp_fflags2  : coverpoint instr.find_fflags[2];
		cp_fflags1  : coverpoint instr.find_fflags[1];
		cp_fflags0  : coverpoint instr.find_fflags[0];
    cp_lmul : coverpoint instr.find_int_lmul{
           bins m0125 = {1}; 
           bins m025 = {2}; 
           bins m05 = {3}; 
           bins m1 = {4}; 
           bins m2 = {5}; 
           bins m4 = {6}; 
           bins m8 = {7}; 
        }
    cp_sew : coverpoint instr.find_sew{
           bins e8 = {8}; 
           bins e16 = {16}; 
           bins e32 = {32}; 
           bins e64 = {64}; 
        }
    //cp_variant : coverpoint instr.find_int_va_variant{
    //       bins VV = {1}; 
    //       bins VF = {4}; 
    //    }
  `CG_END

  `V_INSTR_CG_BEGIN(vfsqrt_v)
	  cp_vl   : coverpoint instr.find_vl{
			     bins vl0 = {0};
					 bins vl0vlmax = {[1:31]};
					 bins vlmax = {32};
				 }
    cp_frm  : coverpoint instr.find_frm[2:0];
		cp_fflags4  : coverpoint instr.find_fflags[4];
		cp_fflags3  : coverpoint instr.find_fflags[3];
		cp_fflags2  : coverpoint instr.find_fflags[2];
		cp_fflags1  : coverpoint instr.find_fflags[1];
		cp_fflags0  : coverpoint instr.find_fflags[0];
    cp_lmul : coverpoint instr.find_int_lmul{
           bins m0125 = {1}; 
           bins m025 = {2}; 
           bins m05 = {3}; 
           bins m1 = {4}; 
           bins m2 = {5}; 
           bins m4 = {6}; 
           bins m8 = {7}; 
        }
    cp_sew : coverpoint instr.find_sew{
           bins e8 = {8}; 
           bins e16 = {16}; 
           bins e32 = {32}; 
           bins e64 = {64}; 
        }
  `CG_END

  `V_INSTR_CG_BEGIN(vfrsqrt7_v)
	  cp_vl   : coverpoint instr.find_vl{
			     bins vl0 = {0};
					 bins vl0vlmax = {[1:31]};
					 bins vlmax = {32};
				 }
    cp_frm  : coverpoint instr.find_frm[2:0];
		cp_fflags4  : coverpoint instr.find_fflags[4];
		cp_fflags3  : coverpoint instr.find_fflags[3];
		cp_fflags2  : coverpoint instr.find_fflags[2];
		cp_fflags1  : coverpoint instr.find_fflags[1];
		cp_fflags0  : coverpoint instr.find_fflags[0];
    cp_lmul : coverpoint instr.find_int_lmul{
           bins m0125 = {1}; 
           bins m025 = {2}; 
           bins m05 = {3}; 
           bins m1 = {4}; 
           bins m2 = {5}; 
           bins m4 = {6}; 
           bins m8 = {7}; 
        }
    cp_sew : coverpoint instr.find_sew{
           bins e8 = {8}; 
           bins e16 = {16}; 
           bins e32 = {32}; 
           bins e64 = {64}; 
        }
  `CG_END

  `V_INSTR_CG_BEGIN(vfrec7_v)
	  cp_vl   : coverpoint instr.find_vl{
			     bins vl0 = {0};
					 bins vl0vlmax = {[1:31]};
					 bins vlmax = {32};
				 }
    cp_frm  : coverpoint instr.find_frm[2:0];
		cp_fflags4  : coverpoint instr.find_fflags[4];
		cp_fflags3  : coverpoint instr.find_fflags[3];
		cp_fflags2  : coverpoint instr.find_fflags[2];
		cp_fflags1  : coverpoint instr.find_fflags[1];
		cp_fflags0  : coverpoint instr.find_fflags[0];
    cp_lmul : coverpoint instr.find_int_lmul{
           bins m0125 = {1}; 
           bins m025 = {2}; 
           bins m05 = {3}; 
           bins m1 = {4}; 
           bins m2 = {5}; 
           bins m4 = {6}; 
           bins m8 = {7}; 
        }
    cp_sew : coverpoint instr.find_sew{
           bins e8 = {8}; 
           bins e16 = {16}; 
           bins e32 = {32}; 
           bins e64 = {64}; 
        }
  `CG_END

  `V_INSTR_CG_BEGIN(vfmin)
	  cp_vl   : coverpoint instr.find_vl{
			     bins vl0 = {0};
					 bins vl0vlmax = {[1:31]};
					 bins vlmax = {32};
				 }
    cp_frm  : coverpoint instr.find_frm[2:0];
		cp_fflags4  : coverpoint instr.find_fflags[4];
		cp_fflags3  : coverpoint instr.find_fflags[3];
		cp_fflags2  : coverpoint instr.find_fflags[2];
		cp_fflags1  : coverpoint instr.find_fflags[1];
		cp_fflags0  : coverpoint instr.find_fflags[0];
    cp_lmul : coverpoint instr.find_int_lmul{
           bins m0125 = {1}; 
           bins m025 = {2}; 
           bins m05 = {3}; 
           bins m1 = {4}; 
           bins m2 = {5}; 
           bins m4 = {6}; 
           bins m8 = {7}; 
        }
    cp_sew : coverpoint instr.find_sew{
           bins e8 = {8}; 
           bins e16 = {16}; 
           bins e32 = {32}; 
           bins e64 = {64}; 
        }
    //cp_variant : coverpoint instr.find_int_va_variant{
    //       bins VV = {1}; 
    //       bins VF = {4}; 
    //    }
  `CG_END

  `V_INSTR_CG_BEGIN(vfmax)
	  cp_vl   : coverpoint instr.find_vl{
			     bins vl0 = {0};
					 bins vl0vlmax = {[1:31]};
					 bins vlmax = {32};
				 }
    cp_frm  : coverpoint instr.find_frm[2:0];
		cp_fflags4  : coverpoint instr.find_fflags[4];
		cp_fflags3  : coverpoint instr.find_fflags[3];
		cp_fflags2  : coverpoint instr.find_fflags[2];
		cp_fflags1  : coverpoint instr.find_fflags[1];
		cp_fflags0  : coverpoint instr.find_fflags[0];
    cp_lmul : coverpoint instr.find_int_lmul{
           bins m0125 = {1}; 
           bins m025 = {2}; 
           bins m05 = {3}; 
           bins m1 = {4}; 
           bins m2 = {5}; 
           bins m4 = {6}; 
           bins m8 = {7}; 
        }
    cp_sew : coverpoint instr.find_sew{
           bins e8 = {8}; 
           bins e16 = {16}; 
           bins e32 = {32}; 
           bins e64 = {64}; 
        }
    //cp_variant : coverpoint instr.find_int_va_variant{
    //       bins VV = {1}; 
    //       bins VF = {4}; 
    //    }
  `CG_END

  `V_INSTR_CG_BEGIN(vfsgnj)
	  cp_vl   : coverpoint instr.find_vl{
			     bins vl0 = {0};
					 bins vl0vlmax = {[1:31]};
					 bins vlmax = {32};
				 }
    cp_frm  : coverpoint instr.find_frm[2:0];
		cp_fflags4  : coverpoint instr.find_fflags[4];
		cp_fflags3  : coverpoint instr.find_fflags[3];
		cp_fflags2  : coverpoint instr.find_fflags[2];
		cp_fflags1  : coverpoint instr.find_fflags[1];
		cp_fflags0  : coverpoint instr.find_fflags[0];
    cp_lmul : coverpoint instr.find_int_lmul{
           bins m0125 = {1}; 
           bins m025 = {2}; 
           bins m05 = {3}; 
           bins m1 = {4}; 
           bins m2 = {5}; 
           bins m4 = {6}; 
           bins m8 = {7}; 
        }
    cp_sew : coverpoint instr.find_sew{
           bins e8 = {8}; 
           bins e16 = {16}; 
           bins e32 = {32}; 
           bins e64 = {64}; 
        }
    //cp_variant : coverpoint instr.find_int_va_variant{
    //       bins VV = {1}; 
    //       bins VF = {4}; 
    //    }
  `CG_END

  `V_INSTR_CG_BEGIN(vfsgnjn)
	  cp_vl   : coverpoint instr.find_vl{
			     bins vl0 = {0};
					 bins vl0vlmax = {[1:31]};
					 bins vlmax = {32};
				 }
    cp_frm  : coverpoint instr.find_frm[2:0];
		cp_fflags4  : coverpoint instr.find_fflags[4];
		cp_fflags3  : coverpoint instr.find_fflags[3];
		cp_fflags2  : coverpoint instr.find_fflags[2];
		cp_fflags1  : coverpoint instr.find_fflags[1];
		cp_fflags0  : coverpoint instr.find_fflags[0];
    cp_lmul : coverpoint instr.find_int_lmul{
           bins m0125 = {1}; 
           bins m025 = {2}; 
           bins m05 = {3}; 
           bins m1 = {4}; 
           bins m2 = {5}; 
           bins m4 = {6}; 
           bins m8 = {7}; 
        }
    cp_sew : coverpoint instr.find_sew{
           bins e8 = {8}; 
           bins e16 = {16}; 
           bins e32 = {32}; 
           bins e64 = {64}; 
        }
    //cp_variant : coverpoint instr.find_int_va_variant{
    //       bins VV = {1}; 
    //       bins VF = {4}; 
    //    }
  `CG_END

  `V_INSTR_CG_BEGIN(vfsgnjx)
	  cp_vl   : coverpoint instr.find_vl{
			     bins vl0 = {0};
					 bins vl0vlmax = {[1:31]};
					 bins vlmax = {32};
				 }
    cp_frm  : coverpoint instr.find_frm[2:0];
		cp_fflags4  : coverpoint instr.find_fflags[4];
		cp_fflags3  : coverpoint instr.find_fflags[3];
		cp_fflags2  : coverpoint instr.find_fflags[2];
		cp_fflags1  : coverpoint instr.find_fflags[1];
		cp_fflags0  : coverpoint instr.find_fflags[0];
    cp_lmul : coverpoint instr.find_int_lmul{
           bins m0125 = {1}; 
           bins m025 = {2}; 
           bins m05 = {3}; 
           bins m1 = {4}; 
           bins m2 = {5}; 
           bins m4 = {6}; 
           bins m8 = {7}; 
        }
    cp_sew : coverpoint instr.find_sew{
           bins e8 = {8}; 
           bins e16 = {16}; 
           bins e32 = {32}; 
           bins e64 = {64}; 
        }
    //cp_variant : coverpoint instr.find_int_va_variant{
    //       bins VV = {1}; 
    //       bins VF = {4}; 
    //    }
  `CG_END

  `V_INSTR_CG_BEGIN(vmfeq)
	  cp_vl   : coverpoint instr.find_vl{
			     bins vl0 = {0};
					 bins vl0vlmax = {[1:31]};
					 bins vlmax = {32};
				 }
    cp_frm  : coverpoint instr.find_frm[2:0];
		cp_fflags4  : coverpoint instr.find_fflags[4];
		cp_fflags3  : coverpoint instr.find_fflags[3];
		cp_fflags2  : coverpoint instr.find_fflags[2];
		cp_fflags1  : coverpoint instr.find_fflags[1];
		cp_fflags0  : coverpoint instr.find_fflags[0];
    cp_lmul : coverpoint instr.find_int_lmul{
           bins m0125 = {1}; 
           bins m025 = {2}; 
           bins m05 = {3}; 
           bins m1 = {4}; 
           bins m2 = {5}; 
           bins m4 = {6}; 
           bins m8 = {7}; 
        }
    cp_sew : coverpoint instr.find_sew{
           bins e8 = {8}; 
           bins e16 = {16}; 
           bins e32 = {32}; 
           bins e64 = {64}; 
        }
    //cp_variant : coverpoint instr.find_int_va_variant{
    //       bins VV = {1}; 
    //       bins VF = {4}; 
    //    }
  `CG_END

  `V_INSTR_CG_BEGIN(vmfne)
	  cp_vl   : coverpoint instr.find_vl{
			     bins vl0 = {0};
					 bins vl0vlmax = {[1:31]};
					 bins vlmax = {32};
				 }
    cp_frm  : coverpoint instr.find_frm[2:0];
		cp_fflags4  : coverpoint instr.find_fflags[4];
		cp_fflags3  : coverpoint instr.find_fflags[3];
		cp_fflags2  : coverpoint instr.find_fflags[2];
		cp_fflags1  : coverpoint instr.find_fflags[1];
		cp_fflags0  : coverpoint instr.find_fflags[0];
    cp_lmul : coverpoint instr.find_int_lmul{
           bins m0125 = {1}; 
           bins m025 = {2}; 
           bins m05 = {3}; 
           bins m1 = {4}; 
           bins m2 = {5}; 
           bins m4 = {6}; 
           bins m8 = {7}; 
        }
    cp_sew : coverpoint instr.find_sew{
           bins e8 = {8}; 
           bins e16 = {16}; 
           bins e32 = {32}; 
           bins e64 = {64}; 
        }
    //cp_variant : coverpoint instr.find_int_va_variant{
    //       bins VV = {1}; 
    //       bins VF = {4}; 
    //    }
  `CG_END

  `V_INSTR_CG_BEGIN(vmflt)
	  cp_vl   : coverpoint instr.find_vl{
			     bins vl0 = {0};
					 bins vl0vlmax = {[1:31]};
					 bins vlmax = {32};
				 }
    cp_frm  : coverpoint instr.find_frm[2:0];
		cp_fflags4  : coverpoint instr.find_fflags[4];
		cp_fflags3  : coverpoint instr.find_fflags[3];
		cp_fflags2  : coverpoint instr.find_fflags[2];
		cp_fflags1  : coverpoint instr.find_fflags[1];
		cp_fflags0  : coverpoint instr.find_fflags[0];
    cp_lmul : coverpoint instr.find_int_lmul{
           bins m0125 = {1}; 
           bins m025 = {2}; 
           bins m05 = {3}; 
           bins m1 = {4}; 
           bins m2 = {5}; 
           bins m4 = {6}; 
           bins m8 = {7}; 
        }
    cp_sew : coverpoint instr.find_sew{
           bins e8 = {8}; 
           bins e16 = {16}; 
           bins e32 = {32}; 
           bins e64 = {64}; 
        }
    //cp_variant : coverpoint instr.find_int_va_variant{
    //       bins VV = {1}; 
    //       bins VF = {4}; 
    //    }
  `CG_END

  `V_INSTR_CG_BEGIN(vmfle)
	  cp_vl   : coverpoint instr.find_vl{
			     bins vl0 = {0};
					 bins vl0vlmax = {[1:31]};
					 bins vlmax = {32};
				 }
    cp_frm  : coverpoint instr.find_frm[2:0];
		cp_fflags4  : coverpoint instr.find_fflags[4];
		cp_fflags3  : coverpoint instr.find_fflags[3];
		cp_fflags2  : coverpoint instr.find_fflags[2];
		cp_fflags1  : coverpoint instr.find_fflags[1];
		cp_fflags0  : coverpoint instr.find_fflags[0];
    cp_lmul : coverpoint instr.find_int_lmul{
           bins m0125 = {1}; 
           bins m025 = {2}; 
           bins m05 = {3}; 
           bins m1 = {4}; 
           bins m2 = {5}; 
           bins m4 = {6}; 
           bins m8 = {7}; 
        }
    cp_sew : coverpoint instr.find_sew{
           bins e8 = {8}; 
           bins e16 = {16}; 
           bins e32 = {32}; 
           bins e64 = {64}; 
        }
    //cp_variant : coverpoint instr.find_int_va_variant{
    //       bins VV = {1}; 
    //       bins VF = {4}; 
    //    }
  `CG_END

  `V_INSTR_CG_BEGIN(vmfgt)
	  cp_vl   : coverpoint instr.find_vl{
			     bins vl0 = {0};
					 bins vl0vlmax = {[1:31]};
					 bins vlmax = {32};
				 }
    cp_frm  : coverpoint instr.find_frm[2:0];
		cp_fflags4  : coverpoint instr.find_fflags[4];
		cp_fflags3  : coverpoint instr.find_fflags[3];
		cp_fflags2  : coverpoint instr.find_fflags[2];
		cp_fflags1  : coverpoint instr.find_fflags[1];
		cp_fflags0  : coverpoint instr.find_fflags[0];
    cp_lmul : coverpoint instr.find_int_lmul{
           bins m0125 = {1}; 
           bins m025 = {2}; 
           bins m05 = {3}; 
           bins m1 = {4}; 
           bins m2 = {5}; 
           bins m4 = {6}; 
           bins m8 = {7}; 
        }
    cp_sew : coverpoint instr.find_sew{
           bins e8 = {8}; 
           bins e16 = {16}; 
           bins e32 = {32}; 
           bins e64 = {64}; 
        }
    //cp_variant : coverpoint instr.find_int_va_variant{
    //       bins VF = {4}; 
    //    }
  `CG_END

  `V_INSTR_CG_BEGIN(vmfge)
	  cp_vl   : coverpoint instr.find_vl{
			     bins vl0 = {0};
					 bins vl0vlmax = {[1:31]};
					 bins vlmax = {32};
				 }
    cp_frm  : coverpoint instr.find_frm[2:0];
		cp_fflags4  : coverpoint instr.find_fflags[4];
		cp_fflags3  : coverpoint instr.find_fflags[3];
		cp_fflags2  : coverpoint instr.find_fflags[2];
		cp_fflags1  : coverpoint instr.find_fflags[1];
		cp_fflags0  : coverpoint instr.find_fflags[0];
    cp_lmul : coverpoint instr.find_int_lmul{
           bins m0125 = {1}; 
           bins m025 = {2}; 
           bins m05 = {3}; 
           bins m1 = {4}; 
           bins m2 = {5}; 
           bins m4 = {6}; 
           bins m8 = {7}; 
        }
    cp_sew : coverpoint instr.find_sew{
           bins e8 = {8}; 
           bins e16 = {16}; 
           bins e32 = {32}; 
           bins e64 = {64}; 
        }
    //cp_variant : coverpoint instr.find_int_va_variant{
    //       bins VF = {4}; 
    //    }
  `CG_END

  `V_INSTR_CG_BEGIN(vfclass_v)
	  cp_vl   : coverpoint instr.find_vl{
			     bins vl0 = {0};
					 bins vl0vlmax = {[1:31]};
					 bins vlmax = {32};
				 }
    cp_frm  : coverpoint instr.find_frm[2:0];
		cp_fflags4  : coverpoint instr.find_fflags[4];
		cp_fflags3  : coverpoint instr.find_fflags[3];
		cp_fflags2  : coverpoint instr.find_fflags[2];
		cp_fflags1  : coverpoint instr.find_fflags[1];
		cp_fflags0  : coverpoint instr.find_fflags[0];
    cp_lmul : coverpoint instr.find_int_lmul{
           bins m0125 = {1}; 
           bins m025 = {2}; 
           bins m05 = {3}; 
           bins m1 = {4}; 
           bins m2 = {5}; 
           bins m4 = {6}; 
           bins m8 = {7}; 
        }
    cp_sew : coverpoint instr.find_sew{
           bins e8 = {8}; 
           bins e16 = {16}; 
           bins e32 = {32}; 
           bins e64 = {64}; 
        }
  `CG_END

  `V_INSTR_CG_BEGIN(vfmerge)
	  cp_vl   : coverpoint instr.find_vl{
			     bins vl0 = {0};
					 bins vl0vlmax = {[1:31]};
					 bins vlmax = {32};
				 }
    cp_frm  : coverpoint instr.find_frm[2:0];
		cp_fflags4  : coverpoint instr.find_fflags[4];
		cp_fflags3  : coverpoint instr.find_fflags[3];
		cp_fflags2  : coverpoint instr.find_fflags[2];
		cp_fflags1  : coverpoint instr.find_fflags[1];
		cp_fflags0  : coverpoint instr.find_fflags[0];
    cp_lmul : coverpoint instr.find_int_lmul{
           bins m0125 = {1}; 
           bins m025 = {2}; 
           bins m05 = {3}; 
           bins m1 = {4}; 
           bins m2 = {5}; 
           bins m4 = {6}; 
           bins m8 = {7}; 
        }
    cp_sew : coverpoint instr.find_sew{
           bins e8 = {8}; 
           bins e16 = {16}; 
           bins e32 = {32}; 
           bins e64 = {64}; 
        }
    //cp_variant : coverpoint instr.find_int_va_variant{
    //       bins VFM = {12}; 
    //    }
  `CG_END

  `V_INSTR_CG_BEGIN(vfmv)
	  cp_vl   : coverpoint instr.find_vl{
			     bins vl0 = {0};
					 bins vl0vlmax = {[1:31]};
					 bins vlmax = {32};
				 }
    cp_frm  : coverpoint instr.find_frm[2:0];
		cp_fflags4  : coverpoint instr.find_fflags[4];
		cp_fflags3  : coverpoint instr.find_fflags[3];
		cp_fflags2  : coverpoint instr.find_fflags[2];
		cp_fflags1  : coverpoint instr.find_fflags[1];
		cp_fflags0  : coverpoint instr.find_fflags[0];
    cp_lmul : coverpoint instr.find_int_lmul{
           bins m0125 = {1}; 
           bins m025 = {2}; 
           bins m05 = {3}; 
           bins m1 = {4}; 
           bins m2 = {5}; 
           bins m4 = {6}; 
           bins m8 = {7}; 
        }
    cp_sew : coverpoint instr.find_sew{
           bins e8 = {8}; 
           bins e16 = {16}; 
           bins e32 = {32}; 
           bins e64 = {64}; 
        }
    //cp_variant : coverpoint instr.find_int_va_variant{
    //       bins VF = {4}; 
    //    }
  `CG_END

  `V_INSTR_CG_BEGIN(vfcvt_xu_f_v)
	  cp_vl   : coverpoint instr.find_vl{
			     bins vl0 = {0};
					 bins vl0vlmax = {[1:31]};
					 bins vlmax = {32};
				 }
    cp_frm  : coverpoint instr.find_frm[2:0];
		cp_fflags4  : coverpoint instr.find_fflags[4];
		cp_fflags3  : coverpoint instr.find_fflags[3];
		cp_fflags2  : coverpoint instr.find_fflags[2];
		cp_fflags1  : coverpoint instr.find_fflags[1];
		cp_fflags0  : coverpoint instr.find_fflags[0];
    cp_lmul : coverpoint instr.find_int_lmul{
           bins m0125 = {1}; 
           bins m025 = {2}; 
           bins m05 = {3}; 
           bins m1 = {4}; 
           bins m2 = {5}; 
           bins m4 = {6}; 
           bins m8 = {7}; 
        }
    cp_sew : coverpoint instr.find_sew{
           bins e8 = {8}; 
           bins e16 = {16}; 
           bins e32 = {32}; 
           bins e64 = {64}; 
        }
  `CG_END

  `V_INSTR_CG_BEGIN(vfcvt_x_f_v)
	  cp_vl   : coverpoint instr.find_vl{
			     bins vl0 = {0};
					 bins vl0vlmax = {[1:31]};
					 bins vlmax = {32};
				 }
    cp_frm  : coverpoint instr.find_frm[2:0];
		cp_fflags4  : coverpoint instr.find_fflags[4];
		cp_fflags3  : coverpoint instr.find_fflags[3];
		cp_fflags2  : coverpoint instr.find_fflags[2];
		cp_fflags1  : coverpoint instr.find_fflags[1];
		cp_fflags0  : coverpoint instr.find_fflags[0];
    cp_lmul : coverpoint instr.find_int_lmul{
           bins m0125 = {1}; 
           bins m025 = {2}; 
           bins m05 = {3}; 
           bins m1 = {4}; 
           bins m2 = {5}; 
           bins m4 = {6}; 
           bins m8 = {7}; 
        }
    cp_sew : coverpoint instr.find_sew{
           bins e8 = {8}; 
           bins e16 = {16}; 
           bins e32 = {32}; 
           bins e64 = {64}; 
        }
  `CG_END

  `V_INSTR_CG_BEGIN(vfcvt_rtz_xu_f_v)
	  cp_vl   : coverpoint instr.find_vl{
			     bins vl0 = {0};
					 bins vl0vlmax = {[1:31]};
					 bins vlmax = {32};
				 }
    cp_frm  : coverpoint instr.find_frm[2:0];
		cp_fflags4  : coverpoint instr.find_fflags[4];
		cp_fflags3  : coverpoint instr.find_fflags[3];
		cp_fflags2  : coverpoint instr.find_fflags[2];
		cp_fflags1  : coverpoint instr.find_fflags[1];
		cp_fflags0  : coverpoint instr.find_fflags[0];
    cp_lmul : coverpoint instr.find_int_lmul{
           bins m0125 = {1}; 
           bins m025 = {2}; 
           bins m05 = {3}; 
           bins m1 = {4}; 
           bins m2 = {5}; 
           bins m4 = {6}; 
           bins m8 = {7}; 
        }
    cp_sew : coverpoint instr.find_sew{
           bins e8 = {8}; 
           bins e16 = {16}; 
           bins e32 = {32}; 
           bins e64 = {64}; 
        }
  `CG_END

  `V_INSTR_CG_BEGIN(vfcvt_rtz_x_f_v)
	  cp_vl   : coverpoint instr.find_vl{
			     bins vl0 = {0};
					 bins vl0vlmax = {[1:31]};
					 bins vlmax = {32};
				 }
    cp_frm  : coverpoint instr.find_frm[2:0];
		cp_fflags4  : coverpoint instr.find_fflags[4];
		cp_fflags3  : coverpoint instr.find_fflags[3];
		cp_fflags2  : coverpoint instr.find_fflags[2];
		cp_fflags1  : coverpoint instr.find_fflags[1];
		cp_fflags0  : coverpoint instr.find_fflags[0];
    cp_lmul : coverpoint instr.find_int_lmul{
           bins m0125 = {1}; 
           bins m025 = {2}; 
           bins m05 = {3}; 
           bins m1 = {4}; 
           bins m2 = {5}; 
           bins m4 = {6}; 
           bins m8 = {7}; 
        }
    cp_sew : coverpoint instr.find_sew{
           bins e8 = {8}; 
           bins e16 = {16}; 
           bins e32 = {32}; 
           bins e64 = {64}; 
        }
  `CG_END

  `V_INSTR_CG_BEGIN(vfcvt_f_xu_v)
	  cp_vl   : coverpoint instr.find_vl{
			     bins vl0 = {0};
					 bins vl0vlmax = {[1:31]};
					 bins vlmax = {32};
				 }
    cp_frm  : coverpoint instr.find_frm[2:0];
		cp_fflags4  : coverpoint instr.find_fflags[4];
		cp_fflags3  : coverpoint instr.find_fflags[3];
		cp_fflags2  : coverpoint instr.find_fflags[2];
		cp_fflags1  : coverpoint instr.find_fflags[1];
		cp_fflags0  : coverpoint instr.find_fflags[0];
    cp_lmul : coverpoint instr.find_int_lmul{
           bins m0125 = {1}; 
           bins m025 = {2}; 
           bins m05 = {3}; 
           bins m1 = {4}; 
           bins m2 = {5}; 
           bins m4 = {6}; 
           bins m8 = {7}; 
        }
    cp_sew : coverpoint instr.find_sew{
           bins e8 = {8}; 
           bins e16 = {16}; 
           bins e32 = {32}; 
           bins e64 = {64}; 
        }
  `CG_END

  `V_INSTR_CG_BEGIN(vfcvt_f_x_v)
	  cp_vl   : coverpoint instr.find_vl{
			     bins vl0 = {0};
					 bins vl0vlmax = {[1:31]};
					 bins vlmax = {32};
				 }
    cp_frm  : coverpoint instr.find_frm[2:0];
		cp_fflags4  : coverpoint instr.find_fflags[4];
		cp_fflags3  : coverpoint instr.find_fflags[3];
		cp_fflags2  : coverpoint instr.find_fflags[2];
		cp_fflags1  : coverpoint instr.find_fflags[1];
		cp_fflags0  : coverpoint instr.find_fflags[0];
    cp_lmul : coverpoint instr.find_int_lmul{
           bins m0125 = {1}; 
           bins m025 = {2}; 
           bins m05 = {3}; 
           bins m1 = {4}; 
           bins m2 = {5}; 
           bins m4 = {6}; 
           bins m8 = {7}; 
        }
    cp_sew : coverpoint instr.find_sew{
           bins e8 = {8}; 
           bins e16 = {16}; 
           bins e32 = {32}; 
           bins e64 = {64}; 
        }
  `CG_END

  `V_INSTR_CG_BEGIN(vfwcvt_xu_f_v)
	  cp_vl   : coverpoint instr.find_vl{
			     bins vl0 = {0};
					 bins vl0vlmax = {[1:15]};
					 bins vlmax = {16};
				 }
    cp_frm  : coverpoint instr.find_frm[2:0];
		cp_fflags4  : coverpoint instr.find_fflags[4];
		cp_fflags3  : coverpoint instr.find_fflags[3];
		cp_fflags2  : coverpoint instr.find_fflags[2];
		cp_fflags1  : coverpoint instr.find_fflags[1];
		cp_fflags0  : coverpoint instr.find_fflags[0];
    cp_lmul : coverpoint instr.find_int_lmul{
           bins m0125 = {1}; 
           bins m025 = {2}; 
           bins m05 = {3}; 
           bins m1 = {4}; 
           bins m2 = {5}; 
           bins m4 = {6}; 
           bins m8 = {7}; 
        }
    cp_sew : coverpoint instr.find_sew{
           bins e8 = {8}; 
           bins e16 = {16}; 
           bins e32 = {32}; 
           bins e64 = {64}; 
        }
  `CG_END

  `V_INSTR_CG_BEGIN(vfwcvt_x_f_v)
	  cp_vl   : coverpoint instr.find_vl{
			     bins vl0 = {0};
					 bins vl0vlmax = {[1:15]};
					 bins vlmax = {16};
				 }
    cp_frm  : coverpoint instr.find_frm[2:0];
		cp_fflags4  : coverpoint instr.find_fflags[4];
		cp_fflags3  : coverpoint instr.find_fflags[3];
		cp_fflags2  : coverpoint instr.find_fflags[2];
		cp_fflags1  : coverpoint instr.find_fflags[1];
		cp_fflags0  : coverpoint instr.find_fflags[0];
    cp_lmul : coverpoint instr.find_int_lmul{
           bins m0125 = {1}; 
           bins m025 = {2}; 
           bins m05 = {3}; 
           bins m1 = {4}; 
           bins m2 = {5}; 
           bins m4 = {6}; 
           bins m8 = {7}; 
        }
    cp_sew : coverpoint instr.find_sew{
           bins e8 = {8}; 
           bins e16 = {16}; 
           bins e32 = {32}; 
           bins e64 = {64}; 
        }
  `CG_END

  `V_INSTR_CG_BEGIN(vfwcvt_rtz_xu_f_v)
	  cp_vl   : coverpoint instr.find_vl{
			     bins vl0 = {0};
					 bins vl0vlmax = {[1:15]};
					 bins vlmax = {16};
				 }
    cp_frm  : coverpoint instr.find_frm[2:0];
		cp_fflags4  : coverpoint instr.find_fflags[4];
		cp_fflags3  : coverpoint instr.find_fflags[3];
		cp_fflags2  : coverpoint instr.find_fflags[2];
		cp_fflags1  : coverpoint instr.find_fflags[1];
		cp_fflags0  : coverpoint instr.find_fflags[0];
    cp_lmul : coverpoint instr.find_int_lmul{
           bins m0125 = {1}; 
           bins m025 = {2}; 
           bins m05 = {3}; 
           bins m1 = {4}; 
           bins m2 = {5}; 
           bins m4 = {6}; 
           bins m8 = {7}; 
        }
    cp_sew : coverpoint instr.find_sew{
           bins e8 = {8}; 
           bins e16 = {16}; 
           bins e32 = {32}; 
           bins e64 = {64}; 
        }
  `CG_END

  `V_INSTR_CG_BEGIN(vfwcvt_rtz_x_f_v)
	  cp_vl   : coverpoint instr.find_vl{
			     bins vl0 = {0};
					 bins vl0vlmax = {[1:15]};
					 bins vlmax = {16};
				 }
    cp_frm  : coverpoint instr.find_frm[2:0];
		cp_fflags4  : coverpoint instr.find_fflags[4];
		cp_fflags3  : coverpoint instr.find_fflags[3];
		cp_fflags2  : coverpoint instr.find_fflags[2];
		cp_fflags1  : coverpoint instr.find_fflags[1];
		cp_fflags0  : coverpoint instr.find_fflags[0];
    cp_lmul : coverpoint instr.find_int_lmul{
           bins m0125 = {1}; 
           bins m025 = {2}; 
           bins m05 = {3}; 
           bins m1 = {4}; 
           bins m2 = {5}; 
           bins m4 = {6}; 
           bins m8 = {7}; 
        }
    cp_sew : coverpoint instr.find_sew{
           bins e8 = {8}; 
           bins e16 = {16}; 
           bins e32 = {32}; 
           bins e64 = {64}; 
        }
  `CG_END

  `V_INSTR_CG_BEGIN(vfwcvt_f_xu_v)
	  cp_vl   : coverpoint instr.find_vl{
			     bins vl0 = {0};
					 bins vl0vlmax = {[1:31]};
					 bins vlmax = {32};
				 }
    cp_frm  : coverpoint instr.find_frm[2:0];
		cp_fflags4  : coverpoint instr.find_fflags[4];
		cp_fflags3  : coverpoint instr.find_fflags[3];
		cp_fflags2  : coverpoint instr.find_fflags[2];
		cp_fflags1  : coverpoint instr.find_fflags[1];
		cp_fflags0  : coverpoint instr.find_fflags[0];
    cp_lmul : coverpoint instr.find_int_lmul{
           bins m0125 = {1}; 
           bins m025 = {2}; 
           bins m05 = {3}; 
           bins m1 = {4}; 
           bins m2 = {5}; 
           bins m4 = {6}; 
           bins m8 = {7}; 
        }
    cp_sew : coverpoint instr.find_sew{
           bins e8 = {8}; 
           bins e16 = {16}; 
           bins e32 = {32}; 
           bins e64 = {64}; 
        }
  `CG_END

  `V_INSTR_CG_BEGIN(vfwcvt_f_x_v)
	  cp_vl   : coverpoint instr.find_vl{
			     bins vl0 = {0};
					 bins vl0vlmax = {[1:31]};
					 bins vlmax = {32};
				 }
    cp_frm  : coverpoint instr.find_frm[2:0];
		cp_fflags4  : coverpoint instr.find_fflags[4];
		cp_fflags3  : coverpoint instr.find_fflags[3];
		cp_fflags2  : coverpoint instr.find_fflags[2];
		cp_fflags1  : coverpoint instr.find_fflags[1];
		cp_fflags0  : coverpoint instr.find_fflags[0];
    cp_lmul : coverpoint instr.find_int_lmul{
           bins m0125 = {1}; 
           bins m025 = {2}; 
           bins m05 = {3}; 
           bins m1 = {4}; 
           bins m2 = {5}; 
           bins m4 = {6}; 
           bins m8 = {7}; 
        }
    cp_sew : coverpoint instr.find_sew{
           bins e8 = {8}; 
           bins e16 = {16}; 
           bins e32 = {32}; 
           bins e64 = {64}; 
        }
  `CG_END

  `V_INSTR_CG_BEGIN(vfwcvt_f_f_v)
	  cp_vl   : coverpoint instr.find_vl{
			     bins vl0 = {0};
					 bins vl0vlmax = {[1:15]};
					 bins vlmax = {16};
				 }
    cp_frm  : coverpoint instr.find_frm[2:0];
		cp_fflags4  : coverpoint instr.find_fflags[4];
		cp_fflags3  : coverpoint instr.find_fflags[3];
		cp_fflags2  : coverpoint instr.find_fflags[2];
		cp_fflags1  : coverpoint instr.find_fflags[1];
		cp_fflags0  : coverpoint instr.find_fflags[0];
    cp_lmul : coverpoint instr.find_int_lmul{
           bins m0125 = {1}; 
           bins m025 = {2}; 
           bins m05 = {3}; 
           bins m1 = {4}; 
           bins m2 = {5}; 
           bins m4 = {6}; 
           bins m8 = {7}; 
        }
    cp_sew : coverpoint instr.find_sew{
           bins e8 = {8}; 
           bins e16 = {16}; 
           bins e32 = {32}; 
           bins e64 = {64}; 
        }
  `CG_END

  `V_INSTR_CG_BEGIN(vfncvt_xu_f_w)
	  cp_vl   : coverpoint instr.find_vl{
			     bins vl0 = {0};
					 bins vl0vlmax = {[1:31]};
					 bins vlmax = {32};
				 }
    cp_frm  : coverpoint instr.find_frm[2:0];
		cp_fflags4  : coverpoint instr.find_fflags[4];
		cp_fflags3  : coverpoint instr.find_fflags[3];
		cp_fflags2  : coverpoint instr.find_fflags[2];
		cp_fflags1  : coverpoint instr.find_fflags[1];
		cp_fflags0  : coverpoint instr.find_fflags[0];
    cp_lmul : coverpoint instr.find_int_lmul{
           bins m0125 = {1}; 
           bins m025 = {2}; 
           bins m05 = {3}; 
           bins m1 = {4}; 
           bins m2 = {5}; 
           bins m4 = {6}; 
           bins m8 = {7}; 
        }
    cp_sew : coverpoint instr.find_sew{
           bins e8 = {8}; 
           bins e16 = {16}; 
           bins e32 = {32}; 
           bins e64 = {64}; 
        }
  `CG_END

  `V_INSTR_CG_BEGIN(vfncvt_x_f_w)
	  cp_vl   : coverpoint instr.find_vl{
			     bins vl0 = {0};
					 bins vl0vlmax = {[1:31]};
					 bins vlmax = {32};
				 }
    cp_frm  : coverpoint instr.find_frm[2:0];
		cp_fflags4  : coverpoint instr.find_fflags[4];
		cp_fflags3  : coverpoint instr.find_fflags[3];
		cp_fflags2  : coverpoint instr.find_fflags[2];
		cp_fflags1  : coverpoint instr.find_fflags[1];
		cp_fflags0  : coverpoint instr.find_fflags[0];
    cp_lmul : coverpoint instr.find_int_lmul{
           bins m0125 = {1}; 
           bins m025 = {2}; 
           bins m05 = {3}; 
           bins m1 = {4}; 
           bins m2 = {5}; 
           bins m4 = {6}; 
           bins m8 = {7}; 
        }
    cp_sew : coverpoint instr.find_sew{
           bins e8 = {8}; 
           bins e16 = {16}; 
           bins e32 = {32}; 
           bins e64 = {64}; 
        }
  `CG_END

  `V_INSTR_CG_BEGIN(vfncvt_f_xu_w)
	  cp_vl   : coverpoint instr.find_vl{
			     bins vl0 = {0};
					 bins vl0vlmax = {[1:15]};
					 bins vlmax = {16};
				 }
    cp_frm  : coverpoint instr.find_frm[2:0];
		cp_fflags4  : coverpoint instr.find_fflags[4];
		cp_fflags3  : coverpoint instr.find_fflags[3];
		cp_fflags2  : coverpoint instr.find_fflags[2];
		cp_fflags1  : coverpoint instr.find_fflags[1];
		cp_fflags0  : coverpoint instr.find_fflags[0];
    cp_lmul : coverpoint instr.find_int_lmul{
           bins m0125 = {1}; 
           bins m025 = {2}; 
           bins m05 = {3}; 
           bins m1 = {4}; 
           bins m2 = {5}; 
           bins m4 = {6}; 
           bins m8 = {7}; 
        }
    cp_sew : coverpoint instr.find_sew{
           bins e8 = {8}; 
           bins e16 = {16}; 
           bins e32 = {32}; 
           bins e64 = {64}; 
        }
  `CG_END

  `V_INSTR_CG_BEGIN(vfncvt_f_x_w)
	  cp_vl   : coverpoint instr.find_vl{
			     bins vl0 = {0};
					 bins vl0vlmax = {[1:15]};
					 bins vlmax = {16};
				 }
    cp_frm  : coverpoint instr.find_frm[2:0];
		cp_fflags4  : coverpoint instr.find_fflags[4];
		cp_fflags3  : coverpoint instr.find_fflags[3];
		cp_fflags2  : coverpoint instr.find_fflags[2];
		cp_fflags1  : coverpoint instr.find_fflags[1];
		cp_fflags0  : coverpoint instr.find_fflags[0];
    cp_lmul : coverpoint instr.find_int_lmul{
           bins m0125 = {1}; 
           bins m025 = {2}; 
           bins m05 = {3}; 
           bins m1 = {4}; 
           bins m2 = {5}; 
           bins m4 = {6}; 
           bins m8 = {7}; 
        }
    cp_sew : coverpoint instr.find_sew{
           bins e8 = {8}; 
           bins e16 = {16}; 
           bins e32 = {32}; 
           bins e64 = {64}; 
        }
  `CG_END

  `V_INSTR_CG_BEGIN(vfncvt_f_f_w)
	  cp_vl   : coverpoint instr.find_vl{
			     bins vl0 = {0};
					 bins vl0vlmax = {[1:15]};
					 bins vlmax = {16};
				 }
    cp_frm  : coverpoint instr.find_frm[2:0];
		cp_fflags4  : coverpoint instr.find_fflags[4];
		cp_fflags3  : coverpoint instr.find_fflags[3];
		cp_fflags2  : coverpoint instr.find_fflags[2];
		cp_fflags1  : coverpoint instr.find_fflags[1];
		cp_fflags0  : coverpoint instr.find_fflags[0];
    cp_lmul : coverpoint instr.find_int_lmul{
           bins m0125 = {1}; 
           bins m025 = {2}; 
           bins m05 = {3}; 
           bins m1 = {4}; 
           bins m2 = {5}; 
           bins m4 = {6}; 
           bins m8 = {7}; 
        }
    cp_sew : coverpoint instr.find_sew{
           bins e8 = {8}; 
           bins e16 = {16}; 
           bins e32 = {32}; 
           bins e64 = {64}; 
        }
  `CG_END

  `V_INSTR_CG_BEGIN(vfncvt_rod_f_f_w)
	  cp_vl   : coverpoint instr.find_vl{
			     bins vl0 = {0};
					 bins vl0vlmax = {[1:15]};
					 bins vlmax = {16};
				 }
    cp_frm  : coverpoint instr.find_frm[2:0];
		cp_fflags4  : coverpoint instr.find_fflags[4];
		cp_fflags3  : coverpoint instr.find_fflags[3];
		cp_fflags2  : coverpoint instr.find_fflags[2];
		cp_fflags1  : coverpoint instr.find_fflags[1];
		cp_fflags0  : coverpoint instr.find_fflags[0];
    cp_lmul : coverpoint instr.find_int_lmul{
           bins m0125 = {1}; 
           bins m025 = {2}; 
           bins m05 = {3}; 
           bins m1 = {4}; 
           bins m2 = {5}; 
           bins m4 = {6}; 
           bins m8 = {7}; 
        }
    cp_sew : coverpoint instr.find_sew{
           bins e8 = {8}; 
           bins e16 = {16}; 
           bins e32 = {32}; 
           bins e64 = {64}; 
        }
  `CG_END

  `V_INSTR_CG_BEGIN(vredsum_vs)
	  cp_vl   : coverpoint instr.find_vl{
			     bins vl0 = {0};
					 bins vl0vlmax = {[1:127]};
					 bins vlmax = {128};
				 }
    cp_lmul : coverpoint instr.find_int_lmul{
           bins m0125 = {1}; 
           bins m025 = {2}; 
           bins m05 = {3}; 
           bins m1 = {4}; 
           bins m2 = {5}; 
           bins m4 = {6}; 
           bins m8 = {7}; 
        }
    cp_sew : coverpoint instr.find_sew{
           bins e8 = {8}; 
           bins e16 = {16}; 
           bins e32 = {32}; 
           bins e64 = {64}; 
        }
  `CG_END

  `V_INSTR_CG_BEGIN(vredmaxu_vs)
	  cp_vl   : coverpoint instr.find_vl{
			     bins vl0 = {0};
					 bins vl0vlmax = {[1:127]};
					 bins vlmax = {128};
				 }
    cp_lmul : coverpoint instr.find_int_lmul{
           bins m0125 = {1}; 
           bins m025 = {2}; 
           bins m05 = {3}; 
           bins m1 = {4}; 
           bins m2 = {5}; 
           bins m4 = {6}; 
           bins m8 = {7}; 
        }
    cp_sew : coverpoint instr.find_sew{
           bins e8 = {8}; 
           bins e16 = {16}; 
           bins e32 = {32}; 
           bins e64 = {64}; 
        }
  `CG_END

  `V_INSTR_CG_BEGIN(vredmax_vs)
	  cp_vl   : coverpoint instr.find_vl{
			     bins vl0 = {0};
					 bins vl0vlmax = {[1:127]};
					 bins vlmax = {128};
				 }
    cp_lmul : coverpoint instr.find_int_lmul{
           bins m0125 = {1}; 
           bins m025 = {2}; 
           bins m05 = {3}; 
           bins m1 = {4}; 
           bins m2 = {5}; 
           bins m4 = {6}; 
           bins m8 = {7}; 
        }
    cp_sew : coverpoint instr.find_sew{
           bins e8 = {8}; 
           bins e16 = {16}; 
           bins e32 = {32}; 
           bins e64 = {64}; 
        }
  `CG_END

  `V_INSTR_CG_BEGIN(vredminu_vs)
	  cp_vl   : coverpoint instr.find_vl{
			     bins vl0 = {0};
					 bins vl0vlmax = {[1:127]};
					 bins vlmax = {128};
				 }
    cp_lmul : coverpoint instr.find_int_lmul{
           bins m0125 = {1}; 
           bins m025 = {2}; 
           bins m05 = {3}; 
           bins m1 = {4}; 
           bins m2 = {5}; 
           bins m4 = {6}; 
           bins m8 = {7}; 
        }
    cp_sew : coverpoint instr.find_sew{
           bins e8 = {8}; 
           bins e16 = {16}; 
           bins e32 = {32}; 
           bins e64 = {64}; 
        }
  `CG_END

  `V_INSTR_CG_BEGIN(vredmin_vs)
	  cp_vl   : coverpoint instr.find_vl{
			     bins vl0 = {0};
					 bins vl0vlmax = {[1:127]};
					 bins vlmax = {128};
				 }
    cp_lmul : coverpoint instr.find_int_lmul{
           bins m0125 = {1}; 
           bins m025 = {2}; 
           bins m05 = {3}; 
           bins m1 = {4}; 
           bins m2 = {5}; 
           bins m4 = {6}; 
           bins m8 = {7}; 
        }
    cp_sew : coverpoint instr.find_sew{
           bins e8 = {8}; 
           bins e16 = {16}; 
           bins e32 = {32}; 
           bins e64 = {64}; 
        }
  `CG_END

  `V_INSTR_CG_BEGIN(vredand_vs)
	  cp_vl   : coverpoint instr.find_vl{
			     bins vl0 = {0};
					 bins vl0vlmax = {[1:127]};
					 bins vlmax = {128};
				 }
    cp_lmul : coverpoint instr.find_int_lmul{
           bins m0125 = {1}; 
           bins m025 = {2}; 
           bins m05 = {3}; 
           bins m1 = {4}; 
           bins m2 = {5}; 
           bins m4 = {6}; 
           bins m8 = {7}; 
        }
    cp_sew : coverpoint instr.find_sew{
           bins e8 = {8}; 
           bins e16 = {16}; 
           bins e32 = {32}; 
           bins e64 = {64}; 
        }
  `CG_END

  `V_INSTR_CG_BEGIN(vredor_vs)
	  cp_vl   : coverpoint instr.find_vl{
			     bins vl0 = {0};
					 bins vl0vlmax = {[1:127]};
					 bins vlmax = {128};
				 }
    cp_lmul : coverpoint instr.find_int_lmul{
           bins m0125 = {1}; 
           bins m025 = {2}; 
           bins m05 = {3}; 
           bins m1 = {4}; 
           bins m2 = {5}; 
           bins m4 = {6}; 
           bins m8 = {7}; 
        }
    cp_sew : coverpoint instr.find_sew{
           bins e8 = {8}; 
           bins e16 = {16}; 
           bins e32 = {32}; 
           bins e64 = {64}; 
        }
  `CG_END

  `V_INSTR_CG_BEGIN(vredxor_vs)
	  cp_vl   : coverpoint instr.find_vl{
			     bins vl0 = {0};
					 bins vl0vlmax = {[1:127]};
					 bins vlmax = {128};
				 }
    cp_lmul : coverpoint instr.find_int_lmul{
           bins m0125 = {1}; 
           bins m025 = {2}; 
           bins m05 = {3}; 
           bins m1 = {4}; 
           bins m2 = {5}; 
           bins m4 = {6}; 
           bins m8 = {7}; 
        }
    cp_sew : coverpoint instr.find_sew{
           bins e8 = {8}; 
           bins e16 = {16}; 
           bins e32 = {32}; 
           bins e64 = {64}; 
        }
  `CG_END

  `V_INSTR_CG_BEGIN(vwredsumu_vs)
	  cp_vl   : coverpoint instr.find_vl{
			     bins vl0 = {0};
					 bins vl0vlmax = {[1:63]};
					 bins vlmax = {64};
				 }
    cp_lmul : coverpoint instr.find_int_lmul{
           bins m0125 = {1}; 
           bins m025 = {2}; 
           bins m05 = {3}; 
           bins m1 = {4}; 
           bins m2 = {5}; 
           bins m4 = {6}; 
           bins m8 = {7}; 
        }
    cp_sew : coverpoint instr.find_sew{
           bins e8 = {8}; 
           bins e16 = {16}; 
           bins e32 = {32}; 
           bins e64 = {64}; 
        }
  `CG_END

  `V_INSTR_CG_BEGIN(vwredsum_vs)
	  cp_vl   : coverpoint instr.find_vl{
			     bins vl0 = {0};
					 bins vl0vlmax = {[1:63]};
					 bins vlmax = {64};
				 }
    cp_lmul : coverpoint instr.find_int_lmul{
           bins m0125 = {1}; 
           bins m025 = {2}; 
           bins m05 = {3}; 
           bins m1 = {4}; 
           bins m2 = {5}; 
           bins m4 = {6}; 
           bins m8 = {7}; 
        }
    cp_sew : coverpoint instr.find_sew{
           bins e8 = {8}; 
           bins e16 = {16}; 
           bins e32 = {32}; 
           bins e64 = {64}; 
        }
  `CG_END

  `V_INSTR_CG_BEGIN(vfredosum_vs)
	  cp_vl   : coverpoint instr.find_vl{
			     bins vl0 = {0};
					 bins vl0vlmax = {[1:31]};
					 bins vlmax = {32};
				 }
    cp_lmul : coverpoint instr.find_int_lmul{
           bins m0125 = {1}; 
           bins m025 = {2}; 
           bins m05 = {3}; 
           bins m1 = {4}; 
           bins m2 = {5}; 
           bins m4 = {6}; 
           bins m8 = {7}; 
        }
    cp_sew : coverpoint instr.find_sew{
           bins e8 = {8}; 
           bins e16 = {16}; 
           bins e32 = {32}; 
           bins e64 = {64}; 
        }
  `CG_END

  `V_INSTR_CG_BEGIN(vfredusum_vs)
	  cp_vl   : coverpoint instr.find_vl{
			     bins vl0 = {0};
					 bins vl0vlmax = {[1:31]};
					 bins vlmax = {32};
				 }
    cp_lmul : coverpoint instr.find_int_lmul{
           bins m0125 = {1}; 
           bins m025 = {2}; 
           bins m05 = {3}; 
           bins m1 = {4}; 
           bins m2 = {5}; 
           bins m4 = {6}; 
           bins m8 = {7}; 
        }
    cp_sew : coverpoint instr.find_sew{
           bins e8 = {8}; 
           bins e16 = {16}; 
           bins e32 = {32}; 
           bins e64 = {64}; 
        }
  `CG_END

  `V_INSTR_CG_BEGIN(vfredmax_vs)
	  cp_vl   : coverpoint instr.find_vl{
			     bins vl0 = {0};
					 bins vl0vlmax = {[1:31]};
					 bins vlmax = {32};
				 }
    cp_lmul : coverpoint instr.find_int_lmul{
           bins m0125 = {1}; 
           bins m025 = {2}; 
           bins m05 = {3}; 
           bins m1 = {4}; 
           bins m2 = {5}; 
           bins m4 = {6}; 
           bins m8 = {7}; 
        }
    cp_sew : coverpoint instr.find_sew{
           bins e8 = {8}; 
           bins e16 = {16}; 
           bins e32 = {32}; 
           bins e64 = {64}; 
        }
  `CG_END

  `V_INSTR_CG_BEGIN(vfredmin_vs)
	  cp_vl   : coverpoint instr.find_vl{
			     bins vl0 = {0};
					 bins vl0vlmax = {[1:31]};
					 bins vlmax = {32};
				 }
    cp_lmul : coverpoint instr.find_int_lmul{
           bins m0125 = {1}; 
           bins m025 = {2}; 
           bins m05 = {3}; 
           bins m1 = {4}; 
           bins m2 = {5}; 
           bins m4 = {6}; 
           bins m8 = {7}; 
        }
    cp_sew : coverpoint instr.find_sew{
           bins e8 = {8}; 
           bins e16 = {16}; 
           bins e32 = {32}; 
           bins e64 = {64}; 
        }
  `CG_END

  `V_INSTR_CG_BEGIN(vfwredosum_vs)
	  cp_vl   : coverpoint instr.find_vl{
			     bins vl0 = {0};
					 bins vl0vlmax = {[1:15]};
					 bins vlmax = {16};
				 }
    cp_lmul : coverpoint instr.find_int_lmul{
           bins m0125 = {1}; 
           bins m025 = {2}; 
           bins m05 = {3}; 
           bins m1 = {4}; 
           bins m2 = {5}; 
           bins m4 = {6}; 
           bins m8 = {7}; 
        }
    cp_sew : coverpoint instr.find_sew{
           bins e8 = {8}; 
           bins e16 = {16}; 
           bins e32 = {32}; 
           bins e64 = {64}; 
        }
  `CG_END

  `V_INSTR_CG_BEGIN(vfwredusum_vs)
	  cp_vl   : coverpoint instr.find_vl{
			     bins vl0 = {0};
					 bins vl0vlmax = {[1:15]};
					 bins vlmax = {16};
				 }
    cp_lmul : coverpoint instr.find_int_lmul{
           bins m0125 = {1}; 
           bins m025 = {2}; 
           bins m05 = {3}; 
           bins m1 = {4}; 
           bins m2 = {5}; 
           bins m4 = {6}; 
           bins m8 = {7}; 
        }
    cp_sew : coverpoint instr.find_sew{
           bins e8 = {8}; 
           bins e16 = {16}; 
           bins e32 = {32}; 
           bins e64 = {64}; 
        }
  `CG_END

  `V_INSTR_CG_BEGIN(vmand_mm)
	  cp_vl   : coverpoint instr.find_vl{
			     bins vl0 = {0};
					 bins vl0vlmax = {[1:127]};
					 bins vlmax = {128};
				 }
    cp_lmul : coverpoint instr.find_int_lmul{
           bins m0125 = {1}; 
           bins m025 = {2}; 
           bins m05 = {3}; 
           bins m1 = {4}; 
           bins m2 = {5}; 
           bins m4 = {6}; 
           bins m8 = {7}; 
        }
    cp_sew : coverpoint instr.find_sew{
           bins e8 = {8}; 
           bins e16 = {16}; 
           bins e32 = {32}; 
           bins e64 = {64}; 
        }
  `CG_END

  `V_INSTR_CG_BEGIN(vmnand_mm)
	  cp_vl   : coverpoint instr.find_vl{
			     bins vl0 = {0};
					 bins vl0vlmax = {[1:127]};
					 bins vlmax = {128};
				 }
    cp_lmul : coverpoint instr.find_int_lmul{
           bins m0125 = {1}; 
           bins m025 = {2}; 
           bins m05 = {3}; 
           bins m1 = {4}; 
           bins m2 = {5}; 
           bins m4 = {6}; 
           bins m8 = {7}; 
        }
    cp_sew : coverpoint instr.find_sew{
           bins e8 = {8}; 
           bins e16 = {16}; 
           bins e32 = {32}; 
           bins e64 = {64}; 
        }
  `CG_END

  `V_INSTR_CG_BEGIN(vmandn_mm)
	  cp_vl   : coverpoint instr.find_vl{
			     bins vl0 = {0};
					 bins vl0vlmax = {[1:127]};
					 bins vlmax = {128};
				 }
    cp_lmul : coverpoint instr.find_int_lmul{
           bins m0125 = {1}; 
           bins m025 = {2}; 
           bins m05 = {3}; 
           bins m1 = {4}; 
           bins m2 = {5}; 
           bins m4 = {6}; 
           bins m8 = {7}; 
        }
    cp_sew : coverpoint instr.find_sew{
           bins e8 = {8}; 
           bins e16 = {16}; 
           bins e32 = {32}; 
           bins e64 = {64}; 
        }
  `CG_END

  `V_INSTR_CG_BEGIN(vmxor_mm)
	  cp_vl   : coverpoint instr.find_vl{
			     bins vl0 = {0};
					 bins vl0vlmax = {[1:127]};
					 bins vlmax = {128};
				 }
    cp_lmul : coverpoint instr.find_int_lmul{
           bins m0125 = {1}; 
           bins m025 = {2}; 
           bins m05 = {3}; 
           bins m1 = {4}; 
           bins m2 = {5}; 
           bins m4 = {6}; 
           bins m8 = {7}; 
        }
    cp_sew : coverpoint instr.find_sew{
           bins e8 = {8}; 
           bins e16 = {16}; 
           bins e32 = {32}; 
           bins e64 = {64}; 
        }
  `CG_END

  `V_INSTR_CG_BEGIN(vmor_mm)
	  cp_vl   : coverpoint instr.find_vl{
			     bins vl0 = {0};
					 bins vl0vlmax = {[1:127]};
					 bins vlmax = {128};
				 }
    cp_lmul : coverpoint instr.find_int_lmul{
           bins m0125 = {1}; 
           bins m025 = {2}; 
           bins m05 = {3}; 
           bins m1 = {4}; 
           bins m2 = {5}; 
           bins m4 = {6}; 
           bins m8 = {7}; 
        }
    cp_sew : coverpoint instr.find_sew{
           bins e8 = {8}; 
           bins e16 = {16}; 
           bins e32 = {32}; 
           bins e64 = {64}; 
        }
  `CG_END

  `V_INSTR_CG_BEGIN(vmnor_mm)
	  cp_vl   : coverpoint instr.find_vl{
			     bins vl0 = {0};
					 bins vl0vlmax = {[1:127]};
					 bins vlmax = {128};
				 }
    cp_lmul : coverpoint instr.find_int_lmul{
           bins m0125 = {1}; 
           bins m025 = {2}; 
           bins m05 = {3}; 
           bins m1 = {4}; 
           bins m2 = {5}; 
           bins m4 = {6}; 
           bins m8 = {7}; 
        }
    cp_sew : coverpoint instr.find_sew{
           bins e8 = {8}; 
           bins e16 = {16}; 
           bins e32 = {32}; 
           bins e64 = {64}; 
        }
  `CG_END

  `V_INSTR_CG_BEGIN(vmorn_mm)
	  cp_vl   : coverpoint instr.find_vl{
			     bins vl0 = {0};
					 bins vl0vlmax = {[1:127]};
					 bins vlmax = {128};
				 }
    cp_lmul : coverpoint instr.find_int_lmul{
           bins m0125 = {1}; 
           bins m025 = {2}; 
           bins m05 = {3}; 
           bins m1 = {4}; 
           bins m2 = {5}; 
           bins m4 = {6}; 
           bins m8 = {7}; 
        }
    cp_sew : coverpoint instr.find_sew{
           bins e8 = {8}; 
           bins e16 = {16}; 
           bins e32 = {32}; 
           bins e64 = {64}; 
        }
  `CG_END

  `V_INSTR_CG_BEGIN(vmxnor_mm)
	  cp_vl   : coverpoint instr.find_vl{
			     bins vl0 = {0};
					 bins vl0vlmax = {[1:127]};
					 bins vlmax = {128};
				 }
    cp_lmul : coverpoint instr.find_int_lmul{
           bins m0125 = {1}; 
           bins m025 = {2}; 
           bins m05 = {3}; 
           bins m1 = {4}; 
           bins m2 = {5}; 
           bins m4 = {6}; 
           bins m8 = {7}; 
        }
    cp_sew : coverpoint instr.find_sew{
           bins e8 = {8}; 
           bins e16 = {16}; 
           bins e32 = {32}; 
           bins e64 = {64}; 
        }
  `CG_END

  `V_INSTR_CG_BEGIN(vpopc_m)
	  cp_vl   : coverpoint instr.find_vl{
			     bins vl0 = {0};
					 bins vl0vlmax = {[1:63]};
					 bins vlmax = {64};
				 }
    cp_lmul : coverpoint instr.find_int_lmul{
           bins m0125 = {1}; 
           bins m025 = {2}; 
           bins m05 = {3}; 
           bins m1 = {4}; 
           bins m2 = {5}; 
           bins m4 = {6}; 
           bins m8 = {7}; 
        }
    cp_sew : coverpoint instr.find_sew{
           bins e8 = {8}; 
           bins e16 = {16}; 
           bins e32 = {32}; 
           bins e64 = {64}; 
        }
  `CG_END

  `V_INSTR_CG_BEGIN(vfirst_m)
	  cp_vl   : coverpoint instr.find_vl{
			     bins vl0 = {0};
					 bins vl0vlmax = {[1:63]};
					 bins vlmax = {64};
				 }
    cp_lmul : coverpoint instr.find_int_lmul{
           bins m0125 = {1}; 
           bins m025 = {2}; 
           bins m05 = {3}; 
           bins m1 = {4}; 
           bins m2 = {5}; 
           bins m4 = {6}; 
           bins m8 = {7}; 
        }
    cp_sew : coverpoint instr.find_sew{
           bins e8 = {8}; 
           bins e16 = {16}; 
           bins e32 = {32}; 
           bins e64 = {64}; 
        }
  `CG_END

  `V_INSTR_CG_BEGIN(vmsbf_m)
	  cp_vl   : coverpoint instr.find_vl{
			     bins vl0 = {0};
					 bins vl0vlmax = {[1:127]};
					 bins vlmax = {128};
				 }
    cp_lmul : coverpoint instr.find_int_lmul{
           bins m0125 = {1}; 
           bins m025 = {2}; 
           bins m05 = {3}; 
           bins m1 = {4}; 
           bins m2 = {5}; 
           bins m4 = {6}; 
           bins m8 = {7}; 
        }
    cp_sew : coverpoint instr.find_sew{
           bins e8 = {8}; 
           bins e16 = {16}; 
           bins e32 = {32}; 
           bins e64 = {64}; 
        }
  `CG_END

  `V_INSTR_CG_BEGIN(vmsif_m)
	  cp_vl   : coverpoint instr.find_vl{
			     bins vl0 = {0};
					 bins vl0vlmax = {[1:127]};
					 bins vlmax = {128};
				 }
    cp_lmul : coverpoint instr.find_int_lmul{
           bins m0125 = {1}; 
           bins m025 = {2}; 
           bins m05 = {3}; 
           bins m1 = {4}; 
           bins m2 = {5}; 
           bins m4 = {6}; 
           bins m8 = {7}; 
        }
    cp_sew : coverpoint instr.find_sew{
           bins e8 = {8}; 
           bins e16 = {16}; 
           bins e32 = {32}; 
           bins e64 = {64}; 
        }
  `CG_END

  `V_INSTR_CG_BEGIN(vmsof_m)
	  cp_vl   : coverpoint instr.find_vl{
			     bins vl0 = {0};
					 bins vl0vlmax = {[1:127]};
					 bins vlmax = {128};
				 }
    cp_lmul : coverpoint instr.find_int_lmul{
           bins m0125 = {1}; 
           bins m025 = {2}; 
           bins m05 = {3}; 
           bins m1 = {4}; 
           bins m2 = {5}; 
           bins m4 = {6}; 
           bins m8 = {7}; 
        }
    cp_sew : coverpoint instr.find_sew{
           bins e8 = {8}; 
           bins e16 = {16}; 
           bins e32 = {32}; 
           bins e64 = {64}; 
        }
  `CG_END

  `V_INSTR_CG_BEGIN(viota_m)
	  cp_vl   : coverpoint instr.find_vl{
			     bins vl0 = {0};
					 bins vl0vlmax = {[1:127]};
					 bins vlmax = {128};
				 }
    cp_lmul : coverpoint instr.find_int_lmul{
           bins m0125 = {1}; 
           bins m025 = {2}; 
           bins m05 = {3}; 
           bins m1 = {4}; 
           bins m2 = {5}; 
           bins m4 = {6}; 
           bins m8 = {7}; 
        }
    cp_sew : coverpoint instr.find_sew{
           bins e8 = {8}; 
           bins e16 = {16}; 
           bins e32 = {32}; 
           bins e64 = {64}; 
        }
  `CG_END

  `V_INSTR_CG_BEGIN(vid_v)
	  cp_vl   : coverpoint instr.find_vl{
			     bins vl0 = {0};
					 bins vl0vlmax = {[1:127]};
					 bins vlmax = {128};
				 }
    cp_lmul : coverpoint instr.find_int_lmul{
           bins m0125 = {1}; 
           bins m025 = {2}; 
           bins m05 = {3}; 
           bins m1 = {4}; 
           bins m2 = {5}; 
           bins m4 = {6}; 
           bins m8 = {7}; 
        }
    cp_sew : coverpoint instr.find_sew{
           bins e8 = {8}; 
           bins e16 = {16}; 
           bins e32 = {32}; 
           bins e64 = {64}; 
        }
  `CG_END

  `V_INSTR_CG_BEGIN(vmv_x_s)
	  cp_vl   : coverpoint instr.find_vl{
			     bins vl0 = {0};
					 bins vl0vlmax = {[1:63]};
					 bins vlmax = {64};
				 }
    cp_lmul : coverpoint instr.find_int_lmul{
           bins m0125 = {1}; 
           bins m025 = {2}; 
           bins m05 = {3}; 
           bins m1 = {4}; 
           bins m2 = {5}; 
           bins m4 = {6}; 
           bins m8 = {7}; 
        }
    cp_sew : coverpoint instr.find_sew{
           bins e8 = {8}; 
           bins e16 = {16}; 
           bins e32 = {32}; 
           bins e64 = {64}; 
        }
  `CG_END

  `V_INSTR_CG_BEGIN(vmv_s_x)
	  cp_vl   : coverpoint instr.find_vl{
			     bins vl0 = {0};
					 bins vl0vlmax = {[1:127]};
					 bins vlmax = {128};
				 }
    cp_lmul : coverpoint instr.find_int_lmul{
           bins m0125 = {1}; 
           bins m025 = {2}; 
           bins m05 = {3}; 
           bins m1 = {4}; 
           bins m2 = {5}; 
           bins m4 = {6}; 
           bins m8 = {7}; 
        }
    cp_sew : coverpoint instr.find_sew{
           bins e8 = {8}; 
           bins e16 = {16}; 
           bins e32 = {32}; 
           bins e64 = {64}; 
        }
  `CG_END

  `V_INSTR_CG_BEGIN(vfmv_f_s)
	  cp_vl   : coverpoint instr.find_vl{
			     bins vl0 = {0};
					 bins vl0vlmax = {[1:31]};
					 bins vlmax = {32};
				 }
    cp_lmul : coverpoint instr.find_int_lmul{
           bins m0125 = {1}; 
           bins m025 = {2}; 
           bins m05 = {3}; 
           bins m1 = {4}; 
           bins m2 = {5}; 
           bins m4 = {6}; 
           bins m8 = {7}; 
        }
    cp_sew : coverpoint instr.find_sew{
           bins e8 = {8}; 
           bins e16 = {16}; 
           bins e32 = {32}; 
           bins e64 = {64}; 
        }
  `CG_END

  `V_INSTR_CG_BEGIN(vfmv_s_f)
	  cp_vl   : coverpoint instr.find_vl{
			     bins vl0 = {0};
					 bins vl0vlmax = {[1:31]};
					 bins vlmax = {32};
				 }
    cp_lmul : coverpoint instr.find_int_lmul{
           bins m0125 = {1}; 
           bins m025 = {2}; 
           bins m05 = {3}; 
           bins m1 = {4}; 
           bins m2 = {5}; 
           bins m4 = {6}; 
           bins m8 = {7}; 
        }
    cp_sew : coverpoint instr.find_sew{
           bins e8 = {8}; 
           bins e16 = {16}; 
           bins e32 = {32}; 
           bins e64 = {64}; 
        }
  `CG_END

  `V_INSTR_CG_BEGIN(vslideup)
	  cp_vl   : coverpoint instr.find_vl{
			     bins vl0 = {0};
					 bins vl0vlmax = {[1:127]};
					 bins vlmax = {128};
				 }
    cp_lmul : coverpoint instr.find_int_lmul{
           bins m0125 = {1}; 
           bins m025 = {2}; 
           bins m05 = {3}; 
           bins m1 = {4}; 
           bins m2 = {5}; 
           bins m4 = {6}; 
           bins m8 = {7}; 
        }
    cp_sew : coverpoint instr.find_sew{
           bins e8 = {8}; 
           bins e16 = {16}; 
           bins e32 = {32}; 
           bins e64 = {64}; 
        }
    //cp_variant : coverpoint instr.find_int_va_variant{
    //       bins VI = {2}; 
    //       bins VX = {3}; 
    //    }
  `CG_END

  `V_INSTR_CG_BEGIN(vslidedown)
	  cp_vl   : coverpoint instr.find_vl{
			     bins vl0 = {0};
					 bins vl0vlmax = {[1:127]};
					 bins vlmax = {128};
				 }
    cp_lmul : coverpoint instr.find_int_lmul{
           bins m0125 = {1}; 
           bins m025 = {2}; 
           bins m05 = {3}; 
           bins m1 = {4}; 
           bins m2 = {5}; 
           bins m4 = {6}; 
           bins m8 = {7}; 
        }
    cp_sew : coverpoint instr.find_sew{
           bins e8 = {8}; 
           bins e16 = {16}; 
           bins e32 = {32}; 
           bins e64 = {64}; 
        }
    //cp_variant : coverpoint instr.find_int_va_variant{
    //       bins VI = {2}; 
    //       bins VX = {3}; 
    //    }
  `CG_END

  `V_INSTR_CG_BEGIN(vslide1up)
	  cp_vl   : coverpoint instr.find_vl{
			     bins vl0 = {0};
					 bins vl0vlmax = {[1:127]};
					 bins vlmax = {128};
				 }
    cp_lmul : coverpoint instr.find_int_lmul{
           bins m0125 = {1}; 
           bins m025 = {2}; 
           bins m05 = {3}; 
           bins m1 = {4}; 
           bins m2 = {5}; 
           bins m4 = {6}; 
           bins m8 = {7}; 
        }
    cp_sew : coverpoint instr.find_sew{
           bins e8 = {8}; 
           bins e16 = {16}; 
           bins e32 = {32}; 
           bins e64 = {64}; 
        }
    //cp_variant : coverpoint instr.find_int_va_variant{
    //       bins VX = {3}; 
    //    }
  `CG_END

  `V_INSTR_CG_BEGIN(vfslide1up)
	  cp_vl   : coverpoint instr.find_vl{
			     bins vl0 = {0};
					 bins vl0vlmax = {[1:31]};
					 bins vlmax = {32};
				 }
    cp_lmul : coverpoint instr.find_int_lmul{
           bins m0125 = {1}; 
           bins m025 = {2}; 
           bins m05 = {3}; 
           bins m1 = {4}; 
           bins m2 = {5}; 
           bins m4 = {6}; 
           bins m8 = {7}; 
        }
    cp_sew : coverpoint instr.find_sew{
           bins e8 = {8}; 
           bins e16 = {16}; 
           bins e32 = {32}; 
           bins e64 = {64}; 
        }
    //cp_variant : coverpoint instr.find_int_va_variant{
    //       bins VF = {4}; 
    //    }
  `CG_END

  `V_INSTR_CG_BEGIN(vslide1down)
	  cp_vl   : coverpoint instr.find_vl{
			     bins vl0 = {0};
					 bins vl0vlmax = {[1:127]};
					 bins vlmax = {128};
				 }
    cp_lmul : coverpoint instr.find_int_lmul{
           bins m0125 = {1}; 
           bins m025 = {2}; 
           bins m05 = {3}; 
           bins m1 = {4}; 
           bins m2 = {5}; 
           bins m4 = {6}; 
           bins m8 = {7}; 
        }
    cp_sew : coverpoint instr.find_sew{
           bins e8 = {8}; 
           bins e16 = {16}; 
           bins e32 = {32}; 
           bins e64 = {64}; 
        }
    //cp_variant : coverpoint instr.find_int_va_variant{
    //       bins VX = {3}; 
    //    }
  `CG_END

  `V_INSTR_CG_BEGIN(vfslide1down)
	  cp_vl   : coverpoint instr.find_vl{
			     bins vl0 = {0};
					 bins vl0vlmax = {[1:31]};
					 bins vlmax = {32};
				 }
    cp_lmul : coverpoint instr.find_int_lmul{
           bins m0125 = {1}; 
           bins m025 = {2}; 
           bins m05 = {3}; 
           bins m1 = {4}; 
           bins m2 = {5}; 
           bins m4 = {6}; 
           bins m8 = {7}; 
        }
    cp_sew : coverpoint instr.find_sew{
           bins e8 = {8}; 
           bins e16 = {16}; 
           bins e32 = {32}; 
           bins e64 = {64}; 
        }
    //cp_variant : coverpoint instr.find_int_va_variant{
    //       bins VF = {4}; 
    //    }
  `CG_END

  `V_INSTR_CG_BEGIN(vrgather)
	  cp_vl   : coverpoint instr.find_vl{
			     bins vl0 = {0};
					 bins vl0vlmax = {[1:127]};
					 bins vlmax = {128};
				 }
    cp_lmul : coverpoint instr.find_int_lmul{
           bins m0125 = {1}; 
           bins m025 = {2}; 
           bins m05 = {3}; 
           bins m1 = {4}; 
           bins m2 = {5}; 
           bins m4 = {6}; 
           bins m8 = {7}; 
        }
    cp_sew : coverpoint instr.find_sew{
           bins e8 = {8}; 
           bins e16 = {16}; 
           bins e32 = {32}; 
           bins e64 = {64}; 
        }
    //cp_variant : coverpoint instr.find_int_va_variant{
    //       bins VI = {2}; 
    //       bins VX = {3}; 
    //       bins VV = {1}; 
    //    }
  `CG_END

  `V_INSTR_CG_BEGIN(vrgatherei16)
	  cp_vl   : coverpoint instr.find_vl{
			     bins vl0 = {0};
					 bins vl0vlmax = {[1:63]};
					 bins vlmax = {64};
				 }
    cp_lmul : coverpoint instr.find_int_lmul{
           bins m0125 = {1}; 
           bins m025 = {2}; 
           bins m05 = {3}; 
           bins m1 = {4}; 
           bins m2 = {5}; 
           bins m4 = {6}; 
           bins m8 = {7}; 
        }
    cp_sew : coverpoint instr.find_sew{
           bins e8 = {8}; 
           bins e16 = {16}; 
           bins e32 = {32}; 
           bins e64 = {64}; 
        }
    //cp_variant : coverpoint instr.find_int_va_variant{
    //       bins VV = {1}; 
    //    }
  `CG_END

  `V_INSTR_CG_BEGIN(vcompress)
	  cp_vl   : coverpoint instr.find_vl{
			     bins vl0 = {0};
					 bins vl0vlmax = {[1:127]};
					 bins vlmax = {128};
				 }
    cp_lmul : coverpoint instr.find_int_lmul{
           bins m0125 = {1}; 
           bins m025 = {2}; 
           bins m05 = {3}; 
           bins m1 = {4}; 
           bins m2 = {5}; 
           bins m4 = {6}; 
           bins m8 = {7}; 
        }
    cp_sew : coverpoint instr.find_sew{
           bins e8 = {8}; 
           bins e16 = {16}; 
           bins e32 = {32}; 
           bins e64 = {64}; 
        }
    //cp_variant : coverpoint instr.find_int_va_variant{
    //       bins VM = {14}; 
    //    }
  `CG_END

  `V_INSTR_CG_BEGIN(vmv1r_v)
	  cp_vl   : coverpoint instr.find_vl{
			     bins vl0 = {0};
					 bins vl0vlmax = {[1:15]};
					 bins vlmax = {16};
				 }
    cp_lmul : coverpoint instr.find_int_lmul{
           bins m0125 = {1}; 
           bins m025 = {2}; 
           bins m05 = {3}; 
           bins m1 = {4}; 
           bins m2 = {5}; 
           bins m4 = {6}; 
           bins m8 = {7}; 
        }
    cp_sew : coverpoint instr.find_sew{
           bins e8 = {8}; 
           bins e16 = {16}; 
           bins e32 = {32}; 
           bins e64 = {64}; 
        }
  `CG_END

  `V_INSTR_CG_BEGIN(vmv2r_v)
	  cp_vl   : coverpoint instr.find_vl{
			     bins vl0 = {0};
					 bins vl0vlmax = {[1:31]};
					 bins vlmax = {32};
				 }
    cp_lmul : coverpoint instr.find_int_lmul{
           bins m0125 = {1}; 
           bins m025 = {2}; 
           bins m05 = {3}; 
           bins m1 = {4}; 
           bins m2 = {5}; 
           bins m4 = {6}; 
           bins m8 = {7}; 
        }
    cp_sew : coverpoint instr.find_sew{
           bins e8 = {8}; 
           bins e16 = {16}; 
           bins e32 = {32}; 
           bins e64 = {64}; 
        }
  `CG_END

  `V_INSTR_CG_BEGIN(vmv4r_v)
	  cp_vl   : coverpoint instr.find_vl{
			     bins vl0 = {0};
					 bins vl0vlmax = {[1:63]};
					 bins vlmax = {64};
				 }
    cp_lmul : coverpoint instr.find_int_lmul{
           bins m0125 = {1}; 
           bins m025 = {2}; 
           bins m05 = {3}; 
           bins m1 = {4}; 
           bins m2 = {5}; 
           bins m4 = {6}; 
           bins m8 = {7}; 
        }
    cp_sew : coverpoint instr.find_sew{
           bins e8 = {8}; 
           bins e16 = {16}; 
           bins e32 = {32}; 
           bins e64 = {64}; 
        }
  `CG_END

  `V_INSTR_CG_BEGIN(vmv8r_v)
	  cp_vl   : coverpoint instr.find_vl{
			     bins vl0 = {0};
					 bins vl0vlmax = {[1:127]};
					 bins vlmax = {128};
				 }
    cp_lmul : coverpoint instr.find_int_lmul{
           bins m0125 = {1}; 
           bins m025 = {2}; 
           bins m05 = {3}; 
           bins m1 = {4}; 
           bins m2 = {5}; 
           bins m4 = {6}; 
           bins m8 = {7}; 
        }
    cp_sew : coverpoint instr.find_sew{
           bins e8 = {8}; 
           bins e16 = {16}; 
           bins e32 = {32}; 
           bins e64 = {64}; 
        }
  `CG_END

  `V_INSTR_CG_BEGIN(vle_v)
	  cp_vl   : coverpoint instr.find_vl{
           bins vl0 = {0};
					 bins vl0vlmax = {[1:127]};
					 bins vlmax = {128};
				 }
    cp_lmul : coverpoint instr.find_int_lmul{
           bins m0125 = {1}; 
           bins m025 = {2}; 
           bins m05 = {3}; 
           bins m1 = {4}; 
           bins m2 = {5}; 
           bins m4 = {6}; 
           bins m8 = {7}; 
        }
    cp_sew : coverpoint instr.find_sew{
           bins e8 = {8}; 
           bins e16 = {16}; 
           bins e32 = {32}; 
           bins e64 = {64}; 
        }
  `CG_END

  `V_INSTR_CG_BEGIN(vse_v)
	  cp_vl   : coverpoint instr.find_vl{
			     bins vl0 = {0};
					 bins vl0vlmax = {[1:127]};
					 bins vlmax = {128};
				 }
    cp_lmul : coverpoint instr.find_int_lmul{
           bins m0125 = {1}; 
           bins m025 = {2}; 
           bins m05 = {3}; 
           bins m1 = {4}; 
           bins m2 = {5}; 
           bins m4 = {6}; 
           bins m8 = {7}; 
        }
    cp_sew : coverpoint instr.find_sew{
           bins e8 = {8}; 
           bins e16 = {16}; 
           bins e32 = {32}; 
           bins e64 = {64}; 
        }
  `CG_END

  `V_INSTR_CG_BEGIN(vlm_v)
	  cp_vl   : coverpoint instr.find_vl{
			     bins vl0 = {0};
					 bins vl0vlmax = {[1:127]};
					 bins vlmax = {128};
				 }
    cp_lmul : coverpoint instr.find_int_lmul{
           bins m0125 = {1}; 
           bins m025 = {2}; 
           bins m05 = {3}; 
           bins m1 = {4}; 
           bins m2 = {5}; 
           bins m4 = {6}; 
           bins m8 = {7}; 
        }
    cp_sew : coverpoint instr.find_sew{
           bins e8 = {8}; 
           bins e16 = {16}; 
           bins e32 = {32}; 
           bins e64 = {64}; 
        }
  `CG_END

  `V_INSTR_CG_BEGIN(vsm_v)
	  cp_vl   : coverpoint instr.find_vl{
			     bins vl0 = {0};
					 bins vl0vlmax = {[1:127]};
					 bins vlmax = {128};
				 }
    cp_lmul : coverpoint instr.find_int_lmul{
           bins m0125 = {1}; 
           bins m025 = {2}; 
           bins m05 = {3}; 
           bins m1 = {4}; 
           bins m2 = {5}; 
           bins m4 = {6}; 
           bins m8 = {7}; 
        }
    cp_sew : coverpoint instr.find_sew{
           bins e8 = {8}; 
           bins e16 = {16}; 
           bins e32 = {32}; 
           bins e64 = {64}; 
        }
  `CG_END

  `V_INSTR_CG_BEGIN(vlse_v)
	  cp_vl   : coverpoint instr.find_vl{
			     bins vl0 = {0};
					 bins vl0vlmax = {[1:127]};
					 bins vlmax = {128};
				 }
    cp_lmul : coverpoint instr.find_int_lmul{
           bins m0125 = {1}; 
           bins m025 = {2}; 
           bins m05 = {3}; 
           bins m1 = {4}; 
           bins m2 = {5}; 
           bins m4 = {6}; 
           bins m8 = {7}; 
        }
    cp_sew : coverpoint instr.find_sew{
           bins e8 = {8}; 
           bins e16 = {16}; 
           bins e32 = {32}; 
           bins e64 = {64}; 
        }
  `CG_END

  `V_INSTR_CG_BEGIN(vsse_v)
	  cp_vl   : coverpoint instr.find_vl{
			     bins vl0 = {0};
					 bins vl0vlmax = {[1:127]};
					 bins vlmax = {128};
				 }
    cp_lmul : coverpoint instr.find_int_lmul{
           bins m0125 = {1}; 
           bins m025 = {2}; 
           bins m05 = {3}; 
           bins m1 = {4}; 
           bins m2 = {5}; 
           bins m4 = {6}; 
           bins m8 = {7}; 
        }
    cp_sew : coverpoint instr.find_sew{
           bins e8 = {8}; 
           bins e16 = {16}; 
           bins e32 = {32}; 
           bins e64 = {64}; 
        }
  `CG_END

  `V_INSTR_CG_BEGIN(vluxei_v)
	  cp_vl   : coverpoint instr.find_vl{
			     bins vl0 = {0};
					 bins vl0vlmax = {[1:127]};
					 bins vlmax = {128};
				 }
    cp_lmul : coverpoint instr.find_int_lmul{
           bins m0125 = {1}; 
           bins m025 = {2}; 
           bins m05 = {3}; 
           bins m1 = {4}; 
           bins m2 = {5}; 
           bins m4 = {6}; 
           bins m8 = {7}; 
        }
    cp_sew : coverpoint instr.find_sew{
           bins e8 = {8}; 
           bins e16 = {16}; 
           bins e32 = {32}; 
           bins e64 = {64}; 
        }
  `CG_END

  `V_INSTR_CG_BEGIN(vloxei_v)
	  cp_vl   : coverpoint instr.find_vl{
			     bins vl0 = {0};
					 bins vl0vlmax = {[1:127]};
					 bins vlmax = {128};
				 }
    cp_lmul : coverpoint instr.find_int_lmul{
           bins m0125 = {1}; 
           bins m025 = {2}; 
           bins m05 = {3}; 
           bins m1 = {4}; 
           bins m2 = {5}; 
           bins m4 = {6}; 
           bins m8 = {7}; 
        }
    cp_sew : coverpoint instr.find_sew{
           bins e8 = {8}; 
           bins e16 = {16}; 
           bins e32 = {32}; 
           bins e64 = {64}; 
        }
  `CG_END

  `V_INSTR_CG_BEGIN(vsuxei_v)
	  cp_vl   : coverpoint instr.find_vl{
			     bins vl0 = {0};
					 bins vl0vlmax = {[1:127]};
					 bins vlmax = {128};
				 }
    cp_lmul : coverpoint instr.find_int_lmul{
           bins m0125 = {1}; 
           bins m025 = {2}; 
           bins m05 = {3}; 
           bins m1 = {4}; 
           bins m2 = {5}; 
           bins m4 = {6}; 
           bins m8 = {7}; 
        }
    cp_sew : coverpoint instr.find_sew{
           bins e8 = {8}; 
           bins e16 = {16}; 
           bins e32 = {32}; 
           bins e64 = {64}; 
        }
  `CG_END

  `V_INSTR_CG_BEGIN(vsoxei_v)
	  cp_vl   : coverpoint instr.find_vl{
			     bins vl0 = {0};
					 bins vl0vlmax = {[1:127]};
					 bins vlmax = {128};
				 }
    cp_lmul : coverpoint instr.find_int_lmul{
           bins m0125 = {1}; 
           bins m025 = {2}; 
           bins m05 = {3}; 
           bins m1 = {4}; 
           bins m2 = {5}; 
           bins m4 = {6}; 
           bins m8 = {7}; 
        }
    cp_sew : coverpoint instr.find_sew{
           bins e8 = {8}; 
           bins e16 = {16}; 
           bins e32 = {32}; 
           bins e64 = {64}; 
        }
  `CG_END

  `V_INSTR_CG_BEGIN(vleff_v)
	  cp_vl   : coverpoint instr.find_vl{
			     bins vl0 = {0};
					 bins vl0vlmax = {[1:127]};
					 bins vlmax = {128};
				 }
    cp_lmul : coverpoint instr.find_int_lmul{
           bins m0125 = {1}; 
           bins m025 = {2}; 
           bins m05 = {3}; 
           bins m1 = {4}; 
           bins m2 = {5}; 
           bins m4 = {6}; 
           bins m8 = {7}; 
        }
    cp_sew : coverpoint instr.find_sew{
           bins e8 = {8}; 
           bins e16 = {16}; 
           bins e32 = {32}; 
           bins e64 = {64}; 
        }
  `CG_END

  `V_INSTR_CG_BEGIN(vlsege_v)
	  cp_vl   : coverpoint instr.find_vl{
			     bins vl0 = {0};
					 bins vl0vlmax = {[1:127]};
					 bins vlmax = {128};
				 }
    cp_lmul : coverpoint instr.find_int_lmul{
           bins m0125 = {1}; 
           bins m025 = {2}; 
           bins m05 = {3}; 
           bins m1 = {4}; 
           bins m2 = {5}; 
           bins m4 = {6}; 
           bins m8 = {7}; 
        }
    cp_sew : coverpoint instr.find_sew{
           bins e8 = {8}; 
           bins e16 = {16}; 
           bins e32 = {32}; 
           bins e64 = {64}; 
        }
  `CG_END

  `V_INSTR_CG_BEGIN(vssege_v)
	  cp_vl   : coverpoint instr.find_vl{
			     bins vl0 = {0};
					 bins vl0vlmax = {[1:127]};
					 bins vlmax = {128};
				 }
    cp_lmul : coverpoint instr.find_int_lmul{
           bins m0125 = {1}; 
           bins m025 = {2}; 
           bins m05 = {3}; 
           bins m1 = {4}; 
           bins m2 = {5}; 
           bins m4 = {6}; 
           bins m8 = {7}; 
        }
    cp_sew : coverpoint instr.find_sew{
           bins e8 = {8}; 
           bins e16 = {16}; 
           bins e32 = {32}; 
           bins e64 = {64}; 
        }
  `CG_END

  `V_INSTR_CG_BEGIN(vlsegeff_v)
	  cp_vl   : coverpoint instr.find_vl{
			     bins vl0 = {0};
					 bins vl0vlmax = {[1:127]};
					 bins vlmax = {128};
				 }
    cp_lmul : coverpoint instr.find_int_lmul{
           bins m0125 = {1}; 
           bins m025 = {2}; 
           bins m05 = {3}; 
           bins m1 = {4}; 
           bins m2 = {5}; 
           bins m4 = {6}; 
           bins m8 = {7}; 
        }
    cp_sew : coverpoint instr.find_sew{
           bins e8 = {8}; 
           bins e16 = {16}; 
           bins e32 = {32}; 
           bins e64 = {64}; 
        }
  `CG_END

  `V_INSTR_CG_BEGIN(vlssege_v)
	  cp_vl   : coverpoint instr.find_vl{
			     bins vl0 = {0};
					 bins vl0vlmax = {[1:127]};
					 bins vlmax = {128};
				 }
    cp_lmul : coverpoint instr.find_int_lmul{
           bins m0125 = {1}; 
           bins m025 = {2}; 
           bins m05 = {3}; 
           bins m1 = {4}; 
           bins m2 = {5}; 
           bins m4 = {6}; 
           bins m8 = {7}; 
        }
    cp_sew : coverpoint instr.find_sew{
           bins e8 = {8}; 
           bins e16 = {16}; 
           bins e32 = {32}; 
           bins e64 = {64}; 
        }
  `CG_END

  `V_INSTR_CG_BEGIN(vsssege_v)
	  cp_vl   : coverpoint instr.find_vl{
			     bins vl0 = {0};
					 bins vl0vlmax = {[1:127]};
					 bins vlmax = {128};
				 }
    cp_lmul : coverpoint instr.find_int_lmul{
           bins m0125 = {1}; 
           bins m025 = {2}; 
           bins m05 = {3}; 
           bins m1 = {4}; 
           bins m2 = {5}; 
           bins m4 = {6}; 
           bins m8 = {7}; 
        }
    cp_sew : coverpoint instr.find_sew{
           bins e8 = {8}; 
           bins e16 = {16}; 
           bins e32 = {32}; 
           bins e64 = {64}; 
        }
  `CG_END

  `V_INSTR_CG_BEGIN(vluxsegei_v)
	  cp_vl   : coverpoint instr.find_vl{
			     bins vl0 = {0};
					 bins vl0vlmax = {[1:127]};
					 bins vlmax = {128};
				 }
    cp_lmul : coverpoint instr.find_int_lmul{
           bins m0125 = {1}; 
           bins m025 = {2}; 
           bins m05 = {3}; 
           bins m1 = {4}; 
           bins m2 = {5}; 
           bins m4 = {6}; 
           bins m8 = {7}; 
        }
    cp_sew : coverpoint instr.find_sew{
           bins e8 = {8}; 
           bins e16 = {16}; 
           bins e32 = {32}; 
           bins e64 = {64}; 
        }
  `CG_END

  `V_INSTR_CG_BEGIN(vloxsegei_v)
	  cp_vl   : coverpoint instr.find_vl{
			     bins vl0 = {0};
					 bins vl0vlmax = {[1:127]};
					 bins vlmax = {128};
				 }
    cp_lmul : coverpoint instr.find_int_lmul{
           bins m0125 = {1}; 
           bins m025 = {2}; 
           bins m05 = {3}; 
           bins m1 = {4}; 
           bins m2 = {5}; 
           bins m4 = {6}; 
           bins m8 = {7}; 
        }
    cp_sew : coverpoint instr.find_sew{
           bins e8 = {8}; 
           bins e16 = {16}; 
           bins e32 = {32}; 
           bins e64 = {64}; 
        }
  `CG_END

  `V_INSTR_CG_BEGIN(vsuxsegei_v)
	  cp_vl   : coverpoint instr.find_vl{
			     bins vl0 = {0};
					 bins vl0vlmax = {[1:127]};
					 bins vlmax = {128};
				 }
    cp_lmul : coverpoint instr.find_int_lmul{
           bins m0125 = {1}; 
           bins m025 = {2}; 
           bins m05 = {3}; 
           bins m1 = {4}; 
           bins m2 = {5}; 
           bins m4 = {6}; 
           bins m8 = {7}; 
        }
    cp_sew : coverpoint instr.find_sew{
           bins e8 = {8}; 
           bins e16 = {16}; 
           bins e32 = {32}; 
           bins e64 = {64}; 
        }
  `CG_END

  `V_INSTR_CG_BEGIN(vsoxsegei_v)
	  cp_vl   : coverpoint instr.find_vl{
			     bins vl0 = {0};
					 bins vl0vlmax = {[1:127]};
					 bins vlmax = {128};
				 }
    cp_lmul : coverpoint instr.find_int_lmul{
           bins m0125 = {1}; 
           bins m025 = {2}; 
           bins m05 = {3}; 
           bins m1 = {4}; 
           bins m2 = {5}; 
           bins m4 = {6}; 
           bins m8 = {7}; 
        }
    cp_sew : coverpoint instr.find_sew{
           bins e8 = {8}; 
           bins e16 = {16}; 
           bins e32 = {32}; 
           bins e64 = {64}; 
        }
  `CG_END

  `V_INSTR_CG_BEGIN(vlre_v)
	  cp_vl   : coverpoint instr.find_vl{
			     bins vl0 = {0};
					 bins vl0vlmax = {[1:127]};
					 bins vlmax = {128};
				 }
    cp_lmul : coverpoint instr.find_int_lmul{
           bins m0125 = {1}; 
           bins m025 = {2}; 
           bins m05 = {3}; 
           bins m1 = {4}; 
           bins m2 = {5}; 
           bins m4 = {6}; 
           bins m8 = {7}; 
        }
    cp_sew : coverpoint instr.find_sew{
           bins e8 = {8}; 
           bins e16 = {16}; 
           bins e32 = {32}; 
           bins e64 = {64}; 
        }
  `CG_END

  `V_INSTR_CG_BEGIN(vsr_v)
	  cp_vl   : coverpoint instr.find_vl{
			     bins vl0 = {0};
					 bins vl0vlmax = {[1:127]};
					 bins vlmax = {128};
				 }
    cp_lmul : coverpoint instr.find_int_lmul{
           bins m0125 = {1}; 
           bins m025 = {2}; 
           bins m05 = {3}; 
           bins m1 = {4}; 
           bins m2 = {5}; 
           bins m4 = {6}; 
           bins m8 = {7}; 
        }
    cp_sew : coverpoint instr.find_sew{
           bins e8 = {8}; 
           bins e16 = {16}; 
           bins e32 = {32}; 
           bins e64 = {64}; 
        }
  `CG_END

	//covergroup allreg_cg with function sample(riscv_vector_instr instr);
	//	 cp_vd : coverpoint instr.vd;
	//	 cp_rs1 : coverpoint instr.rs1;
	//	 cp_rs2 : coverpoint instr.rs2;
	//	 cp_vs1 : coverpoint instr.vs1;
	//	 cp_fs1 : coverpoint instr.fs1;
	//	 cp_vs2 : coverpoint instr.vs2;
	//	 cp_vs3 : coverpoint instr.vs3;
	//endgroup

	//covergroup reg_permutation_cg with function sample(riscv_vector_instr instr);
	//	 cp_rd : coverpoint instr.rd;
	//	 cp_fd : coverpoint instr.fd;
	//	 cp_vd : coverpoint instr.vd;
	//	 cp_rs1 : coverpoint instr.rs1;
	//	 cp_fs1 : coverpoint instr.fs1;
	//	 cp_vs1 : coverpoint instr.vs1;
	//	 cp_vs2 : coverpoint instr.vs2;
	//endgroup
  
	covergroup vsetvli_cg with function sample(bit vsetvli_valid);
     cp_vsetvli : coverpoint vsetvli_valid{
            bins hit = {1'b1};
		 }
	 endgroup
	
	 covergroup vsetvl_cg with function sample(bit vsetvl_valid);
     cp_vsetvl : coverpoint vsetvl_valid{
            bins hit = {1'b1};
		 }
	 endgroup
	
	 covergroup vsetivli_cg with function sample(bit vsetivli_valid);
     cp_vsetivli : coverpoint vsetivli_valid{
            bins hit = {1'b1};
		 }
	 endgroup
  
	covergroup arithmetic_cg with function sample(bit [31:0] binary);
     cp_vdrd         : coverpoint binary[11:7];
     cp_vs1rs1simm5  : coverpoint binary[19:15];
     cp_vs2          : coverpoint binary[24:20];
     cp_func3fun6    : coverpoint {binary[31:25],binary[14:12]}{
			 wildcard ignore_bins func3111 = {10'b???????111};
			 option.auto_bin_max = 1024;
		 }
	endgroup

	covergroup load_cg with function sample(bit [31:0] binary);
     cp_vdvs3        : coverpoint binary[11:7];
     cp_vs1          : coverpoint binary[19:15];
     cp_lumoprs2vs2  : coverpoint binary[24:20];
     cp_nfmewmopvmwidth    : coverpoint {binary[31:25],binary[14:12]}{
			 option.auto_bin_max = 1024;
			 wildcard ignore_bins func3001 = {10'b???????001};
			 wildcard ignore_bins func3010 = {10'b???????010};
			 wildcard ignore_bins func3100 = {10'b???????100};
		 }
	endgroup

	covergroup store_cg with function sample(bit [31:0] binary);
     cp_vdvs3        : coverpoint binary[11:7];
     cp_vs1          : coverpoint binary[19:15];
     cp_sumoprs2vs2  : coverpoint binary[24:20];
     cp_nfmewmopvmwidth    : coverpoint {binary[31:25],binary[14:12]}{
			 option.auto_bin_max = 1024;
			 wildcard ignore_bins func3001 = {10'b???????001};
			 wildcard ignore_bins func3010 = {10'b???????010};
			 wildcard ignore_bins func3100 = {10'b???????100};
		 }
	endgroup

	function new(riscv_instr_gen_config cfg);
		super.new(cfg);
    `CG_SELECTOR_BEGIN(RVV)
    //vsetvli_cg = new();
    //vsetvl_cg = new();
    //vsetivli_cg = new();
    vadd_cg = new();
    vsub_cg = new();
    vrsub_cg = new();
    vwaddu_cg = new();
    vwsubu_cg = new();
    vwadd_cg = new();
    vwsub_cg = new();
    vzext_cg = new();
    vsext_cg = new();
    vadc_cg = new();
    vmadc_cg = new();
    vsbc_cg = new();
    vmsbc_cg = new();
    vand_cg = new();
    vor_cg = new();
    vxor_cg = new();
    vsll_cg = new();
    vsrl_cg = new();
    vsra_cg = new();
    vnsrl_cg = new();
    vnsra_cg = new();
    vmseq_cg = new();
    vmsne_cg = new();
    vmsltu_cg = new();
    vmslt_cg = new();
    vmsleu_cg = new();
    vmsle_cg = new();
    vmsgtu_cg = new();
    vmsgt_cg = new();
    vminu_cg = new();
    vmin_cg = new();
    vmaxu_cg = new();
    vmax_cg = new();
    vmul_cg = new();
    vmulh_cg = new();
    vmulhu_cg = new();
    vmulhsu_cg = new();
    vdivu_cg = new();
    vdiv_cg = new();
    vremu_cg = new();
    vrem_cg = new();
    vwmul_cg = new();
    vwmulu_cg = new();
    vwmulsu_cg = new();
    vmacc_cg = new();
    vnmsac_cg = new();
    vmadd_cg = new();
    vnmsub_cg = new();
    vwmaccu_cg = new();
    vwmacc_cg = new();
    vwmaccsu_cg = new();
    vwmaccus_cg = new();
    vmerge_cg = new();
    vmv_cg = new();
    vsaddu_cg = new();
    vsadd_cg = new();
    vssubu_cg = new();
    vssub_cg = new();
    vaaddu_cg = new();
    vaadd_cg = new();
    vasubu_cg = new();
    vasub_cg = new();
    vsmul_cg = new();
    vssrl_cg = new();
    vssra_cg = new();
    vnclipu_cg = new();
    vnclip_cg = new();
    vfadd_cg = new();
    vfsub_cg = new();
    vfrsub_cg = new();
    vfwadd_cg = new();
    vfwsub_cg = new();
    vfmul_cg = new();
    vfdiv_cg = new();
    vfrdiv_cg = new();
    vfwmul_cg = new();
    vfmacc_cg = new();
    vfnmacc_cg = new();
    vfmsac_cg = new();
    vfnmsac_cg = new();
    vfmadd_cg = new();
    vfnmadd_cg = new();
    vfmsub_cg = new();
    vfnmsub_cg = new();
    vfwmacc_cg = new();
    vfwnmacc_cg = new();
    vfwmsac_cg = new();
    vfwnmsac_cg = new();
    vfsqrt_v_cg = new();
    vfrsqrt7_v_cg = new();
    vfrec7_v_cg = new();
    vfmin_cg = new();
    vfmax_cg = new();
    vfsgnj_cg = new();
    vfsgnjn_cg = new();
    vfsgnjx_cg = new();
    vmfeq_cg = new();
    vmfne_cg = new();
    vmflt_cg = new();
    vmfle_cg = new();
    vmfgt_cg = new();
    vmfge_cg = new();
    vfclass_v_cg = new();
    vfmerge_cg = new();
    vfmv_cg = new();
    vfcvt_xu_f_v_cg = new();
    vfcvt_x_f_v_cg = new();
    vfcvt_rtz_xu_f_v_cg = new();
    vfcvt_rtz_x_f_v_cg = new();
    vfcvt_f_xu_v_cg = new();
    vfcvt_f_x_v_cg = new();
    vfwcvt_xu_f_v_cg = new();
    vfwcvt_x_f_v_cg = new();
    vfwcvt_rtz_xu_f_v_cg = new();
    vfwcvt_rtz_x_f_v_cg = new();
    vfwcvt_f_xu_v_cg = new();
    vfwcvt_f_x_v_cg = new();
    vfwcvt_f_f_v_cg = new();
    vfncvt_xu_f_w_cg = new();
    vfncvt_x_f_w_cg = new();
    vfncvt_f_xu_w_cg = new();
    vfncvt_f_x_w_cg = new();
    vfncvt_f_f_w_cg = new();
    vfncvt_rod_f_f_w_cg = new();
    vredsum_vs_cg = new();
    vredmaxu_vs_cg = new();
    vredmax_vs_cg = new();
    vredminu_vs_cg = new();
    vredmin_vs_cg = new();
    vredand_vs_cg = new();
    vredor_vs_cg = new();
    vredxor_vs_cg = new();
    vwredsumu_vs_cg = new();
    vwredsum_vs_cg = new();
    vfredosum_vs_cg = new();
    vfredusum_vs_cg = new();
    vfredmax_vs_cg = new();
    vfredmin_vs_cg = new();
    vfwredosum_vs_cg = new();
    vfwredusum_vs_cg = new();
    vmand_mm_cg = new();
    vmnand_mm_cg = new();
    vmandn_mm_cg = new();
    vmxor_mm_cg = new();
    vmor_mm_cg = new();
    vmnor_mm_cg = new();
    vmorn_mm_cg = new();
    vmxnor_mm_cg = new();
    vpopc_m_cg = new();
    vfirst_m_cg = new();
    vmsbf_m_cg = new();
    vmsif_m_cg = new();
    vmsof_m_cg = new();
    viota_m_cg = new();
    vid_v_cg = new();
    vmv_x_s_cg = new();
    vmv_s_x_cg = new();
    vfmv_f_s_cg = new();
    vfmv_s_f_cg = new();
    vslideup_cg = new();
    vslidedown_cg = new();
    vslide1up_cg = new();
    vfslide1up_cg = new();
    vslide1down_cg = new();
    vfslide1down_cg = new();
    vrgather_cg = new();
    vrgatherei16_cg = new();
    vcompress_cg = new();
    vmv1r_v_cg = new();
    vmv2r_v_cg = new();
    vmv4r_v_cg = new();
    vmv8r_v_cg = new();
    vle_v_cg = new();
    vse_v_cg = new();
    vlm_v_cg = new();
    vsm_v_cg = new();
    vlse_v_cg = new();
    vsse_v_cg = new();
    vluxei_v_cg = new();
    vloxei_v_cg = new();
    vsuxei_v_cg = new();
    vsoxei_v_cg = new();
    vleff_v_cg = new();
    vlsege_v_cg = new();
    vssege_v_cg = new();
    vlsegeff_v_cg = new();
    vlssege_v_cg = new();
    vsssege_v_cg = new();
    vluxsegei_v_cg = new();
    vloxsegei_v_cg = new();
    vsuxsegei_v_cg = new();
    vsoxsegei_v_cg = new();
    vlre_v_cg = new();
    vsr_v_cg = new();
    `CG_SELECTOR_END

		//allreg_cg = new();
		//reg_permutation_cg = new();
		arithmetic_cg = new();
		load_cg = new();
		store_cg = new();
    vsetvli_cg = new();
    vsetvl_cg = new();
    vsetivli_cg = new();
    `uvm_info(",","riscv_instr_vector_cover_group", UVM_LOW)
	endfunction
	
	
	function void sample(riscv_instr instr);
    case(instr.instr_name)
    //VSETVLI : `SAMPLE_VSET(vsetvli_cg, instr)
    //VSETVL : `SAMPLE_VSET(vsetvl_cg, instr)
    //VSETIVLI : `SAMPLE_VSET(vsetivli_cg, instr)
    VADD : `SAMPLE_V(vadd_cg, instr)
    VSUB : `SAMPLE_V(vsub_cg, instr)
    VRSUB : `SAMPLE_V(vrsub_cg, instr)
    VWADDU : `SAMPLE_V(vwaddu_cg, instr)
    VWSUBU : `SAMPLE_V(vwsubu_cg, instr)
    VWADD : `SAMPLE_V(vwadd_cg, instr)
    VWSUB : `SAMPLE_V(vwsub_cg, instr)
    VZEXT : `SAMPLE_V(vzext_cg, instr)
    VSEXT : `SAMPLE_V(vsext_cg, instr)
    VADC : `SAMPLE_V(vadc_cg, instr)
    VMADC : `SAMPLE_V(vmadc_cg, instr)
    VSBC : `SAMPLE_V(vsbc_cg, instr)
    VMSBC : `SAMPLE_V(vmsbc_cg, instr)
    VAND : `SAMPLE_V(vand_cg, instr)
    VOR : `SAMPLE_V(vor_cg, instr)
    VXOR : `SAMPLE_V(vxor_cg, instr)
    VSLL : `SAMPLE_V(vsll_cg, instr)
    VSRL : `SAMPLE_V(vsrl_cg, instr)
    VSRA : `SAMPLE_V(vsra_cg, instr)
    VNSRL : `SAMPLE_V(vnsrl_cg, instr)
    VNSRA : `SAMPLE_V(vnsra_cg, instr)
    VMSEQ : `SAMPLE_V(vmseq_cg, instr)
    VMSNE : `SAMPLE_V(vmsne_cg, instr)
    VMSLTU : `SAMPLE_V(vmsltu_cg, instr)
    VMSLT : `SAMPLE_V(vmslt_cg, instr)
    VMSLEU : `SAMPLE_V(vmsleu_cg, instr)
    VMSLE : `SAMPLE_V(vmsle_cg, instr)
    VMSGTU : `SAMPLE_V(vmsgtu_cg, instr)
    VMSGT : `SAMPLE_V(vmsgt_cg, instr)
    VMINU : `SAMPLE_V(vminu_cg, instr)
    VMIN : `SAMPLE_V(vmin_cg, instr)
    VMAXU : `SAMPLE_V(vmaxu_cg, instr)
    VMAX : `SAMPLE_V(vmax_cg, instr)
    VMUL : `SAMPLE_V(vmul_cg, instr)
    VMULH : `SAMPLE_V(vmulh_cg, instr)
    VMULHU : `SAMPLE_V(vmulhu_cg, instr)
    VMULHSU : `SAMPLE_V(vmulhsu_cg, instr)
    VDIVU : `SAMPLE_V(vdivu_cg, instr)
    VDIV : `SAMPLE_V(vdiv_cg, instr)
    VREMU : `SAMPLE_V(vremu_cg, instr)
    VREM : `SAMPLE_V(vrem_cg, instr)
    VWMUL : `SAMPLE_V(vwmul_cg, instr)
    VWMULU : `SAMPLE_V(vwmulu_cg, instr)
    VWMULSU : `SAMPLE_V(vwmulsu_cg, instr)
    VMACC : `SAMPLE_V(vmacc_cg, instr)
    VNMSAC : `SAMPLE_V(vnmsac_cg, instr)
    VMADD : `SAMPLE_V(vmadd_cg, instr)
    VNMSUB : `SAMPLE_V(vnmsub_cg, instr)
    VWMACCU : `SAMPLE_V(vwmaccu_cg, instr)
    VWMACC : `SAMPLE_V(vwmacc_cg, instr)
    VWMACCSU : `SAMPLE_V(vwmaccsu_cg, instr)
    VWMACCUS : `SAMPLE_V(vwmaccus_cg, instr)
    VMERGE : `SAMPLE_V(vmerge_cg, instr)
    VMV : `SAMPLE_V(vmv_cg, instr)
    VSADDU : `SAMPLE_V(vsaddu_cg, instr)
    VSADD : `SAMPLE_V(vsadd_cg, instr)
    VSSUBU : `SAMPLE_V(vssubu_cg, instr)
    VSSUB : `SAMPLE_V(vssub_cg, instr)
    VAADDU : `SAMPLE_V(vaaddu_cg, instr)
    VAADD : `SAMPLE_V(vaadd_cg, instr)
    VASUBU : `SAMPLE_V(vasubu_cg, instr)
    VASUB : `SAMPLE_V(vasub_cg, instr)
    VSMUL : `SAMPLE_V(vsmul_cg, instr)
    VSSRL : `SAMPLE_V(vssrl_cg, instr)
    VSSRA : `SAMPLE_V(vssra_cg, instr)
    VNCLIPU : `SAMPLE_V(vnclipu_cg, instr)
    VNCLIP : `SAMPLE_V(vnclip_cg, instr)
    VFADD : `SAMPLE_V(vfadd_cg, instr)
    VFSUB : `SAMPLE_V(vfsub_cg, instr)
    VFRSUB : `SAMPLE_V(vfrsub_cg, instr)
    VFWADD : `SAMPLE_V(vfwadd_cg, instr)
    VFWSUB : `SAMPLE_V(vfwsub_cg, instr)
    VFMUL : `SAMPLE_V(vfmul_cg, instr)
    VFDIV : `SAMPLE_V(vfdiv_cg, instr)
    VFRDIV : `SAMPLE_V(vfrdiv_cg, instr)
    VFWMUL : `SAMPLE_V(vfwmul_cg, instr)
    VFMACC : `SAMPLE_V(vfmacc_cg, instr)
    VFNMACC : `SAMPLE_V(vfnmacc_cg, instr)
    VFMSAC : `SAMPLE_V(vfmsac_cg, instr)
    VFNMSAC : `SAMPLE_V(vfnmsac_cg, instr)
    VFMADD : `SAMPLE_V(vfmadd_cg, instr)
    VFNMADD : `SAMPLE_V(vfnmadd_cg, instr)
    VFMSUB : `SAMPLE_V(vfmsub_cg, instr)
    VFNMSUB : `SAMPLE_V(vfnmsub_cg, instr)
    VFWMACC : `SAMPLE_V(vfwmacc_cg, instr)
    VFWNMACC : `SAMPLE_V(vfwnmacc_cg, instr)
    VFWMSAC : `SAMPLE_V(vfwmsac_cg, instr)
    VFWNMSAC : `SAMPLE_V(vfwnmsac_cg, instr)
    VFSQRT_V : `SAMPLE_V(vfsqrt_v_cg, instr)
    VFRSQRT7_V : `SAMPLE_V(vfrsqrt7_v_cg, instr)
    VFREC7_V : `SAMPLE_V(vfrec7_v_cg, instr)
    VFMIN : `SAMPLE_V(vfmin_cg, instr)
    VFMAX : `SAMPLE_V(vfmax_cg, instr)
    VFSGNJ : `SAMPLE_V(vfsgnj_cg, instr)
    VFSGNJN : `SAMPLE_V(vfsgnjn_cg, instr)
    VFSGNJX : `SAMPLE_V(vfsgnjx_cg, instr)
    VMFEQ : `SAMPLE_V(vmfeq_cg, instr)
    VMFNE : `SAMPLE_V(vmfne_cg, instr)
    VMFLT : `SAMPLE_V(vmflt_cg, instr)
    VMFLE : `SAMPLE_V(vmfle_cg, instr)
    VMFGT : `SAMPLE_V(vmfgt_cg, instr)
    VMFGE : `SAMPLE_V(vmfge_cg, instr)
    VFCLASS_V : `SAMPLE_V(vfclass_v_cg, instr)
    VFMERGE : `SAMPLE_V(vfmerge_cg, instr)
    VFMV : `SAMPLE_V(vfmv_cg, instr)
    VFCVT_XU_F_V : `SAMPLE_V(vfcvt_xu_f_v_cg, instr)
    VFCVT_X_F_V : `SAMPLE_V(vfcvt_x_f_v_cg, instr)
    VFCVT_RTZ_XU_F_V : `SAMPLE_V(vfcvt_rtz_xu_f_v_cg, instr)
    VFCVT_RTZ_X_F_V : `SAMPLE_V(vfcvt_rtz_x_f_v_cg, instr)
    VFCVT_F_XU_V : `SAMPLE_V(vfcvt_f_xu_v_cg, instr)
    VFCVT_F_X_V : `SAMPLE_V(vfcvt_f_x_v_cg, instr)
    VFWCVT_XU_F_V : `SAMPLE_V(vfwcvt_xu_f_v_cg, instr)
    VFWCVT_X_F_V : `SAMPLE_V(vfwcvt_x_f_v_cg, instr)
    VFWCVT_RTZ_XU_F_V : `SAMPLE_V(vfwcvt_rtz_xu_f_v_cg, instr)
    VFWCVT_RTZ_X_F_V : `SAMPLE_V(vfwcvt_rtz_x_f_v_cg, instr)
    VFWCVT_F_XU_V : `SAMPLE_V(vfwcvt_f_xu_v_cg, instr)
    VFWCVT_F_X_V : `SAMPLE_V(vfwcvt_f_x_v_cg, instr)
    VFWCVT_F_F_V : `SAMPLE_V(vfwcvt_f_f_v_cg, instr)
    VFNCVT_XU_F_W : `SAMPLE_V(vfncvt_xu_f_w_cg, instr)
    VFNCVT_X_F_W : `SAMPLE_V(vfncvt_x_f_w_cg, instr)
    VFNCVT_F_XU_W : `SAMPLE_V(vfncvt_f_xu_w_cg, instr)
    VFNCVT_F_X_W : `SAMPLE_V(vfncvt_f_x_w_cg, instr)
    VFNCVT_F_F_W : `SAMPLE_V(vfncvt_f_f_w_cg, instr)
    VFNCVT_ROD_F_F_W : `SAMPLE_V(vfncvt_rod_f_f_w_cg, instr)
    VREDSUM_VS : `SAMPLE_V(vredsum_vs_cg, instr)
    VREDMAXU_VS : `SAMPLE_V(vredmaxu_vs_cg, instr)
    VREDMAX_VS : `SAMPLE_V(vredmax_vs_cg, instr)
    VREDMINU_VS : `SAMPLE_V(vredminu_vs_cg, instr)
    VREDMIN_VS : `SAMPLE_V(vredmin_vs_cg, instr)
    VREDAND_VS : `SAMPLE_V(vredand_vs_cg, instr)
    VREDOR_VS : `SAMPLE_V(vredor_vs_cg, instr)
    VREDXOR_VS : `SAMPLE_V(vredxor_vs_cg, instr)
    VWREDSUMU_VS : `SAMPLE_V(vwredsumu_vs_cg, instr)
    VWREDSUM_VS : `SAMPLE_V(vwredsum_vs_cg, instr)
    VFREDOSUM_VS : `SAMPLE_V(vfredosum_vs_cg, instr)
    VFREDUSUM_VS : `SAMPLE_V(vfredusum_vs_cg, instr)
    VFREDMAX_VS : `SAMPLE_V(vfredmax_vs_cg, instr)
    VFREDMIN_VS : `SAMPLE_V(vfredmin_vs_cg, instr)
    VFWREDOSUM_VS : `SAMPLE_V(vfwredosum_vs_cg, instr)
    VFWREDUSUM_VS : `SAMPLE_V(vfwredusum_vs_cg, instr)
    VMAND_MM : `SAMPLE_V(vmand_mm_cg, instr)
    VMNAND_MM : `SAMPLE_V(vmnand_mm_cg, instr)
    VMANDN_MM : `SAMPLE_V(vmandn_mm_cg, instr)
    VMXOR_MM : `SAMPLE_V(vmxor_mm_cg, instr)
    VMOR_MM : `SAMPLE_V(vmor_mm_cg, instr)
    VMNOR_MM : `SAMPLE_V(vmnor_mm_cg, instr)
    VMORN_MM : `SAMPLE_V(vmorn_mm_cg, instr)
    VMXNOR_MM : `SAMPLE_V(vmxnor_mm_cg, instr)
    VPOPC_M : `SAMPLE_V(vpopc_m_cg, instr)
    VFIRST_M : `SAMPLE_V(vfirst_m_cg, instr)
    VMSBF_M : `SAMPLE_V(vmsbf_m_cg, instr)
    VMSIF_M : `SAMPLE_V(vmsif_m_cg, instr)
    VMSOF_M : `SAMPLE_V(vmsof_m_cg, instr)
    VIOTA_M : `SAMPLE_V(viota_m_cg, instr)
    VID_V : `SAMPLE_V(vid_v_cg, instr)
    VMV_X_S : `SAMPLE_V(vmv_x_s_cg, instr)
    VMV_S_X : `SAMPLE_V(vmv_s_x_cg, instr)
    VFMV_F_S : `SAMPLE_V(vfmv_f_s_cg, instr)
    VFMV_S_F : `SAMPLE_V(vfmv_s_f_cg, instr)
    VSLIDEUP : `SAMPLE_V(vslideup_cg, instr)
    VSLIDEDOWN : `SAMPLE_V(vslidedown_cg, instr)
    VSLIDE1UP : `SAMPLE_V(vslide1up_cg, instr)
    VFSLIDE1UP : `SAMPLE_V(vfslide1up_cg, instr)
    VSLIDE1DOWN : `SAMPLE_V(vslide1down_cg, instr)
    VFSLIDE1DOWN : `SAMPLE_V(vfslide1down_cg, instr)
    VRGATHER : `SAMPLE_V(vrgather_cg, instr)
    VRGATHEREI16 : `SAMPLE_V(vrgatherei16_cg, instr)
    VCOMPRESS : `SAMPLE_V(vcompress_cg, instr)
    VMV1R_V : `SAMPLE_V(vmv1r_v_cg, instr)
    VMV2R_V : `SAMPLE_V(vmv2r_v_cg, instr)
    VMV4R_V : `SAMPLE_V(vmv4r_v_cg, instr)
    VMV8R_V : `SAMPLE_V(vmv8r_v_cg, instr)
    VLE_V : `SAMPLE_V(vle_v_cg, instr)
    VSE_V : `SAMPLE_V(vse_v_cg, instr)
    VLM_V : `SAMPLE_V(vlm_v_cg, instr)
    VSM_V : `SAMPLE_V(vsm_v_cg, instr)
    VLSE_V : `SAMPLE_V(vlse_v_cg, instr)
    VSSE_V : `SAMPLE_V(vsse_v_cg, instr)
    VLUXEI_V : `SAMPLE_V(vluxei_v_cg, instr)
    VLOXEI_V : `SAMPLE_V(vloxei_v_cg, instr)
    VSUXEI_V : `SAMPLE_V(vsuxei_v_cg, instr)
    VSOXEI_V : `SAMPLE_V(vsoxei_v_cg, instr)
    VLEFF_V : `SAMPLE_V(vleff_v_cg, instr)
    VLSEGE_V : `SAMPLE_V(vlsege_v_cg, instr)
    VSSEGE_V : `SAMPLE_V(vssege_v_cg, instr)
    VLSEGEFF_V : `SAMPLE_V(vlsegeff_v_cg, instr)
    VLSSEGE_V : `SAMPLE_V(vlssege_v_cg, instr)
    VSSSEGE_V : `SAMPLE_V(vsssege_v_cg, instr)
    VLUXSEGEI_V : `SAMPLE_V(vluxsegei_v_cg, instr)
    VLOXSEGEI_V : `SAMPLE_V(vloxsegei_v_cg, instr)
    VSUXSEGEI_V : `SAMPLE_V(vsuxsegei_v_cg, instr)
    VSOXSEGEI_V : `SAMPLE_V(vsoxsegei_v_cg, instr)
    VLRE_V : `SAMPLE_V(vlre_v_cg, instr)
    VSR_V : `SAMPLE_V(vsr_v_cg, instr)
		endcase
    `uvm_info(",","riscv_instr_vector_cover_group", UVM_LOW)
	endfunction
	
endclass
