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
//    `CG_SELECTOR_BEGIN(RVV)
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
	`V_INSTR_CG_BEGIN(vadd_vv_vlmul1_vsew64_vm1_vl4)
    cp_vs1 : coverpoint instr.vs1{
		}
    cp_vd : coverpoint instr.vd{
       ignore_bins v0  = {V0};
		}
    cp_vs2 : coverpoint instr.vs2{

		}
  `CG_END

  find_vset_t find_vset;	
	function new(riscv_instr_gen_config cfg);
		super.new(cfg);
    `CG_SELECTOR_BEGIN(RVV)
				vadd_vv_vlmul1_vsew64_vm1_vl4_cg = new();
    `CG_SELECTOR_END
    `uvm_info(",","riscv_instr_vector_cover_group", UVM_LOW)
	endfunction
	
	function void sample(riscv_instr instr,string find_va_variant,find_vset_t find_vset);
    //case (instr.instr_name)
    //  VADD       : `SAMPLE_V(vadd_cg, instr)
    //  default: begin
    //    if (instr.group == RV32I) begin
    //      `SAMPLE(rv32i_misc_cg, instr);
    //    end
    //  end
    //endcase
		if(instr.instr_name == VADD && find_va_variant == "VV" && find_vset.find_vm == 1 && find_vset.find_vlmul == 1 && find_vset.find_vsew == 64 && find_vset.find_vl == 4)begin
      VADD_VV_VLMUL1_VSEW64_VM1_VL4       : `SAMPLE_V(vadd_vv_vlmul1_vsew64_vm1_vl4_cg, instr)
		end
    `uvm_info(",","riscv_instr_vector_cover_group", UVM_LOW)
    `uvm_info("", $sformatf("riscv_instr_vector_cover_group instr is %0s, find_vl is %0d,va_variant is %0s,find_vm is %0d, find_vlmul is %0d, find_vsew is %0d",instr.instr_name,find_vset.find_vl,find_va_variant,find_vset.find_vm,find_vset.find_vlmul,find_vset.find_vsew), UVM_LOW)
	endfunction

endclass
