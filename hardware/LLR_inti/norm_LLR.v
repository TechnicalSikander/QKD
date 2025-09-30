//module norm_LLR#(
//    parameter WIDTH = 32,   // bit-width of each input
//    parameter N     = 64    // number of inputs (must be power of 2)
//)(
//    input  wire [WIDTH-1:0] L0,  L1,  L2,  L3,  L4,  L5,  L6,  L7,  
//L8,  L9,  L10, L11, L12, L13, L14, L15,  
//L16, L17, L18, L19, L20, L21, L22, L23,  
//L24, L25, L26, L27, L28, L29, L30, L31,  
//L32, L33, L34, L35, L36, L37, L38, L39,  
//L40, L41, L42, L43, L44, L45, L46, L47,  
//L48, L49, L50, L51, L52, L53, L54, L55,  
//L56, L57, L58, L59, L60, L61, L62, L63,

//    output wire [$clog2(N)-1:0] min_idx,
//    output wire [WIDTH-1:0] min_val
//);
//    // Declare array
//    wire [WIDTH-1:0] L [0:N-1];

//    // Map individual signals into array
//    assign L[0]  = L0;
//    assign L[1]  = L1;
//    assign L[2]  = L2;
//    assign L[3]  = L3;
//    assign L[4]  = L4;
//    assign L[5]  = L5;
//    assign L[6]  = L6;
//    assign L[7]  = L7;
//    assign L[8]  = L8;
//    assign L[9]  = L9;
//    assign L[10] = L10;
//    assign L[11] = L11;
//    assign L[12] = L12;
//    assign L[13] = L13;
//    assign L[14] = L14;
//    assign L[15] = L15;
//    assign L[16] = L16;
//    assign L[17] = L17;
//    assign L[18] = L18;
//    assign L[19] = L19;
//    assign L[20] = L20;
//    assign L[21] = L21;
//    assign L[22] = L22;
//    assign L[23] = L23;
//    assign L[24] = L24;
//    assign L[25] = L25;
//    assign L[26] = L26;
//    assign L[27] = L27;
//    assign L[28] = L28;
//    assign L[29] = L29;
//    assign L[30] = L30;
//    assign L[31] = L31;
//    assign L[32] = L32;
//    assign L[33] = L33;
//    assign L[34] = L34;
//    assign L[35] = L35;
//    assign L[36] = L36;
//    assign L[37] = L37;
//    assign L[38] = L38;
//    assign L[39] = L39;
//    assign L[40] = L40;
//    assign L[41] = L41;
//    assign L[42] = L42;
//    assign L[43] = L43;
//    assign L[44] = L44;
//    assign L[45] = L45;
//    assign L[46] = L46;
//    assign L[47] = L47;
//    assign L[48] = L48;
//    assign L[49] = L49;
//    assign L[50] = L50;
//    assign L[51] = L51;
//    assign L[52] = L52;
//    assign L[53] = L53;
//    assign L[54] = L54;
//    assign L[55] = L55;
//    assign L[56] = L56;
//    assign L[57] = L57;
//    assign L[58] = L58;
//    assign L[59] = L59;
//    assign L[60] = L60;
//    assign L[61] = L61;
//    assign L[62] = L62;
//    assign L[63] = L63;

//    // -------------------------
//    // Stage 0: Initialize pairs
//    // -------------------------
//    wire [WIDTH-1:0] val_stage0 [0:N/2-1];
//    wire [$clog2(N)-1:0] idx_stage0 [0:N/2-1];

    
//    genvar i;
//    generate
//        for (genvar i = 0; i < N/2; i = i + 1) begin : stage0
//            assign {val_stage0[i], idx_stage0[i]} =
//                (L[2*i] <= L[2*i+1]) ? {L[2*i],   i*2} :
//                                        {L[2*i+1], i*2+1};
//        end
//    endgenerate

//    // -------------------------
//    // Stage 1: 32 -> 16
//    // -------------------------
//    wire [WIDTH-1:0] val_stage1 [0:N/4-1];
//    wire [$clog2(N)-1:0] idx_stage1 [0:N/4-1];

//    generate
//        for (i = 0; i < N/4; i = i + 1) begin : stage1
//            assign {val_stage1[i], idx_stage1[i]} =
//                (val_stage0[2*i] <= val_stage0[2*i+1]) ? {val_stage0[2*i],   idx_stage0[2*i]} :
//                                                          {val_stage0[2*i+1], idx_stage0[2*i+1]};
//        end
//    endgenerate

//    // -------------------------
//    // Stage 2: 16 -> 8
//    // -------------------------
//    wire [WIDTH-1:0] val_stage2 [0:N/8-1];
//    wire [$clog2(N)-1:0] idx_stage2 [0:N/8-1];

//    generate
//        for (i = 0; i < N/8; i = i + 1) begin : stage2
//            assign {val_stage2[i], idx_stage2[i]} =
//                (val_stage1[2*i] <= val_stage1[2*i+1]) ? {val_stage1[2*i],   idx_stage1[2*i]} :
//                                                          {val_stage1[2*i+1], idx_stage1[2*i+1]};
//        end
//    endgenerate

//    // -------------------------
//    // Stage 3: 8 -> 4
//    // -------------------------
//    wire [WIDTH-1:0] val_stage3 [0:N/16-1];
//    wire [$clog2(N)-1:0] idx_stage3 [0:N/16-1];

//    generate
//        for (i = 0; i < N/16; i = i + 1) begin : stage3
//            assign {val_stage3[i], idx_stage3[i]} =
//                (val_stage2[2*i] <= val_stage2[2*i+1]) ? {val_stage2[2*i],   idx_stage2[2*i]} :
//                                                          {val_stage2[2*i+1], idx_stage2[2*i+1]};
//        end
//    endgenerate

//    // -------------------------
//    // Stage 4: 4 -> 2
//    // -------------------------
//    wire [WIDTH-1:0] val_stage4 [0:N/32-1];
//    wire [$clog2(N)-1:0] idx_stage4 [0:N/32-1];

//    generate
//        for (i = 0; i < N/32; i = i + 1) begin : stage4
//            assign {val_stage4[i], idx_stage4[i]} =
//                (val_stage3[2*i] <= val_stage3[2*i+1]) ? {val_stage3[2*i],   idx_stage3[2*i]} :
//                                                          {val_stage3[2*i+1], idx_stage3[2*i+1]};
//        end
//    endgenerate

//    // -------------------------
//    // Stage 5: 2 -> 1 (final)
//    // -------------------------
//    wire [WIDTH-1:0] val_stage5;
//    wire [$clog2(N)-1:0] idx_stage5;

//    assign {val_stage5, idx_stage5} =
//        (val_stage4[0] <= val_stage4[1]) ? {val_stage4[0], idx_stage4[0]} :
//                                           {val_stage4[1], idx_stage4[1]};

//    // -------------------------
//    // Outputs
//    // -------------------------
//    assign min_val = val_stage5;
//    assign min_idx = idx_stage5;

//endmodule




module norm_LLR#(
    parameter WIDTH = 32,   // bit-width of each input
    parameter N     = 64    // number of inputs (must be power of 2)
)(
    input  wire [WIDTH-1:0] L0,  L1,  L2,  L3,  L4,  L5,  L6,  L7,  
L8,  L9,  L10, L11, L12, L13, L14, L15,  
L16, L17, L18, L19, L20, L21, L22, L23,  
L24, L25, L26, L27, L28, L29, L30, L31,  
L32, L33, L34, L35, L36, L37, L38, L39,  
L40, L41, L42, L43, L44, L45, L46, L47,  
L48, L49, L50, L51, L52, L53, L54, L55,  
L56, L57, L58, L59, L60, L61, L62, L63,

    output wire [$clog2(N)-1:0] min_idx,
    output wire [WIDTH-1:0] min_val,
    
    output  wire [WIDTH-1:0] Ls0,  Ls1,  Ls2,  Ls3,  Ls4,  Ls5,  Ls6,  Ls7,  
Ls8,  Ls9,  Ls10, Ls11, Ls12, Ls13, Ls14, Ls15,  
Ls16, Ls17, Ls18, Ls19, Ls20, Ls21, Ls22, Ls23,  
Ls24, Ls25, Ls26, Ls27, Ls28, Ls29, Ls30, Ls31,  
Ls32, Ls33, Ls34, Ls35, Ls36, Ls37, Ls38, Ls39,  
Ls40, Ls41, Ls42, Ls43, Ls44, Ls45, Ls46, Ls47,  
Ls48, Ls49, Ls50, Ls51, Ls52, Ls53, Ls54, Ls55,  
Ls56, Ls57, Ls58, Ls59, Ls60, Ls61, Ls62, Ls63
);
    // Declare array
    wire [WIDTH-1:0] L [0:N-1];

    // Map individual signals into array
    assign L[0]  = L0;
    assign L[1]  = L1;
    assign L[2]  = L2;
    assign L[3]  = L3;
    assign L[4]  = L4;
    assign L[5]  = L5;
    assign L[6]  = L6;
    assign L[7]  = L7;
    assign L[8]  = L8;
    assign L[9]  = L9;
    assign L[10] = L10;
    assign L[11] = L11;
    assign L[12] = L12;
    assign L[13] = L13;
    assign L[14] = L14;
    assign L[15] = L15;
    assign L[16] = L16;
    assign L[17] = L17;
    assign L[18] = L18;
    assign L[19] = L19;
    assign L[20] = L20;
    assign L[21] = L21;
    assign L[22] = L22;
    assign L[23] = L23;
    assign L[24] = L24;
    assign L[25] = L25;
    assign L[26] = L26;
    assign L[27] = L27;
    assign L[28] = L28;
    assign L[29] = L29;
    assign L[30] = L30;
    assign L[31] = L31;
    assign L[32] = L32;
    assign L[33] = L33;
    assign L[34] = L34;
    assign L[35] = L35;
    assign L[36] = L36;
    assign L[37] = L37;
    assign L[38] = L38;
    assign L[39] = L39;
    assign L[40] = L40;
    assign L[41] = L41;
    assign L[42] = L42;
    assign L[43] = L43;
    assign L[44] = L44;
    assign L[45] = L45;
    assign L[46] = L46;
    assign L[47] = L47;
    assign L[48] = L48;
    assign L[49] = L49;
    assign L[50] = L50;
    assign L[51] = L51;
    assign L[52] = L52;
    assign L[53] = L53;
    assign L[54] = L54;
    assign L[55] = L55;
    assign L[56] = L56;
    assign L[57] = L57;
    assign L[58] = L58;
    assign L[59] = L59;
    assign L[60] = L60;
    assign L[61] = L61;
    assign L[62] = L62;
    assign L[63] = L63;

    // -------------------------
    // Stage 0: Initialize pairs
    // -------------------------
    wire [WIDTH-1:0] val_stage0 [0:N/2-1];
    wire [$clog2(N)-1:0] idx_stage0 [0:N/2-1];

    
    genvar i;
    generate
        for (genvar i = 0; i < N/2; i = i + 1) begin : stage0
            assign val_stage0[i] =
                (L[2*i] <= L[2*i+1]) ? L[2*i] :
                                        L[2*i+1];
            assign  idx_stage0[i] =
                (L[2*i] <= L[2*i+1]) ?  i*2:
                                        i*2+1;
        end
    endgenerate

    // -------------------------
    // Stage 1: 32 -> 16
    // -------------------------
    wire [WIDTH-1:0] val_stage1 [0:N/4-1];
    wire [$clog2(N)-1:0] idx_stage1 [0:N/4-1];

    generate
        for (i = 0; i < N/4; i = i + 1) begin : stage1
            assign {val_stage1[i], idx_stage1[i]} =
                (val_stage0[2*i] <= val_stage0[2*i+1]) ? {val_stage0[2*i],   idx_stage0[2*i]} :
                                                          {val_stage0[2*i+1], idx_stage0[2*i+1]};
        end
    endgenerate

    // -------------------------
    // Stage 2: 16 -> 8
    // -------------------------
    wire [WIDTH-1:0] val_stage2 [0:N/8-1];
    wire [$clog2(N)-1:0] idx_stage2 [0:N/8-1];

    generate
        for (i = 0; i < N/8; i = i + 1) begin : stage2
            assign {val_stage2[i], idx_stage2[i]} =
                (val_stage1[2*i] <= val_stage1[2*i+1]) ? {val_stage1[2*i],   idx_stage1[2*i]} :
                                                          {val_stage1[2*i+1], idx_stage1[2*i+1]};
        end
    endgenerate

    // -------------------------
    // Stage 3: 8 -> 4
    // -------------------------
    wire [WIDTH-1:0] val_stage3 [0:N/16-1];
    wire [$clog2(N)-1:0] idx_stage3 [0:N/16-1];

    generate
        for (i = 0; i < N/16; i = i + 1) begin : stage3
            assign {val_stage3[i], idx_stage3[i]} =
                (val_stage2[2*i] <= val_stage2[2*i+1]) ? {val_stage2[2*i],   idx_stage2[2*i]} :
                                                          {val_stage2[2*i+1], idx_stage2[2*i+1]};
        end
    endgenerate

    // -------------------------
    // Stage 4: 4 -> 2
    // -------------------------
    wire [WIDTH-1:0] val_stage4 [0:N/32-1];
    wire [$clog2(N)-1:0] idx_stage4 [0:N/32-1];

    generate
        for (i = 0; i < N/32; i = i + 1) begin : stage4
            assign {val_stage4[i], idx_stage4[i]} =
                (val_stage3[2*i] <= val_stage3[2*i+1]) ? {val_stage3[2*i],   idx_stage3[2*i]} :
                                                          {val_stage3[2*i+1], idx_stage3[2*i+1]};
        end
    endgenerate

    // -------------------------
    // Stage 5: 2 -> 1 (final)
    // -------------------------
    wire [WIDTH-1:0] val_stage5;
    wire [$clog2(N)-1:0] idx_stage5;

    assign {val_stage5, idx_stage5} =
        (val_stage4[0] <= val_stage4[1]) ? {val_stage4[0], idx_stage4[0]} :
                                           {val_stage4[1], idx_stage4[1]};

    // -------------------------
    // Outputs
    // -------------------------
    assign min_val = val_stage5;
    assign min_idx = idx_stage5;
    
    assign{Ls0,  Ls1,  Ls2,  Ls3,  Ls4,  Ls5,  Ls6,  Ls7,  
Ls8,  Ls9,  Ls10, Ls11, Ls12, Ls13, Ls14, Ls15,  
Ls16, Ls17, Ls18, Ls19, Ls20, Ls21, Ls22, Ls23,  
Ls24, Ls25, Ls26, Ls27, Ls28, Ls29, Ls30, Ls31,  
Ls32, Ls33, Ls34, Ls35, Ls36, Ls37, Ls38, Ls39,  
Ls40, Ls41, Ls42, Ls43, Ls44, Ls45, Ls46, Ls47,  
Ls48, Ls49, Ls50, Ls51, Ls52, Ls53, Ls54, Ls55,  
Ls56, Ls57, Ls58, Ls59, Ls60, Ls61, Ls62, Ls63}={L0,  L1,  L2,  L3,  L4,  L5,  L6,  L7,  
L8,  L9,  L10, L11, L12, L13, L14, L15,  
L16, L17, L18, L19, L20, L21, L22, L23,  
L24, L25, L26, L27, L28, L29, L30, L31,  
L32, L33, L34, L35, L36, L37, L38, L39,  
L40, L41, L42, L43, L44, L45, L46, L47,  
L48, L49, L50, L51, L52, L53, L54, L55,  
L56, L57, L58, L59, L60, L61, L62, L63}-{min_val,min_val,min_val,min_val,min_val,min_val,min_val,min_val,min_val,min_val,min_val,min_val,min_val,min_val,min_val,min_val,
min_val,min_val,min_val,min_val,min_val,min_val,min_val,min_val,min_val,min_val,min_val,min_val,min_val,min_val,min_val,min_val,
min_val,min_val,min_val,min_val,min_val,min_val,min_val,min_val,min_val,min_val,min_val,min_val,min_val,min_val,min_val,min_val,
min_val,min_val,min_val,min_val,min_val,min_val,min_val,min_val,min_val,min_val,min_val,min_val,min_val,min_val,min_val,min_val};

endmodule
