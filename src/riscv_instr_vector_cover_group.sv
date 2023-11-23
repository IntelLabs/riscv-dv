//include vector cover point
`define SAMPLE_VSET(cg, val) `SAMPLE_W_TYPE(cg, val,riscv_vset_instr) 
`define SAMPLE_V(cg, val) `SAMPLE_W_TYPE(cg, val,riscv_vector_instr) 

`define VSET_INSTR_CG_BEGIN(INSTR_NAME) \
  `INSTR_CG_BEGIN(INSTR_NAME,riscv_vset_instr) \
    cp_vtype : coverpoint instr.vtype; \

`define V_INSTR_CG_BEGIN(INSTR_NAME) \
  `INSTR_CG_BEGIN(INSTR_NAME,riscv_vector_instr) \
    cp_vs1 : coverpoint instr.vs1; \
    //cp_vs2 : coverpoint instr.vs2; \
    //cp_vs3 : coverpoint instr.vs3; \
    //cp_vd : coverpoint instr.vd; \
    cp_va_variant : coverpoint instr.va_variant; \
    //cp_vm : coverpoint instr.vm; \
    //cp_wd : coverpoint instr.wd; \

class riscv_instr_vector_cover_group extends riscv_instr_cover_group;
	
  `VSET_INSTR_CG_BEGIN(vsetivli)
  `CG_END


  `VSET_INSTR_CG_BEGIN(vsetvli)
  `CG_END

  `VSET_INSTR_CG_BEGIN(vsetvl)
  `CG_END
  
	`V_INSTR_CG_BEGIN(vadd)
  `CG_END

	function new(riscv_instr_gen_config cfg);
		super.new(cfg);
    `CG_SELECTOR_BEGIN(RVV)
				vsetivli_cg = new();
				vsetvli_cg = new();
				vsetvl_cg = new();
				vadd_cg = new();
    `CG_SELECTOR_END
          `uvm_info(",","riscv_instr_vector_cover_group", UVM_LOW)
	endfunction
	
	function void sample(riscv_instr instr);
    case (instr.instr_name)
      VSETIVLI   : `SAMPLE_VSET(vsetivli_cg, instr)
      VSETVL     : `SAMPLE_VSET(vsetvl_cg, instr)
      VSETVLI    : `SAMPLE_VSET(vsetvli_cg, instr)
      VADD       : `SAMPLE_V(vadd_cg, instr)
      default: begin
        if (instr.group == RV32I) begin
          `SAMPLE(rv32i_misc_cg, instr);
        end
      end
    endcase
          `uvm_info(",","riscv_instr_vector_cover_group", UVM_LOW)
	endfunction

endclass

