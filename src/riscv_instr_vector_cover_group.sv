////1st
////include vector cover point
//`define SAMPLE_VSET(cg, val) `SAMPLE_W_TYPE(cg, val,riscv_vset_instr) 
//`define SAMPLE_V(cg, val) `SAMPLE_W_TYPE(cg, val,riscv_vector_instr) 
//
////`define SAMPLE_W_TYPE(cg, val, typ = riscv_instr) \
////  if (cg != null) begin \
////    typ t; \
////    `DV_CHECK_FATAL($cast(t, val), $sformatf("Cannot cast %0s to %0s", `"val`", `"typ`"), \
////                    "riscv_instr_cover_group") \
////    cg.sample(t); \
////  end
//`define VSET_INSTR_CG_BEGIN(INSTR_NAME) \
//  `INSTR_CG_BEGIN(INSTR_NAME,riscv_vset_instr) \
//    cp_vtype : coverpoint instr.vtype; \
//
//`define V_INSTR_CG_BEGIN(INSTR_NAME) \
//  `INSTR_CG_BEGIN(INSTR_NAME,riscv_vector_instr) \
//    cp_vs1 : coverpoint instr.vs1; \
//    //cp_vs2 : coverpoint instr.vs2; \
//    //cp_vs3 : coverpoint instr.vs3; \
//    //cp_vd : coverpoint instr.vd; \
//    cp_va_variant : coverpoint instr.va_variant; \
//
//    //cp_vm : coverpoint instr.vm; \
//    //cp_wd : coverpoint instr.wd; \
//
//class riscv_instr_vector_cover_group extends riscv_instr_cover_group;
//	
//  `VSET_INSTR_CG_BEGIN(vsetivli)
//  `CG_END
//
//
//  `VSET_INSTR_CG_BEGIN(vsetvli)
//  `CG_END
//
//  `VSET_INSTR_CG_BEGIN(vsetvl)
//  `CG_END
//  
//	`V_INSTR_CG_BEGIN(vadd)
//	 
//    //cp_va_variant : coverpoint instr.va_variant{
//    // bins va_variant = {VV,VX};
//		//}
//  `CG_END
//
//	function new(riscv_instr_gen_config cfg);
//		super.new(cfg);
//    111`CG_SELECTOR_BEGIN(RVV)
//				vsetivli_cg = new();
//				vsetvli_cg = new();
//				vsetvl_cg = new();
//				vadd_cg = new();
//    `CG_SELECTOR_END
//          `uvm_info(",","riscv_instr_vector_cover_group", UVM_LOW)
//	endfunction
//	
//	function void sample(riscv_instr instr);
//    case (instr.instr_name)
//      VSETIVLI   : `SAMPLE_VSET(vsetivli_cg, instr)
//      VSETVL     : `SAMPLE_VSET(vsetvl_cg, instr)
//      VSETVLI    : `SAMPLE_VSET(vsetvli_cg, instr)
//      VADD       : `SAMPLE_V(vadd_cg, instr)
//      default: begin
//        if (instr.group == RV32I) begin
//          `SAMPLE(rv32i_misc_cg, instr);
//        end
//      end
//    endcase
//          `uvm_info(",","riscv_instr_vector_cover_group", UVM_LOW)
//	endfunction
//
//endclass

//2nd
//include vector cover point

//`define SAMPLE_V(cg, val) `SAMPLE_W_TYPE(cg, val,riscv_vector_instr) 
//`define INSTR_CG_BEGIN(INSTR_NAME, INSTR_CLASS = riscv_instr) \
//  covergroup ``INSTR_NAME``_cg with function sample(INSTR_CLASS instr);
//`define VVV_INSTR_CG_BEGIN(INSTR_NAME) \
//  `INSTR_CG_BEGIN(INSTR_NAME,riscv_vector_instr) \
//		cp_rs1 :coverpoint instr.rs1;\
//  
//
//class riscv_instr_vector_cover_group extends riscv_instr_cover_group;
//	
//  
//  `VVV_INSTR_CG_BEGIN(vadd_vv_vmask)
//  `CG_END
//  `VVV_INSTR_CG_BEGIN(vadd_vv_vlmul)
//  `CG_END
//  `VVV_INSTR_CG_BEGIN(vadd_vv_vl)
//  `CG_END
//		//covergroup vadd_vv_vmask_cg;
//	//	cp_rs1 :coverpoint instr.rs1;
//	//endgroup
//
//  //covergroup vadd_vv_vlmul_cg;
//	//	cp_rs1 :coverpoint instr.rs1;
//	//endgroup
//	//	
//  //covergroup vadd_vv_vl_cg;
//	//	cp_rs1 :coverpoint instr.rs1;
//	//endgroup
//	
//	function new(riscv_instr_gen_config cfg);
//		super.new(cfg);
//				vadd_vv_vmask_cg = new();
//				vadd_vv_vlmul_cg = new();
//				vadd_vv_vl_cg = new();
//	endfunction
//	
//	function void sample(riscv_instr instr);
//      VADD_VV_VMASK   : `SAMPLE_V(vadd_vv_vmask_cg, instr)
//      VADD_VV_VLMUL   : `SAMPLE_V(vadd_vv_vlmul_cg, instr)
//      VADD_VV_VL   : `SAMPLE_V(vadd_vv_vl_cg, instr)
//       `uvm_info(",","riscv_instr_vector_cover_group", UVM_LOW)
//	endfunction
//
//endclass


//3rd
//include vector cover point
`define SAMPLE_V(cg, val) `SAMPLE_W_TYPE(cg, val,riscv_vector_instr) 

`define V_INSTR_CG_BEGIN(INSTR_NAME) \
  `INSTR_CG_BEGIN(INSTR_NAME,riscv_vector_instr) \

class riscv_instr_vector_cover_group extends riscv_instr_cover_group;
  //start bins
`V_INSTR_CG_BEGIN(vadd_lmul0_125_sew8_variantsvv_vm0)
  cp_vs1 :coverpoint instr.vs1;
  cp_vs2 :coverpoint instr.vs2;
  cp_vd : coverpoint instr.vd{
              ignore_bins V0 = {V0};
}
  
`CG_END
`V_INSTR_CG_BEGIN(vadd_lmul0_125_sew8_variantsvv_vm1)
  cp_vs1 :coverpoint instr.vs1;
  cp_vs2 :coverpoint instr.vs2;
  cp_vd : coverpoint instr.vd;
`CG_END
`V_INSTR_CG_BEGIN(vadd_lmul0_125_sew16_variantsvv_vm0)
  cp_vs1 :coverpoint instr.vs1;
  cp_vs2 :coverpoint instr.vs2;
  cp_vd : coverpoint instr.vd{
              ignore_bins V0 = {V0};
}
  
`CG_END
`V_INSTR_CG_BEGIN(vadd_lmul0_125_sew16_variantsvv_vm1)
  cp_vs1 :coverpoint instr.vs1;
  cp_vs2 :coverpoint instr.vs2;
  cp_vd : coverpoint instr.vd;
`CG_END
`V_INSTR_CG_BEGIN(vadd_lmul0_125_sew32_variantsvv_vm0)
  cp_vs1 :coverpoint instr.vs1;
  cp_vs2 :coverpoint instr.vs2;
  cp_vd : coverpoint instr.vd{
              ignore_bins V0 = {V0};
}
  
`CG_END
`V_INSTR_CG_BEGIN(vadd_lmul0_125_sew32_variantsvv_vm1)
  cp_vs1 :coverpoint instr.vs1;
  cp_vs2 :coverpoint instr.vs2;
  cp_vd : coverpoint instr.vd;
`CG_END
`V_INSTR_CG_BEGIN(vadd_lmul0_125_sew64_variantsvv_vm0)
  cp_vs1 :coverpoint instr.vs1;
  cp_vs2 :coverpoint instr.vs2;
  cp_vd : coverpoint instr.vd{
              ignore_bins V0 = {V0};
}
  
`CG_END
`V_INSTR_CG_BEGIN(vadd_lmul0_125_sew64_variantsvv_vm1)
  cp_vs1 :coverpoint instr.vs1;
  cp_vs2 :coverpoint instr.vs2;
  cp_vd : coverpoint instr.vd;
`CG_END
`V_INSTR_CG_BEGIN(vadd_lmul0_25_sew8_variantsvv_vm0)
  cp_vs1 :coverpoint instr.vs1;
  cp_vs2 :coverpoint instr.vs2;
  cp_vd : coverpoint instr.vd{
              ignore_bins V0 = {V0};
}
  
`CG_END
`V_INSTR_CG_BEGIN(vadd_lmul0_25_sew8_variantsvv_vm1)
  cp_vs1 :coverpoint instr.vs1;
  cp_vs2 :coverpoint instr.vs2;
  cp_vd : coverpoint instr.vd;
`CG_END
`V_INSTR_CG_BEGIN(vadd_lmul0_25_sew16_variantsvv_vm0)
  cp_vs1 :coverpoint instr.vs1;
  cp_vs2 :coverpoint instr.vs2;
  cp_vd : coverpoint instr.vd{
              ignore_bins V0 = {V0};
}
  
`CG_END
`V_INSTR_CG_BEGIN(vadd_lmul0_25_sew16_variantsvv_vm1)
  cp_vs1 :coverpoint instr.vs1;
  cp_vs2 :coverpoint instr.vs2;
  cp_vd : coverpoint instr.vd;
`CG_END
`V_INSTR_CG_BEGIN(vadd_lmul0_25_sew32_variantsvv_vm0)
  cp_vs1 :coverpoint instr.vs1;
  cp_vs2 :coverpoint instr.vs2;
  cp_vd : coverpoint instr.vd{
              ignore_bins V0 = {V0};
}
  
`CG_END
`V_INSTR_CG_BEGIN(vadd_lmul0_25_sew32_variantsvv_vm1)
  cp_vs1 :coverpoint instr.vs1;
  cp_vs2 :coverpoint instr.vs2;
  cp_vd : coverpoint instr.vd;
`CG_END
`V_INSTR_CG_BEGIN(vadd_lmul0_25_sew64_variantsvv_vm0)
  cp_vs1 :coverpoint instr.vs1;
  cp_vs2 :coverpoint instr.vs2;
  cp_vd : coverpoint instr.vd{
              ignore_bins V0 = {V0};
}
  
`CG_END
`V_INSTR_CG_BEGIN(vadd_lmul0_25_sew64_variantsvv_vm1)
  cp_vs1 :coverpoint instr.vs1;
  cp_vs2 :coverpoint instr.vs2;
  cp_vd : coverpoint instr.vd;
`CG_END
`V_INSTR_CG_BEGIN(vadd_lmul0_5_sew8_variantsvv_vm0)
  cp_vs1 :coverpoint instr.vs1;
  cp_vs2 :coverpoint instr.vs2;
  cp_vd : coverpoint instr.vd{
              ignore_bins V0 = {V0};
}
  
`CG_END
`V_INSTR_CG_BEGIN(vadd_lmul0_5_sew8_variantsvv_vm1)
  cp_vs1 :coverpoint instr.vs1;
  cp_vs2 :coverpoint instr.vs2;
  cp_vd : coverpoint instr.vd;
`CG_END
`V_INSTR_CG_BEGIN(vadd_lmul0_5_sew16_variantsvv_vm0)
  cp_vs1 :coverpoint instr.vs1;
  cp_vs2 :coverpoint instr.vs2;
  cp_vd : coverpoint instr.vd{
              ignore_bins V0 = {V0};
}
  
`CG_END
`V_INSTR_CG_BEGIN(vadd_lmul0_5_sew16_variantsvv_vm1)
  cp_vs1 :coverpoint instr.vs1;
  cp_vs2 :coverpoint instr.vs2;
  cp_vd : coverpoint instr.vd;
`CG_END
`V_INSTR_CG_BEGIN(vadd_lmul0_5_sew32_variantsvv_vm0)
  cp_vs1 :coverpoint instr.vs1;
  cp_vs2 :coverpoint instr.vs2;
  cp_vd : coverpoint instr.vd{
              ignore_bins V0 = {V0};
}
  
`CG_END
`V_INSTR_CG_BEGIN(vadd_lmul0_5_sew32_variantsvv_vm1)
  cp_vs1 :coverpoint instr.vs1;
  cp_vs2 :coverpoint instr.vs2;
  cp_vd : coverpoint instr.vd;
`CG_END
`V_INSTR_CG_BEGIN(vadd_lmul0_5_sew64_variantsvv_vm0)
  cp_vs1 :coverpoint instr.vs1;
  cp_vs2 :coverpoint instr.vs2;
  cp_vd : coverpoint instr.vd{
              ignore_bins V0 = {V0};
}
  
`CG_END
`V_INSTR_CG_BEGIN(vadd_lmul0_5_sew64_variantsvv_vm1)
  cp_vs1 :coverpoint instr.vs1;
  cp_vs2 :coverpoint instr.vs2;
  cp_vd : coverpoint instr.vd;
`CG_END
`V_INSTR_CG_BEGIN(vadd_lmul1_sew8_variantsvv_vm0)
  cp_vs1 :coverpoint instr.vs1;
  cp_vs2 :coverpoint instr.vs2;
  cp_vd : coverpoint instr.vd{
              ignore_bins V0 = {V0};
}
  
`CG_END
`V_INSTR_CG_BEGIN(vadd_lmul1_sew8_variantsvv_vm1)
  cp_vs1 :coverpoint instr.vs1;
  cp_vs2 :coverpoint instr.vs2;
  cp_vd : coverpoint instr.vd;
`CG_END
`V_INSTR_CG_BEGIN(vadd_lmul1_sew16_variantsvv_vm0)
  cp_vs1 :coverpoint instr.vs1;
  cp_vs2 :coverpoint instr.vs2;
  cp_vd : coverpoint instr.vd{
              ignore_bins V0 = {V0};
}
  
`CG_END
`V_INSTR_CG_BEGIN(vadd_lmul1_sew16_variantsvv_vm1)
  cp_vs1 :coverpoint instr.vs1;
  cp_vs2 :coverpoint instr.vs2;
  cp_vd : coverpoint instr.vd;
`CG_END
`V_INSTR_CG_BEGIN(vadd_lmul1_sew32_variantsvv_vm0)
  cp_vs1 :coverpoint instr.vs1;
  cp_vs2 :coverpoint instr.vs2;
  cp_vd : coverpoint instr.vd{
              ignore_bins V0 = {V0};
}
  
`CG_END
`V_INSTR_CG_BEGIN(vadd_lmul1_sew32_variantsvv_vm1)
  cp_vs1 :coverpoint instr.vs1;
  cp_vs2 :coverpoint instr.vs2;
  cp_vd : coverpoint instr.vd;
`CG_END
`V_INSTR_CG_BEGIN(vadd_lmul1_sew64_variantsvv_vm0)
  cp_vs1 :coverpoint instr.vs1;
  cp_vs2 :coverpoint instr.vs2;
  cp_vd : coverpoint instr.vd{
              ignore_bins V0 = {V0};
}
  
`CG_END
`V_INSTR_CG_BEGIN(vadd_lmul1_sew64_variantsvv_vm1)
  cp_vs1 :coverpoint instr.vs1;
  cp_vs2 :coverpoint instr.vs2;
  cp_vd : coverpoint instr.vd;
`CG_END
`V_INSTR_CG_BEGIN(vadd_lmul2_sew8_variantsvv_vm0)
  cp_vs1 :coverpoint instr.vs1{
              ignore_bins vs1_lmul2 = {V1,V3,V5,V7,V9,V11,V13,V15,V17,V19,V21,V23,V25,V27,V29,V31};
}
  cp_vs2 :coverpoint instr.vs2{
             ignore_bins vs2_lmul2 = {V1,V3,V5,V7,V9,V11,V13,V15,V17,V19,V21,V23,V25,V27,V29,V31};
}
  cp_vd : coverpoint instr.vd{
              ignore_bins vd_lmul2 = {V0,V1,V3,V5,V7,V9,V11,V13,V15,V17,V19,V21,V23,V25,V27,V29,V31};
}
 
`CG_END
`V_INSTR_CG_BEGIN(vadd_lmul2_sew8_variantsvv_vm1)
  cp_vs1 :coverpoint instr.vs1{
              ignore_bins vs1_lmul2 = {V1,V3,V5,V7,V9,V11,V13,V15,V17,V19,V21,V23,V25,V27,V29,V31};
}
  cp_vs2 :coverpoint instr.vs2{
             ignore_bins vs2_lmul2 = {V1,V3,V5,V7,V9,V11,V13,V15,V17,V19,V21,V23,V25,V27,V29,V31};
}
  cp_vd : coverpoint instr.vd{
              ignore_bins vd_lmul2 = {V1,V3,V5,V7,V9,V11,V13,V15,V17,V19,V21,V23,V25,V27,V29,V31};
}
`CG_END
`V_INSTR_CG_BEGIN(vadd_lmul2_sew16_variantsvv_vm0)
  cp_vs1 :coverpoint instr.vs1{
              ignore_bins vs1_lmul2 = {V1,V3,V5,V7,V9,V11,V13,V15,V17,V19,V21,V23,V25,V27,V29,V31};
}
  cp_vs2 :coverpoint instr.vs2{
             ignore_bins vs2_lmul2 = {V1,V3,V5,V7,V9,V11,V13,V15,V17,V19,V21,V23,V25,V27,V29,V31};
}
  cp_vd : coverpoint instr.vd{
              ignore_bins vd_lmul2 = {V0,V1,V3,V5,V7,V9,V11,V13,V15,V17,V19,V21,V23,V25,V27,V29,V31};
}
 
`CG_END
`V_INSTR_CG_BEGIN(vadd_lmul2_sew16_variantsvv_vm1)
  cp_vs1 :coverpoint instr.vs1{
              ignore_bins vs1_lmul2 = {V1,V3,V5,V7,V9,V11,V13,V15,V17,V19,V21,V23,V25,V27,V29,V31};
}
  cp_vs2 :coverpoint instr.vs2{
             ignore_bins vs2_lmul2 = {V1,V3,V5,V7,V9,V11,V13,V15,V17,V19,V21,V23,V25,V27,V29,V31};
}
  cp_vd : coverpoint instr.vd{
              ignore_bins vd_lmul2 = {V1,V3,V5,V7,V9,V11,V13,V15,V17,V19,V21,V23,V25,V27,V29,V31};
}
`CG_END
`V_INSTR_CG_BEGIN(vadd_lmul2_sew32_variantsvv_vm0)
  cp_vs1 :coverpoint instr.vs1{
              ignore_bins vs1_lmul2 = {V1,V3,V5,V7,V9,V11,V13,V15,V17,V19,V21,V23,V25,V27,V29,V31};
}
  cp_vs2 :coverpoint instr.vs2{
             ignore_bins vs2_lmul2 = {V1,V3,V5,V7,V9,V11,V13,V15,V17,V19,V21,V23,V25,V27,V29,V31};
}
  cp_vd : coverpoint instr.vd{
              ignore_bins vd_lmul2 = {V0,V1,V3,V5,V7,V9,V11,V13,V15,V17,V19,V21,V23,V25,V27,V29,V31};
}
 
`CG_END
`V_INSTR_CG_BEGIN(vadd_lmul2_sew32_variantsvv_vm1)
  cp_vs1 :coverpoint instr.vs1{
              ignore_bins vs1_lmul2 = {V1,V3,V5,V7,V9,V11,V13,V15,V17,V19,V21,V23,V25,V27,V29,V31};
}
  cp_vs2 :coverpoint instr.vs2{
             ignore_bins vs2_lmul2 = {V1,V3,V5,V7,V9,V11,V13,V15,V17,V19,V21,V23,V25,V27,V29,V31};
}
  cp_vd : coverpoint instr.vd{
              ignore_bins vd_lmul2 = {V1,V3,V5,V7,V9,V11,V13,V15,V17,V19,V21,V23,V25,V27,V29,V31};
}
`CG_END
`V_INSTR_CG_BEGIN(vadd_lmul2_sew64_variantsvv_vm0)
  cp_vs1 :coverpoint instr.vs1{
              ignore_bins vs1_lmul2 = {V1,V3,V5,V7,V9,V11,V13,V15,V17,V19,V21,V23,V25,V27,V29,V31};
}
  cp_vs2 :coverpoint instr.vs2{
             ignore_bins vs2_lmul2 = {V1,V3,V5,V7,V9,V11,V13,V15,V17,V19,V21,V23,V25,V27,V29,V31};
}
  cp_vd : coverpoint instr.vd{
              ignore_bins vd_lmul2 = {V0,V1,V3,V5,V7,V9,V11,V13,V15,V17,V19,V21,V23,V25,V27,V29,V31};
}
 
`CG_END
`V_INSTR_CG_BEGIN(vadd_lmul2_sew64_variantsvv_vm1)
  cp_vs1 :coverpoint instr.vs1{
              ignore_bins vs1_lmul2 = {V1,V3,V5,V7,V9,V11,V13,V15,V17,V19,V21,V23,V25,V27,V29,V31};
}
  cp_vs2 :coverpoint instr.vs2{
             ignore_bins vs2_lmul2 = {V1,V3,V5,V7,V9,V11,V13,V15,V17,V19,V21,V23,V25,V27,V29,V31};
}
  cp_vd : coverpoint instr.vd{
              ignore_bins vd_lmul2 = {V1,V3,V5,V7,V9,V11,V13,V15,V17,V19,V21,V23,V25,V27,V29,V31};
}
`CG_END
`V_INSTR_CG_BEGIN(vadd_lmul4_sew8_variantsvv_vm0)
  cp_vs1 :coverpoint instr.vs1{
              bins v0 = {V0};
              bins v4 = {V4};
              bins v8 = {V8};
              bins v12 = {V12};
              bins v16 = {V16};
              bins v20 = {V20};
              bins v24 = {V24};
              bins v28 = {V28};
              }
  cp_vs2 :coverpoint instr.vs2{ 
              bins v0 = {V0};
              bins v4 = {V4};
              bins v8 = {V8};
              bins v12 = {V12};
              bins v16 = {V16};
              bins v20 = {V20};
              bins v24 = {V24};
              bins v28 = {V28};
              }
  cp_vd : coverpoint instr.vd{
              bins v4 = {V4};
              bins v8 = {V8};
              bins v12 = {V12};
              bins v16 = {V16};
              bins v20 = {V20};
              bins v24 = {V24};
              bins v28 = {V28};
              }
 
`CG_END
`V_INSTR_CG_BEGIN(vadd_lmul4_sew8_variantsvv_vm1)
  cp_vs1 :coverpoint instr.vs1{
              bins v0 = {V0};
              bins v4 = {V4};
              bins v8 = {V8};
              bins v12 = {V12};
              bins v16 = {V16};
              bins v20 = {V20};
              bins v24 = {V24};
              bins v28 = {V28};
              }
  cp_vs2 :coverpoint instr.vs2{ 
              bins v0 = {V0};
              bins v4 = {V4};
              bins v8 = {V8};
              bins v12 = {V12};
              bins v16 = {V16};
              bins v20 = {V20};
              bins v24 = {V24};
              bins v28 = {V28};
              }
  cp_vd : coverpoint instr.vd{
              bins v0 = {V0};
              bins v4 = {V4};
              bins v8 = {V8};
              bins v12 = {V12};
              bins v16 = {V16};
              bins v20 = {V20};
              bins v24 = {V24};
              bins v28 = {V28};
              }
`CG_END
`V_INSTR_CG_BEGIN(vadd_lmul4_sew16_variantsvv_vm0)
  cp_vs1 :coverpoint instr.vs1{
              bins v0 = {V0};
              bins v4 = {V4};
              bins v8 = {V8};
              bins v12 = {V12};
              bins v16 = {V16};
              bins v20 = {V20};
              bins v24 = {V24};
              bins v28 = {V28};
              }
  cp_vs2 :coverpoint instr.vs2{ 
              bins v0 = {V0};
              bins v4 = {V4};
              bins v8 = {V8};
              bins v12 = {V12};
              bins v16 = {V16};
              bins v20 = {V20};
              bins v24 = {V24};
              bins v28 = {V28};
              }
  cp_vd : coverpoint instr.vd{
              bins v4 = {V4};
              bins v8 = {V8};
              bins v12 = {V12};
              bins v16 = {V16};
              bins v20 = {V20};
              bins v24 = {V24};
              bins v28 = {V28};
              }
 
`CG_END
`V_INSTR_CG_BEGIN(vadd_lmul4_sew16_variantsvv_vm1)
  cp_vs1 :coverpoint instr.vs1{
              bins v0 = {V0};
              bins v4 = {V4};
              bins v8 = {V8};
              bins v12 = {V12};
              bins v16 = {V16};
              bins v20 = {V20};
              bins v24 = {V24};
              bins v28 = {V28};
              }
  cp_vs2 :coverpoint instr.vs2{ 
              bins v0 = {V0};
              bins v4 = {V4};
              bins v8 = {V8};
              bins v12 = {V12};
              bins v16 = {V16};
              bins v20 = {V20};
              bins v24 = {V24};
              bins v28 = {V28};
              }
  cp_vd : coverpoint instr.vd{
              bins v0 = {V0};
              bins v4 = {V4};
              bins v8 = {V8};
              bins v12 = {V12};
              bins v16 = {V16};
              bins v20 = {V20};
              bins v24 = {V24};
              bins v28 = {V28};
              }
`CG_END
`V_INSTR_CG_BEGIN(vadd_lmul4_sew32_variantsvv_vm0)
  cp_vs1 :coverpoint instr.vs1{
              bins v0 = {V0};
              bins v4 = {V4};
              bins v8 = {V8};
              bins v12 = {V12};
              bins v16 = {V16};
              bins v20 = {V20};
              bins v24 = {V24};
              bins v28 = {V28};
              }
  cp_vs2 :coverpoint instr.vs2{ 
              bins v0 = {V0};
              bins v4 = {V4};
              bins v8 = {V8};
              bins v12 = {V12};
              bins v16 = {V16};
              bins v20 = {V20};
              bins v24 = {V24};
              bins v28 = {V28};
              }
  cp_vd : coverpoint instr.vd{
              bins v4 = {V4};
              bins v8 = {V8};
              bins v12 = {V12};
              bins v16 = {V16};
              bins v20 = {V20};
              bins v24 = {V24};
              bins v28 = {V28};
              }
 
`CG_END
`V_INSTR_CG_BEGIN(vadd_lmul4_sew32_variantsvv_vm1)
  cp_vs1 :coverpoint instr.vs1{
              bins v0 = {V0};
              bins v4 = {V4};
              bins v8 = {V8};
              bins v12 = {V12};
              bins v16 = {V16};
              bins v20 = {V20};
              bins v24 = {V24};
              bins v28 = {V28};
              }
  cp_vs2 :coverpoint instr.vs2{ 
              bins v0 = {V0};
              bins v4 = {V4};
              bins v8 = {V8};
              bins v12 = {V12};
              bins v16 = {V16};
              bins v20 = {V20};
              bins v24 = {V24};
              bins v28 = {V28};
              }
  cp_vd : coverpoint instr.vd{
              bins v0 = {V0};
              bins v4 = {V4};
              bins v8 = {V8};
              bins v12 = {V12};
              bins v16 = {V16};
              bins v20 = {V20};
              bins v24 = {V24};
              bins v28 = {V28};
              }
`CG_END
`V_INSTR_CG_BEGIN(vadd_lmul4_sew64_variantsvv_vm0)
  cp_vs1 :coverpoint instr.vs1{
              bins v0 = {V0};
              bins v4 = {V4};
              bins v8 = {V8};
              bins v12 = {V12};
              bins v16 = {V16};
              bins v20 = {V20};
              bins v24 = {V24};
              bins v28 = {V28};
              }
  cp_vs2 :coverpoint instr.vs2{ 
              bins v0 = {V0};
              bins v4 = {V4};
              bins v8 = {V8};
              bins v12 = {V12};
              bins v16 = {V16};
              bins v20 = {V20};
              bins v24 = {V24};
              bins v28 = {V28};
              }
  cp_vd : coverpoint instr.vd{
              bins v4 = {V4};
              bins v8 = {V8};
              bins v12 = {V12};
              bins v16 = {V16};
              bins v20 = {V20};
              bins v24 = {V24};
              bins v28 = {V28};
              }
 
`CG_END
`V_INSTR_CG_BEGIN(vadd_lmul4_sew64_variantsvv_vm1)
  cp_vs1 :coverpoint instr.vs1{
              bins v0 = {V0};
              bins v4 = {V4};
              bins v8 = {V8};
              bins v12 = {V12};
              bins v16 = {V16};
              bins v20 = {V20};
              bins v24 = {V24};
              bins v28 = {V28};
              }
  cp_vs2 :coverpoint instr.vs2{ 
              bins v0 = {V0};
              bins v4 = {V4};
              bins v8 = {V8};
              bins v12 = {V12};
              bins v16 = {V16};
              bins v20 = {V20};
              bins v24 = {V24};
              bins v28 = {V28};
              }
  cp_vd : coverpoint instr.vd{
              bins v0 = {V0};
              bins v4 = {V4};
              bins v8 = {V8};
              bins v12 = {V12};
              bins v16 = {V16};
              bins v20 = {V20};
              bins v24 = {V24};
              bins v28 = {V28};
              }
`CG_END
`V_INSTR_CG_BEGIN(vadd_lmul8_sew8_variantsvv_vm0)
  cp_vs1 :coverpoint instr.vs1{
              bins v0 = {V0};
              bins v8 = {V8};
              bins v16 = {V16};
              bins v24 = {V24};
              }
  cp_vs2 :coverpoint instr.vs2{ 
              bins v0 = {V0};
              bins v8 = {V8};
              bins v16 = {V16};
              bins v24 = {V24};
              }
  cp_vd : coverpoint instr.vd{
              bins v8 = {V8};
              bins v16 = {V16};
              bins v24 = {V24};
              }
  
`CG_END
`V_INSTR_CG_BEGIN(vadd_lmul8_sew8_variantsvv_vm1)
  cp_vs1 :coverpoint instr.vs1{
              bins v0 = {V0};
              bins v8 = {V8};
              bins v16 = {V16};
              bins v24 = {V24};
              }
  cp_vs2 :coverpoint instr.vs2{ 
              bins v0 = {V0};
              bins v8 = {V8};
              bins v16 = {V16};
              bins v24 = {V24};
              }
  cp_vd : coverpoint instr.vd{
              bins v0 = {V0};
              bins v8 = {V8};
              bins v16 = {V16};
              bins v24 = {V24};
              }
`CG_END
`V_INSTR_CG_BEGIN(vadd_lmul8_sew16_variantsvv_vm0)
  cp_vs1 :coverpoint instr.vs1{
              bins v0 = {V0};
              bins v8 = {V8};
              bins v16 = {V16};
              bins v24 = {V24};
              }
  cp_vs2 :coverpoint instr.vs2{ 
              bins v0 = {V0};
              bins v8 = {V8};
              bins v16 = {V16};
              bins v24 = {V24};
              }
  cp_vd : coverpoint instr.vd{
              bins v8 = {V8};
              bins v16 = {V16};
              bins v24 = {V24};
              }
  
`CG_END
`V_INSTR_CG_BEGIN(vadd_lmul8_sew16_variantsvv_vm1)
  cp_vs1 :coverpoint instr.vs1{
              bins v0 = {V0};
              bins v8 = {V8};
              bins v16 = {V16};
              bins v24 = {V24};
              }
  cp_vs2 :coverpoint instr.vs2{ 
              bins v0 = {V0};
              bins v8 = {V8};
              bins v16 = {V16};
              bins v24 = {V24};
              }
  cp_vd : coverpoint instr.vd{
              bins v0 = {V0};
              bins v8 = {V8};
              bins v16 = {V16};
              bins v24 = {V24};
              }
`CG_END
`V_INSTR_CG_BEGIN(vadd_lmul8_sew32_variantsvv_vm0)
  cp_vs1 :coverpoint instr.vs1{
              bins v0 = {V0};
              bins v8 = {V8};
              bins v16 = {V16};
              bins v24 = {V24};
              }
  cp_vs2 :coverpoint instr.vs2{ 
              bins v0 = {V0};
              bins v8 = {V8};
              bins v16 = {V16};
              bins v24 = {V24};
              }
  cp_vd : coverpoint instr.vd{
              bins v8 = {V8};
              bins v16 = {V16};
              bins v24 = {V24};
              }
  
`CG_END
`V_INSTR_CG_BEGIN(vadd_lmul8_sew32_variantsvv_vm1)
  cp_vs1 :coverpoint instr.vs1{
              bins v0 = {V0};
              bins v8 = {V8};
              bins v16 = {V16};
              bins v24 = {V24};
              }
  cp_vs2 :coverpoint instr.vs2{ 
              bins v0 = {V0};
              bins v8 = {V8};
              bins v16 = {V16};
              bins v24 = {V24};
              }
  cp_vd : coverpoint instr.vd{
              bins v0 = {V0};
              bins v8 = {V8};
              bins v16 = {V16};
              bins v24 = {V24};
              }
`CG_END
`V_INSTR_CG_BEGIN(vadd_lmul8_sew64_variantsvv_vm0)
  cp_vs1 :coverpoint instr.vs1{
              bins v0 = {V0};
              bins v8 = {V8};
              bins v16 = {V16};
              bins v24 = {V24};
              }
  cp_vs2 :coverpoint instr.vs2{ 
              bins v0 = {V0};
              bins v8 = {V8};
              bins v16 = {V16};
              bins v24 = {V24};
              }
  cp_vd : coverpoint instr.vd{
              bins v8 = {V8};
              bins v16 = {V16};
              bins v24 = {V24};
              }
  
`CG_END
`V_INSTR_CG_BEGIN(vadd_lmul8_sew64_variantsvv_vm1)
  cp_vs1 :coverpoint instr.vs1{
              bins v0 = {V0};
              bins v8 = {V8};
              bins v16 = {V16};
              bins v24 = {V24};
              }
  cp_vs2 :coverpoint instr.vs2{ 
              bins v0 = {V0};
              bins v8 = {V8};
              bins v16 = {V16};
              bins v24 = {V24};
              }
  cp_vd : coverpoint instr.vd{
              bins v0 = {V0};
              bins v8 = {V8};
              bins v16 = {V16};
              bins v24 = {V24};
              }
`CG_END
	function new(riscv_instr_gen_config cfg);
		super.new(cfg);
    `CG_SELECTOR_BEGIN(RVV)
      vadd_lmul0_125_sew8_variantsvv_vm0_cg = new();
      vadd_lmul0_125_sew8_variantsvv_vm1_cg = new();
      vadd_lmul0_125_sew16_variantsvv_vm0_cg = new();
      vadd_lmul0_125_sew16_variantsvv_vm1_cg = new();
      vadd_lmul0_125_sew32_variantsvv_vm0_cg = new();
      vadd_lmul0_125_sew32_variantsvv_vm1_cg = new();
      vadd_lmul0_125_sew64_variantsvv_vm0_cg = new();
      vadd_lmul0_125_sew64_variantsvv_vm1_cg = new();
      vadd_lmul0_25_sew8_variantsvv_vm0_cg = new();
      vadd_lmul0_25_sew8_variantsvv_vm1_cg = new();
      vadd_lmul0_25_sew16_variantsvv_vm0_cg = new();
      vadd_lmul0_25_sew16_variantsvv_vm1_cg = new();
      vadd_lmul0_25_sew32_variantsvv_vm0_cg = new();
      vadd_lmul0_25_sew32_variantsvv_vm1_cg = new();
      vadd_lmul0_25_sew64_variantsvv_vm0_cg = new();
      vadd_lmul0_25_sew64_variantsvv_vm1_cg = new();
      vadd_lmul0_5_sew8_variantsvv_vm0_cg = new();
      vadd_lmul0_5_sew8_variantsvv_vm1_cg = new();
      vadd_lmul0_5_sew16_variantsvv_vm0_cg = new();
      vadd_lmul0_5_sew16_variantsvv_vm1_cg = new();
      vadd_lmul0_5_sew32_variantsvv_vm0_cg = new();
      vadd_lmul0_5_sew32_variantsvv_vm1_cg = new();
      vadd_lmul0_5_sew64_variantsvv_vm0_cg = new();
      vadd_lmul0_5_sew64_variantsvv_vm1_cg = new();
      vadd_lmul1_sew8_variantsvv_vm0_cg = new();
      vadd_lmul1_sew8_variantsvv_vm1_cg = new();
      vadd_lmul1_sew16_variantsvv_vm0_cg = new();
      vadd_lmul1_sew16_variantsvv_vm1_cg = new();
      vadd_lmul1_sew32_variantsvv_vm0_cg = new();
      vadd_lmul1_sew32_variantsvv_vm1_cg = new();
      vadd_lmul1_sew64_variantsvv_vm0_cg = new();
      vadd_lmul1_sew64_variantsvv_vm1_cg = new();
      vadd_lmul2_sew8_variantsvv_vm0_cg = new();
      vadd_lmul2_sew8_variantsvv_vm1_cg = new();
      vadd_lmul2_sew16_variantsvv_vm0_cg = new();
      vadd_lmul2_sew16_variantsvv_vm1_cg = new();
      vadd_lmul2_sew32_variantsvv_vm0_cg = new();
      vadd_lmul2_sew32_variantsvv_vm1_cg = new();
      vadd_lmul2_sew64_variantsvv_vm0_cg = new();
      vadd_lmul2_sew64_variantsvv_vm1_cg = new();
      vadd_lmul4_sew8_variantsvv_vm0_cg = new();
      vadd_lmul4_sew8_variantsvv_vm1_cg = new();
      vadd_lmul4_sew16_variantsvv_vm0_cg = new();
      vadd_lmul4_sew16_variantsvv_vm1_cg = new();
      vadd_lmul4_sew32_variantsvv_vm0_cg = new();
      vadd_lmul4_sew32_variantsvv_vm1_cg = new();
      vadd_lmul4_sew64_variantsvv_vm0_cg = new();
      vadd_lmul4_sew64_variantsvv_vm1_cg = new();
      vadd_lmul8_sew8_variantsvv_vm0_cg = new();
      vadd_lmul8_sew8_variantsvv_vm1_cg = new();
      vadd_lmul8_sew16_variantsvv_vm0_cg = new();
      vadd_lmul8_sew16_variantsvv_vm1_cg = new();
      vadd_lmul8_sew32_variantsvv_vm0_cg = new();
      vadd_lmul8_sew32_variantsvv_vm1_cg = new();
      vadd_lmul8_sew64_variantsvv_vm0_cg = new();
      vadd_lmul8_sew64_variantsvv_vm1_cg = new();
    `CG_SELECTOR_END
    `uvm_info(",","riscv_instr_vector_cover_group", UVM_LOW)
	endfunction
	
	
	function void sample(riscv_instr instr, string instr_name_sample);
    case(instr_name_sample)
      "VADD_LMUL0_125_SEW8_VARIANTSVV_VM0" : `SAMPLE_V(vadd_lmul0_125_sew8_variantsvv_vm0_cg, instr)
      "VADD_LMUL0_125_SEW8_VARIANTSVV_VM1" : `SAMPLE_V(vadd_lmul0_125_sew8_variantsvv_vm1_cg, instr)
      "VADD_LMUL0_125_SEW16_VARIANTSVV_VM0" : `SAMPLE_V(vadd_lmul0_125_sew16_variantsvv_vm0_cg, instr)
      "VADD_LMUL0_125_SEW16_VARIANTSVV_VM1" : `SAMPLE_V(vadd_lmul0_125_sew16_variantsvv_vm1_cg, instr)
      "VADD_LMUL0_125_SEW32_VARIANTSVV_VM0" : `SAMPLE_V(vadd_lmul0_125_sew32_variantsvv_vm0_cg, instr)
      "VADD_LMUL0_125_SEW32_VARIANTSVV_VM1" : `SAMPLE_V(vadd_lmul0_125_sew32_variantsvv_vm1_cg, instr)
      "VADD_LMUL0_125_SEW64_VARIANTSVV_VM0" : `SAMPLE_V(vadd_lmul0_125_sew64_variantsvv_vm0_cg, instr)
      "VADD_LMUL0_125_SEW64_VARIANTSVV_VM1" : `SAMPLE_V(vadd_lmul0_125_sew64_variantsvv_vm1_cg, instr)
      "VADD_LMUL0_25_SEW8_VARIANTSVV_VM0" : `SAMPLE_V(vadd_lmul0_25_sew8_variantsvv_vm0_cg, instr)
      "VADD_LMUL0_25_SEW8_VARIANTSVV_VM1" : `SAMPLE_V(vadd_lmul0_25_sew8_variantsvv_vm1_cg, instr)
      "VADD_LMUL0_25_SEW16_VARIANTSVV_VM0" : `SAMPLE_V(vadd_lmul0_25_sew16_variantsvv_vm0_cg, instr)
      "VADD_LMUL0_25_SEW16_VARIANTSVV_VM1" : `SAMPLE_V(vadd_lmul0_25_sew16_variantsvv_vm1_cg, instr)
      "VADD_LMUL0_25_SEW32_VARIANTSVV_VM0" : `SAMPLE_V(vadd_lmul0_25_sew32_variantsvv_vm0_cg, instr)
      "VADD_LMUL0_25_SEW32_VARIANTSVV_VM1" : `SAMPLE_V(vadd_lmul0_25_sew32_variantsvv_vm1_cg, instr)
      "VADD_LMUL0_25_SEW64_VARIANTSVV_VM0" : `SAMPLE_V(vadd_lmul0_25_sew64_variantsvv_vm0_cg, instr)
      "VADD_LMUL0_25_SEW64_VARIANTSVV_VM1" : `SAMPLE_V(vadd_lmul0_25_sew64_variantsvv_vm1_cg, instr)
      "VADD_LMUL0_5_SEW8_VARIANTSVV_VM0" : `SAMPLE_V(vadd_lmul0_5_sew8_variantsvv_vm0_cg, instr)
      "VADD_LMUL0_5_SEW8_VARIANTSVV_VM1" : `SAMPLE_V(vadd_lmul0_5_sew8_variantsvv_vm1_cg, instr)
      "VADD_LMUL0_5_SEW16_VARIANTSVV_VM0" : `SAMPLE_V(vadd_lmul0_5_sew16_variantsvv_vm0_cg, instr)
      "VADD_LMUL0_5_SEW16_VARIANTSVV_VM1" : `SAMPLE_V(vadd_lmul0_5_sew16_variantsvv_vm1_cg, instr)
      "VADD_LMUL0_5_SEW32_VARIANTSVV_VM0" : `SAMPLE_V(vadd_lmul0_5_sew32_variantsvv_vm0_cg, instr)
      "VADD_LMUL0_5_SEW32_VARIANTSVV_VM1" : `SAMPLE_V(vadd_lmul0_5_sew32_variantsvv_vm1_cg, instr)
      "VADD_LMUL0_5_SEW64_VARIANTSVV_VM0" : `SAMPLE_V(vadd_lmul0_5_sew64_variantsvv_vm0_cg, instr)
      "VADD_LMUL0_5_SEW64_VARIANTSVV_VM1" : `SAMPLE_V(vadd_lmul0_5_sew64_variantsvv_vm1_cg, instr)
      "VADD_LMUL1_SEW8_VARIANTSVV_VM0" : `SAMPLE_V(vadd_lmul1_sew8_variantsvv_vm0_cg, instr)
      "VADD_LMUL1_SEW8_VARIANTSVV_VM1" : `SAMPLE_V(vadd_lmul1_sew8_variantsvv_vm1_cg, instr)
      "VADD_LMUL1_SEW16_VARIANTSVV_VM0" : `SAMPLE_V(vadd_lmul1_sew16_variantsvv_vm0_cg, instr)
      "VADD_LMUL1_SEW16_VARIANTSVV_VM1" : `SAMPLE_V(vadd_lmul1_sew16_variantsvv_vm1_cg, instr)
      "VADD_LMUL1_SEW32_VARIANTSVV_VM0" : `SAMPLE_V(vadd_lmul1_sew32_variantsvv_vm0_cg, instr)
      "VADD_LMUL1_SEW32_VARIANTSVV_VM1" : `SAMPLE_V(vadd_lmul1_sew32_variantsvv_vm1_cg, instr)
      "VADD_LMUL1_SEW64_VARIANTSVV_VM0" : `SAMPLE_V(vadd_lmul1_sew64_variantsvv_vm0_cg, instr)
      "VADD_LMUL1_SEW64_VARIANTSVV_VM1" : `SAMPLE_V(vadd_lmul1_sew64_variantsvv_vm1_cg, instr)
      "VADD_LMUL2_SEW8_VARIANTSVV_VM0" : `SAMPLE_V(vadd_lmul2_sew8_variantsvv_vm0_cg, instr)
      "VADD_LMUL2_SEW8_VARIANTSVV_VM1" : `SAMPLE_V(vadd_lmul2_sew8_variantsvv_vm1_cg, instr)
      "VADD_LMUL2_SEW16_VARIANTSVV_VM0" : `SAMPLE_V(vadd_lmul2_sew16_variantsvv_vm0_cg, instr)
      "VADD_LMUL2_SEW16_VARIANTSVV_VM1" : `SAMPLE_V(vadd_lmul2_sew16_variantsvv_vm1_cg, instr)
      "VADD_LMUL2_SEW32_VARIANTSVV_VM0" : `SAMPLE_V(vadd_lmul2_sew32_variantsvv_vm0_cg, instr)
      "VADD_LMUL2_SEW32_VARIANTSVV_VM1" : `SAMPLE_V(vadd_lmul2_sew32_variantsvv_vm1_cg, instr)
      "VADD_LMUL2_SEW64_VARIANTSVV_VM0" : `SAMPLE_V(vadd_lmul2_sew64_variantsvv_vm0_cg, instr)
      "VADD_LMUL2_SEW64_VARIANTSVV_VM1" : `SAMPLE_V(vadd_lmul2_sew64_variantsvv_vm1_cg, instr)
      "VADD_LMUL4_SEW8_VARIANTSVV_VM0" : `SAMPLE_V(vadd_lmul4_sew8_variantsvv_vm0_cg, instr)
      "VADD_LMUL4_SEW8_VARIANTSVV_VM1" : `SAMPLE_V(vadd_lmul4_sew8_variantsvv_vm1_cg, instr)
      "VADD_LMUL4_SEW16_VARIANTSVV_VM0" : `SAMPLE_V(vadd_lmul4_sew16_variantsvv_vm0_cg, instr)
      "VADD_LMUL4_SEW16_VARIANTSVV_VM1" : `SAMPLE_V(vadd_lmul4_sew16_variantsvv_vm1_cg, instr)
      "VADD_LMUL4_SEW32_VARIANTSVV_VM0" : `SAMPLE_V(vadd_lmul4_sew32_variantsvv_vm0_cg, instr)
      "VADD_LMUL4_SEW32_VARIANTSVV_VM1" : `SAMPLE_V(vadd_lmul4_sew32_variantsvv_vm1_cg, instr)
      "VADD_LMUL4_SEW64_VARIANTSVV_VM0" : `SAMPLE_V(vadd_lmul4_sew64_variantsvv_vm0_cg, instr)
      "VADD_LMUL4_SEW64_VARIANTSVV_VM1" : `SAMPLE_V(vadd_lmul4_sew64_variantsvv_vm1_cg, instr)
      "VADD_LMUL8_SEW8_VARIANTSVV_VM0" : `SAMPLE_V(vadd_lmul8_sew8_variantsvv_vm0_cg, instr)
      "VADD_LMUL8_SEW8_VARIANTSVV_VM1" : `SAMPLE_V(vadd_lmul8_sew8_variantsvv_vm1_cg, instr)
      "VADD_LMUL8_SEW16_VARIANTSVV_VM0" : `SAMPLE_V(vadd_lmul8_sew16_variantsvv_vm0_cg, instr)
      "VADD_LMUL8_SEW16_VARIANTSVV_VM1" : `SAMPLE_V(vadd_lmul8_sew16_variantsvv_vm1_cg, instr)
      "VADD_LMUL8_SEW32_VARIANTSVV_VM0" : `SAMPLE_V(vadd_lmul8_sew32_variantsvv_vm0_cg, instr)
      "VADD_LMUL8_SEW32_VARIANTSVV_VM1" : `SAMPLE_V(vadd_lmul8_sew32_variantsvv_vm1_cg, instr)
      "VADD_LMUL8_SEW64_VARIANTSVV_VM0" : `SAMPLE_V(vadd_lmul8_sew64_variantsvv_vm0_cg, instr)
      "VADD_LMUL8_SEW64_VARIANTSVV_VM1" : `SAMPLE_V(vadd_lmul8_sew64_variantsvv_vm1_cg, instr)

		endcase
    `uvm_info(",","riscv_instr_vector_cover_group", UVM_LOW)
	endfunction
	
	//function void sample(riscv_instr instr,string find_va_variant,find_vcsr_t find_vcsr);
	//	if(instr.instr_name == VADD && find_va_variant == "VV" && find_vcsr.find_vm == 0 && find_vcsr.sew == 32 && find_vcsr.lmul == 2)begin
  //    VADD_VV_VM0       : `SAMPLE_V(vadd_vv_vm0_cg, instr)
	//	end
  //    //VADD_VV_VM1       : `SAMPLE_V(vadd_vv_vm1_cg, instr)
  //  `uvm_info(",","riscv_instr_vector_cover_group", UVM_LOW)
	//endfunction

endclass
