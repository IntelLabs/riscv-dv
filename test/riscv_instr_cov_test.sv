// This test read all trace CSV, and collect functional coverage from the instruction trace
class riscv_instr_cov_test extends uvm_test;

  typedef uvm_enum_wrapper#(riscv_instr_name_t) instr_enum;
  riscv_instr_gen_config    cfg;
  riscv_instr_cover_group   instr_cg;
  riscv_instr_vector_cover_group   instr_v_cg;
  string                    trace_csv[$];
  string                    trace[string];
  bit                       report_illegal_instr;
  int unsigned              entry_cnt;
  int unsigned              total_entry_cnt;
  int unsigned              skipped_cnt;
  int unsigned              illegal_instr_cnt;
  find_vcsr_t               find_vcsr;
	`uvm_component_utils(riscv_instr_cov_test)
  `uvm_component_new

  task run_phase(uvm_phase phase);
    int i;
    string args;
    string csv;
    string line;
    string header[$];
    string entry[$];
    int fd;
    void'($value$plusargs("report_illegal_instr=%0d", report_illegal_instr));
    while(1) begin
      args = {$sformatf("trace_csv_%0d", i), "=%s"};
      if ($value$plusargs(args, csv)) begin
        trace_csv.push_back(csv);
      end else begin
        break;
      end
      i++;
    end
    cfg = riscv_instr_gen_config::type_id::create("cfg");
    // disable_compressed_instr is not relevant to coverage test
    cfg.disable_compressed_instr = 0;
    riscv_instr::create_instr_list(cfg);
    riscv_csr_instr::create_csr_filter(cfg);
    instr_cg = new(cfg);
    instr_v_cg = new(cfg);
    `uvm_info(`gfn, $sformatf("%0d CSV trace files to be processed", trace_csv.size()), UVM_LOW)
    foreach (trace_csv[i]) begin
      bit expect_illegal_instr;
      entry_cnt = 0;
      instr_cg.reset();
      instr_v_cg.reset();
      `uvm_info(`gfn, $sformatf("Processing CSV trace[%0d]: %s", i, trace_csv[i]), UVM_LOW)
      fd = $fopen(trace_csv[i], "r");
      if (fd) begin
        // Get the header line
        if ($fgets(line, fd)) begin
          split_string(line, ",", header);
          `uvm_info(`gfn, $sformatf("Header: %0s", line), UVM_LOW);
        end else begin
          `uvm_info(`gfn, $sformatf("Skipping empty trace file: %0s", trace_csv[i]), UVM_LOW)
          continue;
        end
        while ($fgets(line, fd)) begin
          split_string(line, ",", entry);
          if (entry.size() != header.size()) begin
            `uvm_info(`gfn, $sformatf("Skipping malformed entry[%0d] : %0s", entry_cnt, line), UVM_LOW)
            skipped_cnt += 1;
          end else begin
            trace["csv_entry"] = line;
            `uvm_info("", "----------------------------------------------------------", UVM_HIGH)
            foreach (header[j]) begin
              trace[header[j]] = entry[j];
              if (header[j].substr(0,2) != "pad") begin
                `uvm_info("", $sformatf("%0s=%0s", header[j], entry[j]), UVM_HIGH)
              end
            end
            post_process_trace();
            if (trace["instr"] inside {"li", "ret", "la"}) continue;
            if (uvm_is_match("amo*",trace["instr"]) ||
                uvm_is_match("lr*" ,trace["instr"]) ||
                uvm_is_match("sc*" ,trace["instr"])) begin
              // TODO: Enable functional coverage for AMO test
              continue;
            end
            if (!sample()) begin
              if (report_illegal_instr) begin
               `uvm_error(`gfn, $sformatf("Found unexpected illegal instr: %0s [%0s]",
                                          trace["instr"], line))
              end
              illegal_instr_cnt++;
            end
          end
          entry_cnt += 1;
        end
      end else begin
        `uvm_error(`gfn, $sformatf("%0s cannot be openned", trace_csv[i]))
      end
      `uvm_info(`gfn, $sformatf("[%s] : %0d instructions processed",
                      trace_csv[i], entry_cnt), UVM_LOW)
      total_entry_cnt += entry_cnt;
    end
    `uvm_info(`gfn, $sformatf("Finished processing %0d trace CSV, %0d instructions",
                     trace_csv.size(), total_entry_cnt), UVM_LOW)
    if ((skipped_cnt > 0) || ((illegal_instr_cnt > 0) && report_illegal_instr)) begin
      `uvm_error(`gfn, $sformatf("%0d instructions skipped, %0d illegal instruction",
                       skipped_cnt, illegal_instr_cnt))

    end else begin
      `uvm_info(`gfn, "TEST PASSED", UVM_NONE);
    end
  endtask

  virtual function void post_process_trace();
  endfunction

  function void fatal (string str);
    `uvm_info(`gfn, str, UVM_NONE);
    if ($test$plusargs("stop_on_first_error")) begin
      `uvm_fatal(`gfn, "Errors: *. Warnings: * (written by riscv_instr_cov.sv)")
    end
  endfunction

  function bit sample();
    riscv_instr_name_t instr_name;
    string instr_name_sample;
		bit vsetvli_valid;
		bit vsetvl_valid;
		bit vsetivli_valid;
    bit [XLEN-1:0] binary;
		string find_va_variant;
		bit find_vm;
  	string csr_status[$];
  	string csr_pair[$];
		//int lmul_len;
		//string lmul_fin;
		//string lmul_str;
  	string find_operands[$];
		bit [2:0]lmul;
    get_val(trace["binary"], binary, .hex(1));
    if ((binary[1:0] != 2'b11) && (RV32C inside {supported_isa})) begin
      if(only_vec_cov == 2'b00 || riscv_instr_pkg::only_vec_cov == 2'b01)`SAMPLE(instr_cg.compressed_opcode_cg, binary[15:0])
      if(only_vec_cov == 2'b00 || riscv_instr_pkg::only_vec_cov == 2'b01)`SAMPLE(instr_cg.illegal_compressed_instr_cg, binary)
    end
    if (binary[1:0] == 2'b11)begin
      if(only_vec_cov == 2'b00 || riscv_instr_pkg::only_vec_cov == 2'b01)`SAMPLE(instr_cg.opcode_cg, binary[6:2])
    end
    if ((binary[6:0] == 7'b1010111) && ((trace["instr"] !== "vsetivli") && (trace["instr"] !== "vsetvl") && (trace["instr"] !== "vsetvli")))begin
      if(only_vec_cov == 2'b11 || riscv_instr_pkg::only_vec_cov == 2'b01)`SAMPLE(instr_v_cg.arithmetic_cg,binary[31:0])
      `uvm_info(`gfn, $sformatf("sample arithmetic_cg, instr is %0s",trace["instr"]), UVM_LOW)
    end
    if (binary[6:0] == 7'b0000111)begin
      if(only_vec_cov == 2'b11 || riscv_instr_pkg::only_vec_cov == 2'b01)`SAMPLE(instr_v_cg.load_cg,binary[31:0])
      `uvm_info(`gfn, $sformatf("sample load_cg, instr is %0s",trace["instr"]), UVM_LOW)
		end
    if (binary[6:0] == 7'b0100111)begin
      if(only_vec_cov == 2'b11 || riscv_instr_pkg::only_vec_cov == 2'b01)`SAMPLE(instr_v_cg.store_cg,binary[31:0])
      `uvm_info(`gfn, $sformatf("sample store_cg, instr is %0s",trace["instr"]), UVM_LOW)
    end

    if (instr_enum::from_name(process_instr_name(trace["instr"],find_va_variant), instr_name)) begin
			if (riscv_instr::instr_template.exists(instr_name)) begin
        riscv_instr instr;
        riscv_vector_instr instr_vec;
        instr = riscv_instr::get_instr(instr_name);
				//added
          if ((instr.group inside {RVV}) &&
             (instr.group inside {supported_isa})) begin
           split_string(trace["csr"], ";", csr_status);

           foreach (csr_status[i]) begin
             split_string(csr_status[i], ":", csr_pair);
             if (csr_pair.size() != 2) begin
               `uvm_fatal(`gfn, $sformatf("Illegal csr status format: %0s", csr_status[i]))
             end
						 if(csr_pair[0] == "vstart")
               get_val(csr_pair[1],find_vcsr.vstart,.hex(1));
						 else if(csr_pair[0] == "sew")
               find_vcsr.sew = csr_pair[1].atoreal();
						 else if(csr_pair[0] == "vl")
               find_vcsr.vl = csr_pair[1].atoreal();
						 else if(csr_pair[0] == "lmul")begin
               if(csr_pair[1] == "f2") find_vcsr.lmul = 0.5;
               if(csr_pair[1] == "f4") find_vcsr.lmul = 0.25;
               if(csr_pair[1] == "f8") find_vcsr.lmul = 0.125;
               if(csr_pair[1] == "1") find_vcsr.lmul = 1;
               if(csr_pair[1] == "2") find_vcsr.lmul = 2;
               if(csr_pair[1] == "4") find_vcsr.lmul = 4;
               if(csr_pair[1] == "8") find_vcsr.lmul = 8;
						 end
						 //illegal_spike_changed
						 else if(csr_pair[0] == "vtype")begin
               get_val(csr_pair[1],find_vcsr.vtype,.hex(1));
               find_vcsr.vta = find_vcsr.vtype[6];   
               find_vcsr.vma = find_vcsr.vtype[7];   
               //lmul = find_vcsr.vtype[2:0];  
		           //find_vcsr.lmul = get_digital_lmul(lmul);
   					 end
						 //illegal_spike_changed
						 //else if(csr_pair[0] == "ma")
             //  find_vcsr.vma = csr_pair[1].atoreal();
						 //else if(csr_pair[0] == "ta")
             //  find_vcsr.vta = csr_pair[1].atoreal();
						 //else if(csr_pair[0] == "vm")
             //  find_vcsr.vm = csr_pair[1].atoreal();
						 else if(csr_pair[0] == "fflags")begin
               get_val(csr_pair[1],find_vcsr.fflags,.hex(1));
               //find_vcsr.fflags = csr_pair[1].atoreal();
						 end
						 else if(csr_pair[0] == "vxsat")begin
               get_val(csr_pair[1],find_vcsr.vxsat,.hex(1));
               //find_vcsr.vxsat = csr_pair[1].atoreal();
						 end
						 else if(csr_pair[0] == "vxrm")begin
               get_val(csr_pair[1],find_vcsr.vxrm,.hex(1));
               //find_vcsr.vxrm = csr_pair[1].atoreal();
						 end
						 else if(csr_pair[0] == "frm")begin
               get_val(csr_pair[1],find_vcsr.frm,.hex(1));
               //find_vcsr.frm = csr_pair[1].atoreal();
						 end
           end
					     find_vcsr.va_variant = find_va_variant;
           `uvm_info(`gfn, $sformatf("sample vector csrcase, instr is %s, vcsr.va_variant is %0s, find_va_variant is %0s, vstart is %0b, vl is %0d, sew is %0d, lmul is %0f,vtype is %0b, vta is %0d, vma is %0d, fflags is %0b, vxsat is %0b, vxrm is %0b, frm is %0b",instr.instr_name,find_va_variant,find_vcsr.va_variant,find_vcsr.vstart,find_vcsr.vl,find_vcsr.sew,find_vcsr.lmul,find_vcsr.vtype, find_vcsr.vta, find_vcsr.vma,find_vcsr.fflags,find_vcsr.vxsat,find_vcsr.vxrm, find_vcsr.frm), UVM_LOW)
  	       split_string(trace["operand"], ",", find_operands);
		         //illegal_spike_changed
					   if((instr.instr_name inside {VMERGE, VFMERGE, VADC, VSBC, VMADC, VMSBC}) && (find_operands[3] == "v0"))begin
               find_vcsr.vm = 0;
               `uvm_info(`gfn, $sformatf("find_vm is %0d ,instr_name is %0s",find_vcsr.vm,instr.instr_name), UVM_LOW)
		         end else if((find_operands[4] == "v0.t") ||(find_operands[3] == "v0.t") || (find_operands[2] == "v0.t")|| (find_operands[1] == "v0.t"))begin
               find_vcsr.vm = 0;
               `uvm_info(`gfn, $sformatf("find_vm is %0d ,instr_name is %0s",find_vcsr.vm,instr.instr_name), UVM_LOW)
		         end
						 else begin
               find_vcsr.vm = 1;
               `uvm_info(`gfn, $sformatf("find_vm is %0d ,instr_name is %0s",find_vcsr.vm,instr.instr_name), UVM_LOW)
						 end
					 assign_trace_info_to_instr(instr,find_va_variant);
           //instr.pre_sample();
 
           //`uvm_info(`gfn, $sformatf("sample vector cg is %0s,vector_va_variant is %0s",
           //                    process_instr_name(trace["instr"],find_va_variant),find_va_variant), UVM_LOW)
					 // instr_name_sample = get_instr_name_sample(instr,find_va_variant,find_vcsr);
           // `uvm_info(`gfn, $sformatf("instr_name_sample in vector is %0s",instr_name_sample), UVM_LOW)
           // instr_v_cg.sample(instr,instr_name_sample);
					 if(instr.instr_name == VSETVLI)begin
						 vsetvli_valid = 1;
						 if(only_vec_cov == 2'b11 || riscv_instr_pkg::only_vec_cov == 2'b01)`SAMPLE(instr_v_cg.vsetvli_cg,vsetvli_valid)
					 end
					 if(instr.instr_name == VSETVL)begin
						 vsetvl_valid = 1;
						 if(only_vec_cov == 2'b11 || riscv_instr_pkg::only_vec_cov == 2'b01)`SAMPLE(instr_v_cg.vsetvl_cg,vsetvl_valid)
					 end
					 if(instr.instr_name == VSETIVLI)begin
					   vsetivli_valid = 1;
					   if(only_vec_cov == 2'b11 || riscv_instr_pkg::only_vec_cov == 2'b01)`SAMPLE(instr_v_cg.vsetivli_cg,vsetivli_valid)
					 end
					 //if(instr.instr_name inside {VADD,VSUB}) begin
						 if(only_vec_cov == 2'b11 || riscv_instr_pkg::only_vec_cov == 2'b01)instr_v_cg.sample(instr);
          	`uvm_info(`gfn, $sformatf("sample vector cg is %0s,instr group is %0s",instr.instr_name,instr.group), UVM_LOW)
						if (instr.instr_name inside {VADD, VSUB, VRSUB, VWADDU, VWSUBU, VWADD, VWSUB, VZEXT, VSEXT, VADC, VMADC, VSBC, VMSBC, VAND, VOR, VXOR, VSLL, VSRL, VSRA, VNSRL, VNSRA, VMSEQ, VMSNE, VMSLTU, VMSLT, VMSLEU, VMSLE, VMSGTU, VMSGT, VMINU, VMIN, VMAXU, VMAX, VMUL, VMULH, VMULHU, VMULHSU, VDIVU, VDIV, VREMU, VREM, VWMUL, VWMULU, VWMULSU, VMACC, VNMSAC, VMADD, VNMSUB, VWMACCU, VWMACC, VWMACCSU, VWMACCUS, VMERGE, VMV, VSADDU, VSADD, VSSUBU, VSSUB, VAADDU, VAADD, VASUBU, VASUB, VSMUL, VSSRL, VSSRA, VNCLIPU, VNCLIP, VFADD, VFSUB, VFRSUB, VFWADD, VFWSUB, VFMUL, VFDIV, VFRDIV, VFWMUL, VFMACC, VFNMACC, VFMSAC, VFNMSAC, VFMADD, VFNMADD, VFMSUB, VFNMSUB, VFWMACC, VFWNMACC, VFWMSAC, VFWNMSAC, VFSQRT_V, VFRSQRT7_V, VFREC7_V, VFMIN, VFMAX, VFSGNJ, VFSGNJN, VFSGNJX, VMFEQ, VMFNE, VMFLT, VMFLE, VMFGT, VMFGE, VFCLASS_V, VFMERGE, VFMV, VFCVT_XU_F_V, VFCVT_X_F_V, VFCVT_RTZ_XU_F_V, VFCVT_RTZ_X_F_V, VFCVT_F_XU_V, VFCVT_F_X_V, VFWCVT_XU_F_V, VFWCVT_X_F_V, VFWCVT_RTZ_XU_F_V, VFWCVT_RTZ_X_F_V, VFWCVT_F_XU_V, VFWCVT_F_X_V, VFWCVT_F_F_V, VFNCVT_XU_F_W, VFNCVT_X_F_W, VFNCVT_F_XU_W, VFNCVT_F_X_W, VFNCVT_F_F_W, VFNCVT_ROD_F_F_W, VREDSUM_VS, VREDMAXU_VS, VREDMAX_VS, VREDMINU_VS, VREDMIN_VS, VREDAND_VS, VREDOR_VS, VREDXOR_VS, VWREDSUMU_VS, VWREDSUM_VS, VFREDOSUM_VS, VFREDUSUM_VS, VFREDMAX_VS, VFREDMIN_VS, VFWREDOSUM_VS, VFWREDUSUM_VS, VMAND_MM, VMNAND_MM, VMANDN_MM, VMXOR_MM, VMOR_MM, VMNOR_MM, VMORN_MM, VMXNOR_MM, VPOPC_M, VFIRST_M, VMSBF_M, VMSIF_M, VMSOF_M, VIOTA_M, VID_V, VMV_X_S, VMV_S_X, VFMV_F_S, VFMV_S_F, VSLIDEUP, VSLIDEDOWN, VSLIDE1UP, VFSLIDE1UP, VSLIDE1DOWN, VFSLIDE1DOWN, VRGATHER, VRGATHEREI16, VCOMPRESS, VMV1R_V, VMV2R_V, VMV4R_V, VMV8R_V, VLE_V, VSE_V, VLM_V, VSM_V, VLSE_V, VSSE_V, VLUXEI_V, VLOXEI_V, VSUXEI_V, VSOXEI_V, VLEFF_V, VLSEGE_V, VSSEGE_V, VLSEGEFF_V, VLSSEGE_V, VSSSEGE_V, VLUXSEGEI_V, VLOXSEGEI_V, VSUXSEGEI_V, VSOXSEGEI_V, VLRE_V, VSR_V})begin
							if(only_vec_cov == 2'b11 || riscv_instr_pkg::only_vec_cov == 2'b01)`SAMPLE_V(instr_v_cg.vlvta_cg,instr)
					  	if(only_vec_cov == 2'b11 || riscv_instr_pkg::only_vec_cov == 2'b01)`SAMPLE_V(instr_v_cg.lmulvdvs3_cg,instr)
					  	if(only_vec_cov == 2'b11 || riscv_instr_pkg::only_vec_cov == 2'b01)`SAMPLE_V(instr_v_cg.lmulvs1_cg,instr)
					  	if(only_vec_cov == 2'b11 || riscv_instr_pkg::only_vec_cov == 2'b01)`SAMPLE_V(instr_v_cg.lmulvs2_cg,instr)
					  end
					//if(instr.instr_name inside {VMV_X_S,VMV_S_X,VFMV_F_S,VFMV_S_F,VSLIDEUP,VSLIDEDOWN,VSLIDE1UP,VFSLIDE1UP,VSLIDE1DOWN,VFSLIDE1DOWN,VRGATHER,VRGATHEREI16,VCOMPRESS,VMV1R_V,VMV2R_V,VMV4R_V,VMV8R_V})begin
          //  	`SAMPLE_V(instr_v_cg.reg_permutation_cg,instr);
          //		`uvm_info(`gfn, $sformatf("sample vector reg_per_cg is %0s",instr.instr_name,instr.rd,instr.vd), UVM_LOW)
					//end
					//else if (instr.instr_name inside {VSETVL,VSETVLI,VSETIVLI})begin

					//end
					//else begin
          //  	`SAMPLE_V(instr_v_cg.allreg_cg,instr);
          //		`uvm_info(`gfn, $sformatf("sample vector reg_cg is %0s",instr.instr_name,instr.rd,instr.vd), UVM_LOW)
					//end
				  end
				  else if ((instr.group inside {RV32I, RV32M, RV32C, RV64I, RV64M, RV64C,
                                   RV32D, RV64D, RV32B, RV64B
                                  }) &&
             (instr.group inside {supported_isa})) begin
           assign_trace_info_to_instr(instr,find_va_variant);
           instr.pre_sample();
           `uvm_info(`gfn, $sformatf("sample scalar cg is %0s",
                               process_instr_name(trace["instr"],find_va_variant)), UVM_LOW)
           if(only_vec_cov == 2'b00 || riscv_instr_pkg::only_vec_cov == 2'b01)instr_cg.sample(instr);
          end
          else if ((instr.group inside {RV32F, RV64F,RV32ZBA, RV32ZBB, RV32ZBC,
				  	          RV32ZBS,RV64ZBA, RV64ZBB, RV64ZBC, RV64ZBS} ) &&
											(instr.group inside {supported_isa}) ) begin
											assign_trace_info_to_instr(instr,find_va_variant);
											instr.pre_sample();
											`uvm_info(`gfn, $sformatf("sample floating cg is %0s",
												process_instr_name(trace["instr"],find_va_variant)), UVM_LOW)
												if(only_vec_cov == 2'b00 || riscv_instr_pkg::only_vec_cov == 2'b01)instr_cg.sample(instr);
							 end
							 return 1'b1;
					end
			end
    `uvm_info(`gfn, $sformatf("Cannot find opcode: %0s",
    process_instr_name(trace["instr"],find_va_variant)), UVM_LOW)
  endfunction

  //function string get_instr_name_sample(riscv_instr instr,string find_va_variant,find_vcsr_t find_vcsr);
  //string instr_name_sample;
	//case(find_vcsr.lmul)
	//	3'b000:instr_name_sample =$sformatf("%0s_LMUL1_SEW%0d_VARIANT%0s",instr.instr_name,find_vcsr.sew,find_va_variant);
	//	3'b001:instr_name_sample =$sformatf("%0s_LMUL2_SEW%0d_VARIANT%0s",instr.instr_name,find_vcsr.sew,find_va_variant);
	//	3'b010:instr_name_sample =$sformatf("%0s_LMUL4_SEW%0d_VARIANT%0s",instr.instr_name,find_vcsr.sew,find_va_variant);
	//	3'b011:instr_name_sample =$sformatf("%0s_LMUL8_SEW%0d_VARIANT%0s",instr.instr_name,find_vcsr.sew,find_va_variant);
	//	3'b101:instr_name_sample =$sformatf("%0s_LMUL0_125_SEW%0d_VARIANT%0s",instr.instr_name,find_vcsr.sew,find_va_variant);
	//	3'b110:instr_name_sample =$sformatf("%0s_LMUL0_25_SEW%0d_VARIANT%0s",instr.instr_name,find_vcsr.sew,find_va_variant);
	//	3'b111:instr_name_sample =$sformatf("%0s_LMUL0_5_SEW%0d_VARIANT%0s",instr.instr_name,find_vcsr.sew,find_va_variant);
	//endcase
	//	`uvm_info(`gfn, $sformatf("instr_name_sample is %0s",	instr_name_sample), UVM_LOW)
	//	return instr_name_sample;
	//endfunction
  
  //function real get_digital_lmul(bit[2:0] lmul);
	//  real find_lmul;
	//	case(lmul)
	//	3'b000:find_lmul =1;
	//	3'b001:find_lmul =2;
	//	3'b010:find_lmul =4;
	//	3'b011:find_lmul =8;
	//	3'b101:find_lmul =0.125;
	//	3'b110:find_lmul =0.25;
	//	3'b111:find_lmul =0.5;
	//endcase
	//	`uvm_info(`gfn, $sformatf("find_lmul is %0f",	find_lmul), UVM_LOW)
	//	return find_lmul;
	//endfunction

	virtual function void assign_trace_info_to_instr(riscv_instr instr,string find_va_variant);
  	riscv_reg_t gpr;
  	string operands[$];
  	string gpr_update[$];
  	string pair[$];
		bit find_vm;
  	get_val(trace["pc"], instr.pc, .hex(1));
  	get_val(trace["binary"], instr.binary, .hex(1));
  	instr.trace = trace["instr_str"];
  	if (instr.instr_name inside {NOP, WFI, FENCE, FENCE_I, EBREAK, C_EBREAK, SFENCE_VMA,
  		ECALL, C_NOP, MRET, SRET, URET}) begin
  		return;
  	end

  	split_string(trace["operand"], ",", operands);
		////if(instr.instr_name inside {VMERGE, VFMERGE, VADC, VSBC, VMADC, VMSBC})begin
		//  if(operands[3] == "v0")begin
    //    find_vcsr.vm = 1;
    //    `uvm_info(`gfn, $sformatf("find_vm is %0d ,instr_name is %0s",find_vcsr.vm,instr.instr_name), UVM_LOW)
	  ////end
		//  end else if(operands[3] == "v0.t")begin
    //    find_vcsr.vm = 1;
    //    `uvm_info(`gfn, $sformatf("find_vm is %0d ,instr_name is %0s",find_vcsr.vm,instr.instr_name), UVM_LOW)
		//  end
		instr.update_src_regs(operands,find_va_variant);
		instr.update_vec_csr(find_vcsr);

    split_string(trace["gpr"], ";", gpr_update);

    foreach (gpr_update[i]) begin
      split_string(gpr_update[i], ":", pair);
      if (pair.size() != 2) begin
        `uvm_fatal(`gfn, $sformatf("Illegal gpr update format: %0s", gpr_update[i]))
      end
      instr.update_dst_regs(pair[0], pair[1]);
    end

  endfunction : assign_trace_info_to_instr


	function string process_instr_name(string instr_name,ref find_va_variant);
    int find_vpos;
    bit find_va_variant_bit;
		int instr_name_len;
		string find_va_variant;
		bit find_vm;
		int instr_vlsegeff;
		int instr_vleff;
		instr_name = instr_name.toupper();
		//if vector instruction
		`uvm_info(`gfn, $sformatf("process_instr_name instr_name is %0s,instr_name[0] is %0s",	instr_name,instr_name[0]), UVM_LOW)
		if(instr_name[0] == "V")begin
      foreach (instr_name[i]) begin
		  	if (instr_name[i] == ".") begin
          instr_name[i] = "_";
        end
      end
			find_va_variant_bit = get_va_variant(instr_name);
			if(instr_name == "VMV_V_V" )begin
        instr_name = "VMV";
				find_va_variant = "VV";
			end
			else if(instr_name == "VMV_V_X")begin
        instr_name = "VMV";
				find_va_variant = "VX";
			end
			else if(instr_name == "VMV_V_I")begin
        instr_name = "VMV";
				find_va_variant = "VI";
			end
			else if(instr_name == "VFMV_V_F")begin
        instr_name = "VFMV";
				find_va_variant = "VF";
			end
			else if(instr_name == "VCPOP_M")begin
        instr_name = "VPOPC_M";
			end
			else if(instr_name inside{"VREDSUM_VS","VREDMAXU_VS","VREDMAX_VS","VREDMINU_VS","VREDMIN_VS","VREDAND_VS","VREDOR_VS",
			"VREDXOR_VS","VWREDSUMU_VS","VWREDSUM_VS","VFREDOSUM_VS","VFREDUSUM_VS","VFREDMAX_VS","VFREDMIN_VS","VFWREDOSUM_VS","VFWREDUSUM_VS"} )begin
    
			end
			else if(find_va_variant_bit == 1)begin
				instr_name_len = instr_name.len();
				find_vpos = find_pos(instr_name);
				find_va_variant = instr_name.substr(find_vpos+1,instr_name_len-1);
				instr_name = instr_name.substr(0,(find_vpos - 1));
				`uvm_info(`gfn, $sformatf("after process_instr_name instr_name is %0s,find_va_variant is %0s,instr_len is %0d",	instr_name,find_va_variant,instr_name_len), UVM_LOW)
			end
			else if(instr_name == "VSETVL" || instr_name == "VSETVLI" || instr_name =="VSETIVLI")begin

			end
			else begin
        if(instr_name[1] == "L")begin
					if(instr_name[2] == "S" && instr_name[3] == "E")begin
						if(instr_name[4] == "G")begin
							instr_vlsegeff = instr_name.len();
							if(instr_name[(instr_vlsegeff)-3] == "F" && instr_name[(instr_vlsegeff)-4] =="F")
                  instr_name = "VLSEGEFF_V";
              else instr_name = "VLSEGE_V";
				    end
				    else instr_name = "VLSE_V";
					end

					else if(instr_name[2] == "E") begin
							instr_vleff = instr_name.len();
							if(instr_name[(instr_vleff)-3] == "F" && instr_name[(instr_vleff)-4] =="F")
                  instr_name = "VLEFF_V";
		    	  	else instr_name = "VLE_V";
				  end
          else if(instr_name[2] == "S" && instr_name[3] == "S" && instr_name[4] == "E" && instr_name[5] == "G" )begin
						instr_name = "VLSSEGE_V";
					end
					else if(instr_name[2] =="U") begin
					  if(instr_name[3] == "X" && instr_name[4] == "E")
							instr_name = "VLUXEI_V";
						else instr_name = "VLUXSEGEI_V";
					end
					else if(instr_name[2] =="O") begin
					  if(instr_name[3] == "X" && instr_name[4] == "E")
							instr_name = "VLOXEI_V";
						else instr_name = "VLOXSEGEI_V";
					end
					else begin
		    	  	foreach(instr_name[i])begin
                if(instr_name[i] == "R" && instr_name[i+1] == "E")
                  instr_name = "VLRE_V";
		    	  	end
					end
	 	    end
				else if (instr_name[1] == "S") begin
					if(instr_name[2] == "S" && instr_name[3] == "E" )begin
						if(instr_name[4] == "G")begin
		    		  	instr_name = "VSSEGE_V";
				    end
				    else instr_name = "VSSE_V";
					end

					else if(instr_name[2] == "E") begin
		    	  		instr_name = "VSE_V";
				  end
          else if(instr_name[2] == "S" && instr_name[3] == "S" && instr_name[4] == "E" && instr_name[5] == "G" )begin
						instr_name = "VSSSEGE_V";
					end
					else if(instr_name[2] =="U") begin
					  if(instr_name[3] == "X" && instr_name[4] == "E")
							instr_name = "VSUXEI_V";
						else instr_name = "VSUXSEGEI_V";
					end
					else if(instr_name[2] =="O") begin
					  if(instr_name[3] == "X" && instr_name[4] == "E")
							instr_name = "VSOXEI_V";
						else instr_name = "VSOXSEGEI_V";
					end
					else begin
		    	  	foreach(instr_name[i])begin
                if(instr_name[i] == "R")
                  instr_name = "VSR_V";
		    	  	end
					end
				end
				`uvm_info(`gfn, $sformatf("load_store process_instr_name instr_name is %0s",	instr_name), UVM_LOW)
			end
		end
		//if scalar instruction
		else begin
      foreach (instr_name[i]) begin
		  	if (instr_name[i] == ".") begin
          instr_name[i] = "_";
        end
      end
	  end
    
    case (instr_name)
      // rename to new name as ovpsim still uses old name
     "FMV_S_X": instr_name = "FMV_W_X";
     "FMV_X_S": instr_name = "FMV_X_W";
      // convert Pseudoinstructions
      // fmv.s rd, rs fsgnj.s rd, rs, rs Copy single-precision register
      // fabs.s rd, rs fsgnjx.s rd, rs, rs Single-precision absolute value
      // fneg.s rd, rs fsgnjn.s rd, rs, rs Single-precision negate
      // fmv.d rd, rs fsgnj.d rd, rs, rs Copy double-precision register
      // fabs.d rd, rs fsgnjx.d rd, rs, rs Double-precision absolute value
      // fneg.d rd, rs fsgnjn.d rd, rs, rs Double-precision negate
      "FMV_S":  instr_name = "FSGNJ_S";
      "FABS_S": instr_name = "FSGNJX_S";
      "FNEG_S": instr_name = "FSGNJN_S";
      "FMV_D":  instr_name = "FSGNJ_D";
      "FABS_D": instr_name = "FSGNJX_D";
      "FNEG_D": instr_name = "FSGNJN_D";
			default: ;
    endcase
    
		`uvm_info(`gfn, $sformatf("finalfinalprocess_instr_name instr_name is %0s,instr_name[0] is %0s",	instr_name,instr_name[0]), UVM_LOW)
		return instr_name;
  endfunction : process_instr_name

	function bit get_va_variant(string instr_name);
  bit find_va_variant_bit;
	foreach(instr_name[i])begin
		if(instr_name[i] == "_")begin
			if(instr_name[i+1] == "V")begin
				if(instr_name[i+2] == "V" ||  instr_name[i+2] == "I" || instr_name[i+2] == "X" ||instr_name[i+2] == "F" || instr_name[i+2] == "S" || instr_name[i+2] == "M"||
					instr_name[i+2] == "V" & instr_name[i+3] == "M" ||  instr_name[i+2] == "I" & instr_name[i+3] == "M"|| 
				  instr_name[i+2] == "X" & instr_name[i+3] == "M"||instr_name[i+2] == "F" & instr_name[i+3] == "M")begin
		      find_va_variant_bit = 1;
		    end
			end
			else if(instr_name[i+1] == "W")begin
				if(instr_name[i+2] == "V" ||instr_name[i+2] == "I" ||instr_name[i+2] == "X" ||instr_name[i+2] == "F")begin
		      find_va_variant_bit = 1;
				end
			end
	  end
	end
	return find_va_variant_bit;
	endfunction

	function int find_pos(string instr_name);
		int find_vpos;
		foreach (instr_name[i])begin
      if(instr_name[i] == "_")begin
        find_vpos = i;
			end
		end
		return find_vpos;
	endfunction
  
	function void split_string(string str, byte step, ref string result[$]);
    string tmp_str;
    int i;
    bit in_quote;
    result = {};
    while (i < str.len()) begin
      if (str[i] == "\"") begin
        in_quote = ~in_quote;
      end else if ((str[i] == step) && !in_quote) begin
        result.push_back(tmp_str);
        tmp_str = "";
      end else begin
        tmp_str = {tmp_str, str[i]};
      end
      if (i == str.len()-1) begin
        result.push_back(tmp_str);
      end
      i++;
    end
  endfunction : split_string

  function void report_phase(uvm_phase phase);
    uvm_report_server rs;
    int error_count;
    rs = uvm_report_server::get_server();
    error_count = rs.get_severity_count(UVM_WARNING) +
                  rs.get_severity_count(UVM_ERROR) +
                  rs.get_severity_count(UVM_FATAL);
    if (error_count == 0) begin
      `uvm_info("", "TEST PASSED", UVM_NONE);
    end else begin
      `uvm_info("", "TEST FAILED", UVM_NONE);
    end
    `uvm_info("", "TEST GENERATION DONE", UVM_NONE);
    super.report_phase(phase);
  endfunction : report_phase

endclass
