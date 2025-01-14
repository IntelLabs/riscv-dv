/*
 * Copyright 2020 Google LLC
 * Copyright 2020 Andes Technology Co., Ltd.
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *      http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

// Vector CSR access instruction
// TODO: These instructions are not used.
`DEFINE_VSET_INSTR(VSETVLI,    VSET_FORMAT, CSR, RVV, UIMM)
`DEFINE_VSET_INSTR(VSETVL,     VSET_FORMAT, CSR, RVV)
`DEFINE_VSET_INSTR(VSETIVLI,   VSET_FORMAT, CSR, RVV)

// Vector integer arithmetic instruction
`DEFINE_VA_INSTR(VADD,     VA_FORMAT, ARITHMETIC, RVV, {VV, VX, VI})
`DEFINE_VA_INSTR(VSUB,     VA_FORMAT, ARITHMETIC, RVV, {VV, VX})
`DEFINE_VA_INSTR(VRSUB,    VA_FORMAT, ARITHMETIC, RVV, {VX, VI})
`DEFINE_VA_INSTR(VWADDU,   VA_FORMAT, ARITHMETIC, RVV, {VV, VX, WV, WX})
`DEFINE_VA_INSTR(VWSUBU,   VA_FORMAT, ARITHMETIC, RVV, {VV, VX, WV, WX})
`DEFINE_VA_INSTR(VWADD,    VA_FORMAT, ARITHMETIC, RVV, {VV, VX, WV, WX})
`DEFINE_VA_INSTR(VWSUB,    VA_FORMAT, ARITHMETIC, RVV, {VV, VX, WV, WX})
`DEFINE_VA_INSTR(VZEXT,    VS2_FORMAT, ARITHMETIC, RVV)
`DEFINE_VA_INSTR(VSEXT,    VS2_FORMAT, ARITHMETIC, RVV)
`DEFINE_VA_INSTR(VADC,     VA_FORMAT, ARITHMETIC, RVV, {VVM, VXM, VIM})
`DEFINE_VA_INSTR(VMADC,    VA_FORMAT, ARITHMETIC, RVV, {VVM, VXM, VIM, VV, VX, VI})
`DEFINE_VA_INSTR(VSBC,     VA_FORMAT, ARITHMETIC, RVV, {VVM, VXM})
`DEFINE_VA_INSTR(VMSBC,    VA_FORMAT, ARITHMETIC, RVV, {VVM, VXM, VV, VX})
`DEFINE_VA_INSTR(VAND,     VA_FORMAT, ARITHMETIC, RVV, {VV, VX, VI})
`DEFINE_VA_INSTR(VOR,      VA_FORMAT, ARITHMETIC, RVV, {VV, VX, VI})
`DEFINE_VA_INSTR(VXOR,     VA_FORMAT, ARITHMETIC, RVV, {VV, VX, VI})
`DEFINE_VA_INSTR(VSLL,     VA_FORMAT, SHIFT, RVV, {VV, VX, VI})
`DEFINE_VA_INSTR(VSRL,     VA_FORMAT, SHIFT, RVV, {VV, VX, VI})
`DEFINE_VA_INSTR(VSRA,     VA_FORMAT, SHIFT, RVV, {VV, VX, VI})
`DEFINE_VA_INSTR(VNSRL,    VA_FORMAT, SHIFT, RVV, {WV, WX, WI})
`DEFINE_VA_INSTR(VNSRA,    VA_FORMAT, SHIFT, RVV, {WV, WX, WI})
`DEFINE_VA_INSTR(VMSEQ,    VA_FORMAT, COMPARE, RVV, {VV, VX, VI})
`DEFINE_VA_INSTR(VMSNE,    VA_FORMAT, COMPARE, RVV, {VV, VX, VI})
`DEFINE_VA_INSTR(VMSLTU,   VA_FORMAT, COMPARE, RVV, {VV, VX})
`DEFINE_VA_INSTR(VMSLT,    VA_FORMAT, COMPARE, RVV, {VV, VX})
`DEFINE_VA_INSTR(VMSLEU,   VA_FORMAT, COMPARE, RVV, {VV, VX, VI})
`DEFINE_VA_INSTR(VMSLE,    VA_FORMAT, COMPARE, RVV, {VV, VX, VI})
`DEFINE_VA_INSTR(VMSGTU,   VA_FORMAT, COMPARE, RVV, {VX, VI})
`DEFINE_VA_INSTR(VMSGT,    VA_FORMAT, COMPARE, RVV, {VX, VI})
`DEFINE_VA_INSTR(VMINU,    VA_FORMAT, ARITHMETIC, RVV, {VV, VX})
`DEFINE_VA_INSTR(VMIN,     VA_FORMAT, ARITHMETIC, RVV, {VV, VX})
`DEFINE_VA_INSTR(VMAXU,    VA_FORMAT, ARITHMETIC, RVV, {VV, VX})
`DEFINE_VA_INSTR(VMAX,     VA_FORMAT, ARITHMETIC, RVV, {VV, VX})
`DEFINE_VA_INSTR(VMUL,     VA_FORMAT, ARITHMETIC, RVV, {VV, VX})
`DEFINE_VA_INSTR(VMULH,    VA_FORMAT, ARITHMETIC, RVV, {VV, VX})
`DEFINE_VA_INSTR(VMULHU,   VA_FORMAT, ARITHMETIC, RVV, {VV, VX})
`DEFINE_VA_INSTR(VMULHSU,  VA_FORMAT, ARITHMETIC, RVV, {VV, VX})
`DEFINE_VA_INSTR(VDIVU,    VA_FORMAT, ARITHMETIC, RVV, {VV, VX})
`DEFINE_VA_INSTR(VDIV,     VA_FORMAT, ARITHMETIC, RVV, {VV, VX})
`DEFINE_VA_INSTR(VREMU,    VA_FORMAT, ARITHMETIC, RVV, {VV, VX})
`DEFINE_VA_INSTR(VREM,     VA_FORMAT, ARITHMETIC, RVV, {VV, VX})
`DEFINE_VA_INSTR(VWMUL,    VA_FORMAT, ARITHMETIC, RVV, {VV, VX})
`DEFINE_VA_INSTR(VWMULU,   VA_FORMAT, ARITHMETIC, RVV, {VV, VX})
`DEFINE_VA_INSTR(VWMULSU,  VA_FORMAT, ARITHMETIC, RVV, {VV, VX})
`DEFINE_VA_INSTR(VMACC,    VA_FORMAT, ARITHMETIC, RVV, {VV, VX})
`DEFINE_VA_INSTR(VNMSAC,   VA_FORMAT, ARITHMETIC, RVV, {VV, VX})
`DEFINE_VA_INSTR(VMADD,    VA_FORMAT, ARITHMETIC, RVV, {VV, VX})
`DEFINE_VA_INSTR(VNMSUB,   VA_FORMAT, ARITHMETIC, RVV, {VV, VX})
`DEFINE_VA_INSTR(VWMACCU,  VA_FORMAT, ARITHMETIC, RVV, {VV, VX})
`DEFINE_VA_INSTR(VWMACC,   VA_FORMAT, ARITHMETIC, RVV, {VV, VX})
`DEFINE_VA_INSTR(VWMACCSU, VA_FORMAT, ARITHMETIC, RVV, {VV, VX})
`DEFINE_VA_INSTR(VWMACCUS, VA_FORMAT, ARITHMETIC, RVV, {VX})
/* Quad widening is not yet supported
`DEFINE_VA_INSTR(VQMACCU,  VA_FORMAT, ARITHMETIC, RVV, {VV, VX})
`DEFINE_VA_INSTR(VQMACC,   VA_FORMAT, ARITHMETIC, RVV, {VV, VX})
`DEFINE_VA_INSTR(VQMACCSU, VA_FORMAT, ARITHMETIC, RVV, {VV, VX})
`DEFINE_VA_INSTR(VQMACCUS, VA_FORMAT, ARITHMETIC, RVV, {VX})
*/
`DEFINE_VA_INSTR(VMERGE,   VA_FORMAT, ARITHMETIC, RVV, {VVM, VXM, VIM})
`DEFINE_VA_INSTR(VMV,      VA_FORMAT, ARITHMETIC, RVV, {VV, VX, VI})

// Vector Fixed-Point Arithmetic Instructions
`DEFINE_VA_INSTR(VSADDU,   VA_FORMAT, ARITHMETIC, RVV, {VV, VX, VI})
`DEFINE_VA_INSTR(VSADD,    VA_FORMAT, ARITHMETIC, RVV, {VV, VX, VI})
`DEFINE_VA_INSTR(VSSUBU,   VA_FORMAT, ARITHMETIC, RVV, {VV, VX})
`DEFINE_VA_INSTR(VSSUB,    VA_FORMAT, ARITHMETIC, RVV, {VV, VX})
`DEFINE_VA_INSTR(VAADDU,   VA_FORMAT, ARITHMETIC, RVV, {VV, VX})
`DEFINE_VA_INSTR(VAADD,    VA_FORMAT, ARITHMETIC, RVV, {VV, VX})
`DEFINE_VA_INSTR(VASUBU,   VA_FORMAT, ARITHMETIC, RVV, {VV, VX})
`DEFINE_VA_INSTR(VASUB,    VA_FORMAT, ARITHMETIC, RVV, {VV, VX})
`DEFINE_VA_INSTR(VSMUL,    VA_FORMAT, ARITHMETIC, RVV, {VV, VX})
`DEFINE_VA_INSTR(VSSRL,    VA_FORMAT, SHIFT, RVV, {VV, VX, VI})
`DEFINE_VA_INSTR(VSSRA,    VA_FORMAT, SHIFT, RVV, {VV, VX, VI})
`DEFINE_VA_INSTR(VNCLIPU,  VA_FORMAT, ARITHMETIC, RVV, {WV, WX, WI})
`DEFINE_VA_INSTR(VNCLIP,   VA_FORMAT, ARITHMETIC, RVV, {WV, WX, WI})

// Vector Floating-Point Instructions
`DEFINE_VA_INSTR(VFADD,    VA_FORMAT, ARITHMETIC, RVV, {VV, VF})
`DEFINE_VA_INSTR(VFSUB,    VA_FORMAT, ARITHMETIC, RVV, {VV, VF})
`DEFINE_VA_INSTR(VFRSUB,   VA_FORMAT, ARITHMETIC, RVV, {VF})
`DEFINE_VA_INSTR(VFWADD,   VA_FORMAT, ARITHMETIC, RVV, {VV, VF, WV, WF})
`DEFINE_VA_INSTR(VFWSUB,   VA_FORMAT, ARITHMETIC, RVV, {VV, VF, WV, WF})
`DEFINE_VA_INSTR(VFMUL,    VA_FORMAT, ARITHMETIC, RVV, {VV, VF})
`DEFINE_VA_INSTR(VFDIV,    VA_FORMAT, ARITHMETIC, RVV, {VV, VF})
`DEFINE_VA_INSTR(VFRDIV,   VA_FORMAT, ARITHMETIC, RVV, {VF})
`DEFINE_VA_INSTR(VFWMUL,   VA_FORMAT, ARITHMETIC, RVV, {VV, VF})
`DEFINE_VA_INSTR(VFMACC,   VA_FORMAT, ARITHMETIC, RVV, {VV, VF})
`DEFINE_VA_INSTR(VFNMACC,  VA_FORMAT, ARITHMETIC, RVV, {VV, VF})
`DEFINE_VA_INSTR(VFMSAC,   VA_FORMAT, ARITHMETIC, RVV, {VV, VF})
`DEFINE_VA_INSTR(VFNMSAC,  VA_FORMAT, ARITHMETIC, RVV, {VV, VF})
`DEFINE_VA_INSTR(VFMADD,   VA_FORMAT, ARITHMETIC, RVV, {VV, VF})
`DEFINE_VA_INSTR(VFNMADD,  VA_FORMAT, ARITHMETIC, RVV, {VV, VF})
`DEFINE_VA_INSTR(VFMSUB,   VA_FORMAT, ARITHMETIC, RVV, {VV, VF})
`DEFINE_VA_INSTR(VFNMSUB,  VA_FORMAT, ARITHMETIC, RVV, {VV, VF})
`DEFINE_VA_INSTR(VFWMACC,  VA_FORMAT, ARITHMETIC, RVV, {VV, VF})
`DEFINE_VA_INSTR(VFWNMACC, VA_FORMAT, ARITHMETIC, RVV, {VV, VF})
`DEFINE_VA_INSTR(VFWMSAC,  VA_FORMAT, ARITHMETIC, RVV, {VV, VF})
`DEFINE_VA_INSTR(VFWNMSAC, VA_FORMAT, ARITHMETIC, RVV, {VV, VF})
`DEFINE_VA_INSTR(VFSQRT_V, VS2_FORMAT, ARITHMETIC, RVV)
`DEFINE_VA_INSTR(VFRSQRT7_V, VS2_FORMAT, ARITHMETIC, RVV)
`DEFINE_VA_INSTR(VFREC7_V, VS2_FORMAT, ARITHMETIC, RVV)
`DEFINE_VA_INSTR(VFMIN,    VA_FORMAT, ARITHMETIC, RVV, {VV, VF})
`DEFINE_VA_INSTR(VFMAX,    VA_FORMAT, ARITHMETIC, RVV, {VV, VF})
`DEFINE_VA_INSTR(VFSGNJ,   VA_FORMAT, ARITHMETIC, RVV, {VV, VF})
`DEFINE_VA_INSTR(VFSGNJN,  VA_FORMAT, ARITHMETIC, RVV, {VV, VF})
`DEFINE_VA_INSTR(VFSGNJX,  VA_FORMAT, ARITHMETIC, RVV, {VV, VF})
`DEFINE_VA_INSTR(VMFEQ,    VA_FORMAT, COMPARE, RVV, {VV, VF})
`DEFINE_VA_INSTR(VMFNE,    VA_FORMAT, COMPARE, RVV, {VV, VF})
`DEFINE_VA_INSTR(VMFLT,    VA_FORMAT, COMPARE, RVV, {VV, VF})
`DEFINE_VA_INSTR(VMFLE,    VA_FORMAT, COMPARE, RVV, {VV, VF})
`DEFINE_VA_INSTR(VMFGT,    VA_FORMAT, COMPARE, RVV, {VF})
`DEFINE_VA_INSTR(VMFGE,    VA_FORMAT, COMPARE, RVV, {VF})
`DEFINE_VA_INSTR(VFCLASS_V,VS2_FORMAT, COMPARE, RVV)
`DEFINE_VA_INSTR(VFMERGE,  VA_FORMAT, ARITHMETIC, RVV, {VFM})
`DEFINE_VA_INSTR(VFMV,     VA_FORMAT, ARITHMETIC, RVV, {VF})

// Vector conversion instructions
`DEFINE_VA_INSTR(VFCVT_XU_F_V,     VS2_FORMAT, ARITHMETIC, RVV)
`DEFINE_VA_INSTR(VFCVT_X_F_V,      VS2_FORMAT, ARITHMETIC, RVV)
`DEFINE_VA_INSTR(VFCVT_RTZ_XU_F_V,      VS2_FORMAT, ARITHMETIC, RVV)
`DEFINE_VA_INSTR(VFCVT_RTZ_X_F_V,      VS2_FORMAT, ARITHMETIC, RVV)
`DEFINE_VA_INSTR(VFCVT_F_XU_V,     VS2_FORMAT, ARITHMETIC, RVV)
`DEFINE_VA_INSTR(VFCVT_F_X_V,      VS2_FORMAT, ARITHMETIC, RVV)
`DEFINE_VA_INSTR(VFWCVT_XU_F_V,    VS2_FORMAT, ARITHMETIC, RVV)
`DEFINE_VA_INSTR(VFWCVT_X_F_V,     VS2_FORMAT, ARITHMETIC, RVV)
`DEFINE_VA_INSTR(VFWCVT_RTZ_XU_F_V,    VS2_FORMAT, ARITHMETIC, RVV)
`DEFINE_VA_INSTR(VFWCVT_RTZ_X_F_V,    VS2_FORMAT, ARITHMETIC, RVV)
`DEFINE_VA_INSTR(VFWCVT_F_XU_V,    VS2_FORMAT, ARITHMETIC, RVV)
`DEFINE_VA_INSTR(VFWCVT_F_X_V,     VS2_FORMAT, ARITHMETIC, RVV)
`DEFINE_VA_INSTR(VFWCVT_F_F_V,     VS2_FORMAT, ARITHMETIC, RVV)
`DEFINE_VA_INSTR(VFNCVT_XU_F_W,    VS2_FORMAT, ARITHMETIC, RVV)
`DEFINE_VA_INSTR(VFNCVT_X_F_W,     VS2_FORMAT, ARITHMETIC, RVV)
`DEFINE_VA_INSTR(VFNCVT_F_XU_W,    VS2_FORMAT, ARITHMETIC, RVV)
`DEFINE_VA_INSTR(VFNCVT_F_X_W,     VS2_FORMAT, ARITHMETIC, RVV)
`DEFINE_VA_INSTR(VFNCVT_F_F_W,     VS2_FORMAT, ARITHMETIC, RVV)
`DEFINE_VA_INSTR(VFNCVT_ROD_F_F_W, VS2_FORMAT, ARITHMETIC, RVV)

// Vector reduction instruction
`DEFINE_VA_INSTR(VREDSUM_VS,    VA_FORMAT, ARITHMETIC, RVV)
`DEFINE_VA_INSTR(VREDMAXU_VS,   VA_FORMAT, ARITHMETIC, RVV)
`DEFINE_VA_INSTR(VREDMAX_VS,    VA_FORMAT, ARITHMETIC, RVV)
`DEFINE_VA_INSTR(VREDMINU_VS,   VA_FORMAT, ARITHMETIC, RVV)
`DEFINE_VA_INSTR(VREDMIN_VS,    VA_FORMAT, ARITHMETIC, RVV)
`DEFINE_VA_INSTR(VREDAND_VS,    VA_FORMAT, ARITHMETIC, RVV)
`DEFINE_VA_INSTR(VREDOR_VS,     VA_FORMAT, ARITHMETIC, RVV)
`DEFINE_VA_INSTR(VREDXOR_VS,    VA_FORMAT, ARITHMETIC, RVV)
`DEFINE_VA_INSTR(VWREDSUMU_VS,  VA_FORMAT, ARITHMETIC, RVV)
`DEFINE_VA_INSTR(VWREDSUM_VS,   VA_FORMAT, ARITHMETIC, RVV)
`DEFINE_VA_INSTR(VFREDOSUM_VS,  VA_FORMAT, ARITHMETIC, RVV)
`DEFINE_VA_INSTR(VFREDUSUM_VS,   VA_FORMAT, ARITHMETIC, RVV)
`DEFINE_VA_INSTR(VFREDMAX_VS,   VA_FORMAT, ARITHMETIC, RVV)
`DEFINE_VA_INSTR(VFREDMIN_VS,   VA_FORMAT, ARITHMETIC, RVV)
`DEFINE_VA_INSTR(VFWREDOSUM_VS, VA_FORMAT, ARITHMETIC, RVV)
`DEFINE_VA_INSTR(VFWREDUSUM_VS,  VA_FORMAT, ARITHMETIC, RVV)

// Vector mask instruction
`DEFINE_VA_INSTR(VMAND_MM,    VA_FORMAT, ARITHMETIC, RVV)
`DEFINE_VA_INSTR(VMNAND_MM,   VA_FORMAT, ARITHMETIC, RVV)
`DEFINE_VA_INSTR(VMANDN_MM, VA_FORMAT, ARITHMETIC, RVV)
`DEFINE_VA_INSTR(VMXOR_MM,    VA_FORMAT, ARITHMETIC, RVV)
`DEFINE_VA_INSTR(VMOR_MM,     VA_FORMAT, ARITHMETIC, RVV)
`DEFINE_VA_INSTR(VMNOR_MM,    VA_FORMAT, ARITHMETIC, RVV)
`DEFINE_VA_INSTR(VMORN_MM,  VA_FORMAT, ARITHMETIC, RVV)
`DEFINE_VA_INSTR(VMXNOR_MM,   VA_FORMAT, ARITHMETIC, RVV)

`DEFINE_VA_INSTR(VPOPC_M,   VS2_FORMAT, ARITHMETIC, RVV)
`DEFINE_VA_INSTR(VFIRST_M,  VS2_FORMAT, ARITHMETIC, RVV)
`DEFINE_VA_INSTR(VMSBF_M,   VS2_FORMAT, ARITHMETIC, RVV)
`DEFINE_VA_INSTR(VMSIF_M,   VS2_FORMAT, ARITHMETIC, RVV)
`DEFINE_VA_INSTR(VMSOF_M,   VS2_FORMAT, ARITHMETIC, RVV)
`DEFINE_VA_INSTR(VIOTA_M,   VS2_FORMAT, ARITHMETIC, RVV)
`DEFINE_VA_INSTR(VID_V,     VS2_FORMAT, ARITHMETIC, RVV)

// Vector permutation instruction
`DEFINE_VA_INSTR(VMV_X_S,  VA_FORMAT, ARITHMETIC, RVV)
`DEFINE_VA_INSTR(VMV_S_X,  VA_FORMAT, ARITHMETIC, RVV)
`DEFINE_VA_INSTR(VFMV_F_S, VA_FORMAT, ARITHMETIC, RVV)
`DEFINE_VA_INSTR(VFMV_S_F, VA_FORMAT, ARITHMETIC, RVV)

`DEFINE_VA_INSTR(VSLIDEUP,    VA_FORMAT, ARITHMETIC, RVV, {VI,VX})
`DEFINE_VA_INSTR(VSLIDEDOWN,  VA_FORMAT, ARITHMETIC, RVV, {VI,VX})
`DEFINE_VA_INSTR(VSLIDE1UP,   VA_FORMAT, ARITHMETIC, RVV, {VX})
`DEFINE_VA_INSTR(VFSLIDE1UP,   VA_FORMAT, ARITHMETIC, RVV, {VF})
`DEFINE_VA_INSTR(VSLIDE1DOWN, VA_FORMAT, ARITHMETIC, RVV, {VX})
`DEFINE_VA_INSTR(VFSLIDE1DOWN, VA_FORMAT, ARITHMETIC, RVV, {VF})
`DEFINE_VA_INSTR(VRGATHER,    VA_FORMAT, ARITHMETIC, RVV, {VV,VX,VI})
`DEFINE_VA_INSTR(VRGATHEREI16,  VA_FORMAT, ARITHMETIC, RVV, {VV})
`DEFINE_VA_INSTR(VCOMPRESS,   VA_FORMAT, ARITHMETIC, RVV, {VM})

`DEFINE_VA_INSTR(VMV1R_V, VS2_FORMAT, ARITHMETIC, RVV)
`DEFINE_VA_INSTR(VMV2R_V, VS2_FORMAT, ARITHMETIC, RVV)
`DEFINE_VA_INSTR(VMV4R_V, VS2_FORMAT, ARITHMETIC, RVV)
`DEFINE_VA_INSTR(VMV8R_V, VS2_FORMAT, ARITHMETIC, RVV)

// -------------------------------------------------------------------------
//  Section 7. Vector Loads and Stores
// -------------------------------------------------------------------------
// Section 7.4 - Vector Unit-Stride Instructions
`DEFINE_VA_INSTR(VLE_V, VL_FORMAT, LOAD, RVV)
`DEFINE_VA_INSTR(VSE_V, VS_FORMAT, STORE, RVV)
`DEFINE_VA_INSTR(VLM_V, VL_FORMAT, LOAD, RVV)
`DEFINE_VA_INSTR(VSM_V, VS_FORMAT, STORE, RVV)
// Section 7.5 - Vector Strided Instructions
`DEFINE_VA_INSTR(VLSE_V, VLS_FORMAT, LOAD, RVV)
`DEFINE_VA_INSTR(VSSE_V, VSS_FORMAT, STORE, RVV)
// Section 7.6 - Vector Indexed Instructions
`DEFINE_VA_INSTR(VLUXEI_V, VLX_FORMAT, LOAD, RVV)
`DEFINE_VA_INSTR(VLOXEI_V, VLX_FORMAT, LOAD, RVV)
`DEFINE_VA_INSTR(VSUXEI_V, VSX_FORMAT, STORE, RVV)
`DEFINE_VA_INSTR(VSOXEI_V, VSX_FORMAT, STORE, RVV)
// Section 7.7 - Vector Unit-Stride Fault-Only-First Loads
`DEFINE_VA_INSTR(VLEFF_V, VL_FORMAT, LOAD, RVV)
// Section 7.8 - Vector Load/Store Segment Instructions (Zvlsseg)
// 7.8.1. Vector Unit Strided Segment Loads and Stores
`DEFINE_VA_INSTR(VLSEGE_V, VL_FORMAT, LOAD, RVV, {}, "zvlsseg")
`DEFINE_VA_INSTR(VSSEGE_V, VS_FORMAT, STORE, RVV, {}, "zvlsseg")
`DEFINE_VA_INSTR(VLSEGEFF_V, VL_FORMAT, LOAD, RVV, {}, "zvlsseg")
// 7.8.2. Vector Strided Segment Loads and Stores
`DEFINE_VA_INSTR(VLSSEGE_V, VLS_FORMAT, LOAD, RVV, {}, "zvlsseg")
`DEFINE_VA_INSTR(VSSSEGE_V, VSS_FORMAT, STORE, RVV, {}, "zvlsseg")
// 7.8.3. Vector Indexed Segment Loads and Stores
`DEFINE_VA_INSTR(VLUXSEGEI_V, VLX_FORMAT, LOAD, RVV, {}, "zvlsseg")
`DEFINE_VA_INSTR(VLOXSEGEI_V, VLX_FORMAT, LOAD, RVV, {}, "zvlsseg")
`DEFINE_VA_INSTR(VSUXSEGEI_V, VSX_FORMAT, STORE, RVV, {}, "zvlsseg")
`DEFINE_VA_INSTR(VSOXSEGEI_V, VSX_FORMAT, STORE, RVV, {}, "zvlsseg")
// Section 7.9 - Vector Load/Store Whole Register Instructions
`DEFINE_VA_INSTR(VLRE_V, VL_FORMAT, LOAD, RVV, {}, "zvlsseg")
`DEFINE_VA_INSTR(VSR_V, VS_FORMAT, STORE, RVV, {}, "zvlsseg")
// -------------------------------------------------------------------------
//  Section 8. Vector AMO Operations (Zvamo)
// -------------------------------------------------------------------------
// EEW vector AMOs
//`DEFINE_VA_INSTR(VAMOSWAPE_V, VAMO_FORMAT, AMO, RVV, {}, "zvamo")
//`DEFINE_VA_INSTR(VAMOADDE_V, VAMO_FORMAT, AMO, RVV, {}, "zvamo")
//`DEFINE_VA_INSTR(VAMOXORE_V, VAMO_FORMAT, AMO, RVV, {}, "zvamo")
//`DEFINE_VA_INSTR(VAMOANDE_V, VAMO_FORMAT, AMO, RVV, {}, "zvamo")
//`DEFINE_VA_INSTR(VAMOORE_V, VAMO_FORMAT, AMO, RVV, {}, "zvamo")
//`DEFINE_VA_INSTR(VAMOMINE_V, VAMO_FORMAT, AMO, RVV, {}, "zvamo")
//`DEFINE_VA_INSTR(VAMOMAXE_V, VAMO_FORMAT, AMO, RVV, {}, "zvamo")
//`DEFINE_VA_INSTR(VAMOMINUE_V, VAMO_FORMAT, AMO, RVV, {}, "zvamo")
//`DEFINE_VA_INSTR(VAMOMAXUE_V, VAMO_FORMAT, AMO, RVV, {}, "zvamo")
