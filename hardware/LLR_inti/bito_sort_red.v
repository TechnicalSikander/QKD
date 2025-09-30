`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: Mohammad Sikander Sheikh
// 
// Create Date: 26.09.2025 19:05:29
// Design Name: 
// Module Name: bito_sort_red
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module bito_sort_red#(
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
// output   wire [N-1:0] val_stage3,
// output   wire [$clog2(N)-1:0] idx_stage3,

output wire [WIDTH-1:0] o0, o1, o2, o3, 
//o4, o5, o6, o7, o8, o9,
//                        o10, o11, o12, o13, o14, o15, o16, o17, o18, o19,
//                        o20, o21, o22, o23, o24, o25, o26, o27, o28, o29,
//                        o30, o31, o32, o33, o34, o35, o36, o37, o38, o39,
//                        o40, o41, o42, o43, o44, o45, o46, o47, o48, o49,
//                        o50, o51, o52, o53, o54, o55, o56, o57, o58, o59,
//                        o60, o61, o62, o63,

output wire [5:0] id0, id1, id2, id3
//, id4, id5, id6, id7, id8, id9,
//                  id10, id11, id12, id13, id14, id15, id16, id17, id18, id19,
//                  id20, id21, id22, id23, id24, id25, id26, id27, id28, id29,
//                  id30, id31, id32, id33, id34, id35, id36, id37, id38, id39,
//                  id40, id41, id42, id43, id44, id45, id46, id47, id48, id49,
//                  id50, id51, id52, id53, id54, id55, id56, id57, id58, id59,
//                  id60, id61, id62, id63
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
    wire [WIDTH-1:0] val_stage0 [0:N-1];
    wire [$clog2(N)-1:0] idx_stage0 [0:N-1];

    
    genvar i;
    generate
        for (i = 0; i < N/4; i = i+1) begin : stage0
            assign val_stage0[4*i] =
                (L[4*i] <= L[4*i+1]) ? L[4*i+1] :
                                        L[4*i];
            assign  idx_stage0[4*i] =
                (L[4*i] <= L[4*i+1]) ?  i*4+1:
                                        i*4;
            assign val_stage0[4*i+1] =
                (L[4*i] <= L[4*i+1]) ?  L[4*i]:
                                        L[4*i+1];
            assign  idx_stage0[4*i+1] =
                (L[4*i] <= L[4*i+1]) ? i*4 :
                                        i*4+1;
            assign val_stage0[4*i+2] =
                (L[4*i+2] <= L[4*i+2+1]) ? L[4*i+2] :
                                       L[4*i+2+1] ;
            assign  idx_stage0[4*i+2] =
                (L[4*i+2] <= L[4*i+2+1]) ?  4*i+2:
                                        4*i+2+1;
            assign val_stage0[4*i+2+1] =
                (L[4*i+2] <= L[4*i+2+1]) ?  L[4*i+2+1]:
                                        L[4*i+2];
            assign  idx_stage0[4*i+2+1] =
                (L[4*i+2] <= L[4*i+2+1]) ? 4*i+2+1 :
                                       4*i+2;          

        end
    endgenerate
    
  
    // -------------------------
    // Stage 1: 64 -> 64
    // -------------------------
    wire [WIDTH-1:0] val_stage1 [0:N-1];
    wire [$clog2(N)-1:0] idx_stage1 [0:N-1];
    generate
       for (i = 0; i < N/8; i = i + 1) begin : stage1
           assign {val_stage1[8*i], idx_stage1[8*i],val_stage1[8*i+2], idx_stage1[8*i+2]} =
                (val_stage0[8*i] <= val_stage0[8*i+2]) ? {val_stage0[8*i+2],   idx_stage0[8*i+2],val_stage0[8*i], idx_stage0[8*i]} :
                                                          {val_stage0[8*i], idx_stage0[8*i],val_stage0[8*i+2],   idx_stage0[8*i+2]};
           assign {val_stage1[8*i+1], idx_stage1[8*i+1],val_stage1[8*i+3], idx_stage1[8*i+3]} =
                (val_stage0[8*i+1] <= val_stage0[8*i+3]) ? {val_stage0[8*i+3],   idx_stage0[8*i+3],val_stage0[8*i+1], idx_stage0[8*i+1]} :
                                                          {val_stage0[8*i+1], idx_stage0[8*i+1],val_stage0[8*i+3],   idx_stage0[8*i+3]};
           assign {val_stage1[8*i+4], idx_stage1[8*i+4],val_stage1[8*i+6], idx_stage1[8*i+6]} =
                (val_stage0[8*i+4] <= val_stage0[8*i+6]) ? {val_stage0[8*i+4], idx_stage0[8*i+4],val_stage0[8*i+6],   idx_stage0[8*i+6]}:
                 {val_stage0[8*i+6],   idx_stage0[8*i+6],val_stage0[8*i+4], idx_stage0[8*i+4]} ;
           assign {val_stage1[8*i+5], idx_stage1[8*i+5],val_stage1[8*i+7], idx_stage1[8*i+7]} =
                (val_stage0[8*i+5] <= val_stage0[8*i+7]) ? {val_stage0[8*i+5], idx_stage0[8*i+5],val_stage0[8*i+7],   idx_stage0[8*i+7]}:
                 {val_stage0[8*i+7],   idx_stage0[8*i+7],val_stage0[8*i+5], idx_stage0[8*i+5]} ;
                       
        end
    endgenerate

    // -------------------------
    // Stage 2: 64 -> 64
    // -------------------------
    wire [WIDTH-1:0] val_stage2 [0:N-1];
    wire [$clog2(N)-1:0] idx_stage2 [0:N-1];

    generate
        for (i = 0; i < N/8; i = i + 1) begin : stage2
          assign {val_stage2[8*i], idx_stage2[8*i],val_stage2[8*i+1], idx_stage2[8*i+1]} =
                (val_stage1[8*i] <= val_stage1[8*i+1]) ? {val_stage1[8*i+1],   idx_stage1[8*i+1],val_stage1[8*i], idx_stage1[8*i]} :
                                                          {val_stage1[8*i], idx_stage1[8*i],val_stage1[8*i+1],   idx_stage1[8*i+1]};
          assign {val_stage2[8*i+2], idx_stage2[8*i+2],val_stage2[8*i+3], idx_stage2[8*i+3]} =
                (val_stage1[8*i+2] <= val_stage1[8*i+3]) ? {val_stage1[8*i+3],   idx_stage1[8*i+3],val_stage1[8*i+2], idx_stage1[8*i+2]} :
                                                          {val_stage1[8*i+2], idx_stage1[8*i+2],val_stage1[8*i+3],   idx_stage1[8*i+3]};
          assign {val_stage2[8*i+4], idx_stage2[8*i+4],val_stage2[8*i+5], idx_stage2[8*i+5]} =
                (val_stage1[8*i+4] <= val_stage1[8*i+5]) ? {val_stage1[8*i+4],   idx_stage1[8*i+4],val_stage1[8*i+5], idx_stage1[8*i+5]} :
                                                          {val_stage1[8*i+5], idx_stage1[8*i+5],val_stage1[8*i+4],   idx_stage1[8*i+4]};
          assign {val_stage2[8*i+6], idx_stage2[8*i+6],val_stage2[8*i+7], idx_stage2[8*i+7]} =
                (val_stage1[8*i+6] <= val_stage1[8*i+7]) ? {val_stage1[8*i+6],   idx_stage1[8*i+6],val_stage1[8*i+7], idx_stage1[8*i+7]} :
                                                          {val_stage1[8*i+7], idx_stage1[8*i+7],val_stage1[8*i+6],   idx_stage1[8*i+6]};
        end
    endgenerate


    // -------------------------
    // Stage 3: 64 -> 32
    // -------------------------
    wire [WIDTH-1:0] val_stage3 [0:N/2-1];
    wire [$clog2(N)-1:0] idx_stage3 [0:N/2-1];

    generate
        for (i = 0; i < N/16; i = i + 1) begin : stage3
            assign {val_stage3[i], idx_stage3[i]} =
                (val_stage2[i] <= val_stage2[i+N/16]) ? {val_stage2[i],   idx_stage2[i]} :
                                                          {val_stage2[i+N/16], idx_stage2[i+N/16]};
            assign {val_stage3[i+N/16], idx_stage3[i+N/16]} =
                (val_stage2[i+N/8] <= val_stage2[i+N/8+N/16]) ? {val_stage2[i+N/8],   idx_stage2[i+N/8]} :
                                                          {val_stage2[i+N/8+N/16], idx_stage2[i+N/8+N/16]};
         assign {val_stage3[i+N/8], idx_stage3[i+N/8]} =
                (val_stage2[i+N/4] <= val_stage2[i+N/4+N/16]) ? {val_stage2[i+N/4],   idx_stage2[i+N/4]} :
                                                          {val_stage2[i+N/4+N/16], idx_stage2[i+N/4+N/16]};
        assign {val_stage3[i+12], idx_stage3[i+12]} =
                (val_stage2[i+24] <= val_stage2[i+24+N/16]) ? {val_stage2[i+24],   idx_stage2[i+24]} :
                                                          {val_stage2[i+24+N/16], idx_stage2[i+24+N/16]};
       assign {val_stage3[i+N/4], idx_stage3[i+N/4]} =
                (val_stage2[i+N/2] <= val_stage2[i+N/2+N/16]) ? {val_stage2[i+N/2],   idx_stage2[i+N/2]} :
                                                          {val_stage2[i+N/2+N/16], idx_stage2[i+N/2+N/16]};                                                  
       assign {val_stage3[i+20], idx_stage3[i+20]} =
                (val_stage2[i+40] <= val_stage2[i+40+N/16]) ? {val_stage2[i+40],   idx_stage2[i+40]} :
                                                          {val_stage2[i+40+N/16], idx_stage2[i+40+N/16]}; 
      assign {val_stage3[i+24], idx_stage3[i+24]} =
                (val_stage2[i+48] <= val_stage2[i+48+N/16]) ? {val_stage2[i+48],   idx_stage2[i+48]} :
                                                          {val_stage2[i+48+N/16], idx_stage2[i+48+N/16]}; 
     assign {val_stage3[i+28], idx_stage3[i+28]} =
                (val_stage2[i+56] <= val_stage2[i+56+N/16]) ? {val_stage2[i+56],   idx_stage2[i+56]} :
                                                          {val_stage2[i+56+N/16], idx_stage2[i+56+N/16]}; 
        end
    endgenerate

    // -------------------------
    // Stage 4: 32 -> 32
    // -------------------------
    wire [WIDTH-1:0] val_stage4 [0:N/2-1];
    wire [$clog2(N)-1:0] idx_stage4 [0:N/2-1];
    generate
       for (i = 0; i < N/16; i = i + 1) begin : stage4
           assign {val_stage4[8*i], idx_stage4[8*i],val_stage4[8*i+2], idx_stage4[8*i+2]} =
                (val_stage3[8*i] <= val_stage3[8*i+2]) ? {val_stage3[8*i+2],   idx_stage3[8*i+2],val_stage3[8*i], idx_stage3[8*i]} :
                                                          {val_stage3[8*i], idx_stage3[8*i],val_stage3[8*i+2],   idx_stage3[8*i+2]};
           assign {val_stage4[8*i+1], idx_stage4[8*i+1],val_stage4[8*i+3], idx_stage4[8*i+3]} =
                (val_stage3[8*i+1] <= val_stage3[8*i+3]) ? {val_stage3[8*i+3],   idx_stage3[8*i+3],val_stage3[8*i+1], idx_stage3[8*i+1]} :
                                                          {val_stage3[8*i+1], idx_stage3[8*i+1],val_stage3[8*i+3],   idx_stage3[8*i+3]};
           assign {val_stage4[8*i+4], idx_stage4[8*i+4],val_stage4[8*i+6], idx_stage4[8*i+6]} =
                (val_stage3[8*i+4] <= val_stage3[8*i+6]) ? {val_stage3[8*i+4], idx_stage3[8*i+4],val_stage3[8*i+6],   idx_stage3[8*i+6]}:
                 {val_stage3[8*i+6],   idx_stage3[8*i+6],val_stage3[8*i+4], idx_stage3[8*i+4]} ;
           assign {val_stage4[8*i+5], idx_stage4[8*i+5],val_stage4[8*i+7], idx_stage4[8*i+7]} =
                (val_stage3[8*i+5] <= val_stage3[8*i+7]) ? {val_stage3[8*i+5], idx_stage3[8*i+5],val_stage3[8*i+7],   idx_stage3[8*i+7]}:
                 {val_stage3[8*i+7],   idx_stage3[8*i+7],val_stage3[8*i+5], idx_stage3[8*i+5]} ;
                       
        end
    endgenerate

    // -------------------------
    // Stage 5: 32 -> 32
    // -------------------------
    wire [WIDTH-1:0] val_stage5 [0:N/2-1];
    wire [$clog2(N)-1:0] idx_stage5 [0:N/2-1];

    generate
        for (i = 0; i < N/16; i = i + 1) begin : stage5
          assign {val_stage5[8*i], idx_stage5[8*i],val_stage5[8*i+1], idx_stage5[8*i+1]} =
                (val_stage4[8*i] <= val_stage4[8*i+1]) ? {val_stage4[8*i+1],   idx_stage4[8*i+1],val_stage4[8*i], idx_stage4[8*i]} :
                                                          {val_stage4[8*i], idx_stage4[8*i],val_stage4[8*i+1],   idx_stage4[8*i+1]};
          assign {val_stage5[8*i+2], idx_stage5[8*i+2],val_stage5[8*i+3], idx_stage5[8*i+3]} =
                (val_stage4[8*i+2] <= val_stage4[8*i+3]) ? {val_stage4[8*i+3],   idx_stage4[8*i+3],val_stage4[8*i+2], idx_stage4[8*i+2]} :
                                                          {val_stage4[8*i+2], idx_stage4[8*i+2],val_stage4[8*i+3],   idx_stage4[8*i+3]};
          assign {val_stage5[8*i+4], idx_stage5[8*i+4],val_stage5[8*i+5], idx_stage5[8*i+5]} =
                (val_stage4[8*i+4] <= val_stage4[8*i+5]) ? {val_stage4[8*i+4],   idx_stage4[8*i+4],val_stage4[8*i+5], idx_stage4[8*i+5]} :
                                                          {val_stage4[8*i+5], idx_stage4[8*i+5],val_stage4[8*i+4],   idx_stage4[8*i+4]};
          assign {val_stage5[8*i+6], idx_stage5[8*i+6],val_stage5[8*i+7], idx_stage5[8*i+7]} =
                (val_stage4[8*i+6] <= val_stage4[8*i+7]) ? {val_stage4[8*i+6],   idx_stage4[8*i+6],val_stage4[8*i+7], idx_stage4[8*i+7]} :
                                                          {val_stage4[8*i+7], idx_stage4[8*i+7],val_stage4[8*i+6],   idx_stage4[8*i+6]};
        end
    endgenerate

    // -------------------------
    // Stage 6: 32 -> 16
    // -------------------------
    wire [WIDTH-1:0] val_stage6 [0:N/4-1];
    wire [$clog2(N)-1:0] idx_stage6 [0:N/4-1];

    generate
        for (i = 0; i < N/16; i = i + 1) begin : stage6
            assign {val_stage6[i], idx_stage6[i]} =
                (val_stage5[i] <= val_stage5[i+N/16]) ? {val_stage5[i],   idx_stage5[i]} :
                                                          {val_stage5[i+N/16], idx_stage5[i+N/16]};
            assign {val_stage6[i+N/16], idx_stage6[i+N/16]} =
                (val_stage5[i+N/8] <= val_stage5[i+N/8+N/16]) ? {val_stage5[i+N/8],   idx_stage5[i+N/8]} :
                                                          {val_stage5[i+N/8+N/16], idx_stage5[i+N/8+N/16]};
         assign {val_stage6[i+N/8], idx_stage6[i+N/8]} =
                (val_stage5[i+N/4] <= val_stage5[i+N/4+N/16]) ? {val_stage5[i+N/4],   idx_stage5[i+N/4]} :
                                                          {val_stage5[i+N/4+N/16], idx_stage5[i+N/4+N/16]};
        assign {val_stage6[i+12], idx_stage6[i+12]} =
                (val_stage5[i+24] <= val_stage5[i+24+N/16]) ? {val_stage5[i+24],   idx_stage5[i+24]} :
                                                          {val_stage5[i+24+N/16], idx_stage5[i+24+N/16]};
       
        end
    endgenerate
    
        // -------------------------
    // Stage 7: 16 -> 16
    // -------------------------
    wire [WIDTH-1:0] val_stage7 [0:N/4-1];
    wire [$clog2(N)-1:0] idx_stage7 [0:N/4-1];
    generate
       for (i = 0; i < N/32; i = i + 1) begin : stage7
           assign {val_stage7[8*i], idx_stage7[8*i],val_stage7[8*i+2], idx_stage7[8*i+2]} =
                (val_stage6[8*i] <= val_stage6[8*i+2]) ? {val_stage6[8*i+2],   idx_stage6[8*i+2],val_stage6[8*i], idx_stage6[8*i]} :
                                                          {val_stage6[8*i], idx_stage6[8*i],val_stage6[8*i+2],   idx_stage6[8*i+2]};
           assign {val_stage7[8*i+1], idx_stage7[8*i+1],val_stage7[8*i+3], idx_stage7[8*i+3]} =
                (val_stage6[8*i+1] <= val_stage6[8*i+3]) ? {val_stage6[8*i+3],   idx_stage6[8*i+3],val_stage6[8*i+1], idx_stage6[8*i+1]} :
                                                          {val_stage6[8*i+1], idx_stage6[8*i+1],val_stage6[8*i+3],   idx_stage6[8*i+3]};
           assign {val_stage7[8*i+4], idx_stage7[8*i+4],val_stage7[8*i+6], idx_stage7[8*i+6]} =
                (val_stage6[8*i+4] <= val_stage6[8*i+6]) ? {val_stage6[8*i+4], idx_stage6[8*i+4],val_stage6[8*i+6],   idx_stage6[8*i+6]}:
                 {val_stage6[8*i+6],   idx_stage6[8*i+6],val_stage6[8*i+4], idx_stage6[8*i+4]} ;
           assign {val_stage7[8*i+5], idx_stage7[8*i+5],val_stage7[8*i+7], idx_stage7[8*i+7]} =
                (val_stage6[8*i+5] <= val_stage6[8*i+7]) ? {val_stage6[8*i+5], idx_stage6[8*i+5],val_stage6[8*i+7],   idx_stage6[8*i+7]}:
                 {val_stage6[8*i+7],   idx_stage6[8*i+7],val_stage6[8*i+5], idx_stage6[8*i+5]} ;
                       
        end
    endgenerate

    // -------------------------
    // Stage 8: 16 -> 16
    // -------------------------
    wire [WIDTH-1:0] val_stage8 [0:N/4-1];
    wire [$clog2(N)-1:0] idx_stage8 [0:N/4-1];

    generate
        for (i = 0; i < N/32; i = i + 1) begin : stage8
          assign {val_stage8[8*i], idx_stage8[8*i],val_stage8[8*i+1], idx_stage8[8*i+1]} =
                (val_stage7[8*i] <= val_stage7[8*i+1]) ? {val_stage7[8*i+1],   idx_stage7[8*i+1],val_stage7[8*i], idx_stage7[8*i]} :
                                                          {val_stage7[8*i], idx_stage7[8*i],val_stage7[8*i+1],   idx_stage7[8*i+1]};
          assign {val_stage8[8*i+2], idx_stage8[8*i+2],val_stage8[8*i+3], idx_stage8[8*i+3]} =
                (val_stage7[8*i+2] <= val_stage7[8*i+3]) ? {val_stage7[8*i+3],   idx_stage7[8*i+3],val_stage7[8*i+2], idx_stage7[8*i+2]} :
                                                          {val_stage7[8*i+2], idx_stage7[8*i+2],val_stage7[8*i+3],   idx_stage7[8*i+3]};
          assign {val_stage8[8*i+4], idx_stage8[8*i+4],val_stage8[8*i+5], idx_stage8[8*i+5]} =
                (val_stage7[8*i+4] <= val_stage7[8*i+5]) ? {val_stage7[8*i+4],   idx_stage7[8*i+4],val_stage7[8*i+5], idx_stage7[8*i+5]} :
                                                          {val_stage7[8*i+5], idx_stage7[8*i+5],val_stage7[8*i+4],   idx_stage7[8*i+4]};
          assign {val_stage8[8*i+6], idx_stage8[8*i+6],val_stage8[8*i+7], idx_stage8[8*i+7]} =
                (val_stage7[8*i+6] <= val_stage7[8*i+7]) ? {val_stage7[8*i+6],   idx_stage7[8*i+6],val_stage7[8*i+7], idx_stage7[8*i+7]} :
                                                          {val_stage7[8*i+7], idx_stage7[8*i+7],val_stage7[8*i+6],   idx_stage7[8*i+6]};
        end
    endgenerate

    // -------------------------
    // Stage 9: 16 -> 8
    // -------------------------
    wire [WIDTH-1:0] val_stage9 [0:N/8-1];
    wire [$clog2(N)-1:0] idx_stage9 [0:N/8-1];

    generate
        for (i = 0; i < N/16; i = i + 1) begin : stage9
            assign {val_stage9[i], idx_stage9[i]} =
                (val_stage8[i] <= val_stage8[i+N/16]) ? {val_stage8[i],   idx_stage8[i]} :
                                                          {val_stage8[i+N/16], idx_stage8[i+N/16]};
            assign {val_stage9[i+N/16], idx_stage9[i+N/16]} =
                (val_stage8[i+N/8] <= val_stage8[i+N/8+N/16]) ? {val_stage8[i+N/8],   idx_stage8[i+N/8]} :
                                                          {val_stage8[i+N/8+N/16], idx_stage8[i+N/8+N/16]};
        
       
        end
    endgenerate
    
    
     // -------------------------
    // Stage 10: 8 -> 8
    // -------------------------
    wire [WIDTH-1:0] val_stage10 [0:N/8-1];
    wire [$clog2(N)-1:0] idx_stage10 [0:N/8-1];
    generate
       for (i = 0; i < N/64; i = i + 1) begin : stage10
           assign {val_stage10[8*i], idx_stage10[8*i],val_stage10[8*i+2], idx_stage10[8*i+2]} =
                (val_stage9[8*i] <= val_stage9[8*i+2]) ? {val_stage9[8*i+2],   idx_stage9[8*i+2],val_stage9[8*i], idx_stage9[8*i]} :
                                                          {val_stage9[8*i], idx_stage9[8*i],val_stage9[8*i+2],   idx_stage9[8*i+2]};
           assign {val_stage10[8*i+1], idx_stage10[8*i+1],val_stage10[8*i+3], idx_stage10[8*i+3]} =
                (val_stage9[8*i+1] <= val_stage9[8*i+3]) ? {val_stage9[8*i+3],   idx_stage9[8*i+3],val_stage9[8*i+1], idx_stage9[8*i+1]} :
                                                          {val_stage9[8*i+1], idx_stage9[8*i+1],val_stage9[8*i+3],   idx_stage9[8*i+3]};
           assign {val_stage10[8*i+4], idx_stage10[8*i+4],val_stage10[8*i+6], idx_stage10[8*i+6]} =
                (val_stage9[8*i+4] <= val_stage9[8*i+6]) ? {val_stage9[8*i+4], idx_stage9[8*i+4],val_stage9[8*i+6],idx_stage9[8*i+6]}:
                 {val_stage9[8*i+6], idx_stage9[8*i+6],val_stage9[8*i+4], idx_stage9[8*i+4]} ;
           assign {val_stage10[8*i+5], idx_stage10[8*i+5],val_stage10[8*i+7], idx_stage10[8*i+7]} =
                (val_stage9[8*i+5] <= val_stage9[8*i+7]) ? {val_stage9[8*i+5], idx_stage9[8*i+5],val_stage9[8*i+7],   idx_stage9[8*i+7]}:
                 {val_stage9[8*i+7],   idx_stage9[8*i+7],val_stage9[8*i+5], idx_stage9[8*i+5]} ;
                       
        end
    endgenerate

    // -------------------------
    // Stage 11: 8 -> 8
    // -------------------------
    wire [WIDTH-1:0] val_stage11 [0:N/8-1];
    wire [$clog2(N)-1:0] idx_stage11 [0:N/8-1];

    generate
        for (i = 0; i < N/64; i = i + 1) begin : stage11
          assign {val_stage11[8*i], idx_stage11[8*i],val_stage11[8*i+1], idx_stage11[8*i+1]} =
                (val_stage10[8*i] <= val_stage10[8*i+1]) ? {val_stage10[8*i+1],   idx_stage10[8*i+1],val_stage10[8*i], idx_stage10[8*i]} :
                                                          {val_stage10[8*i], idx_stage10[8*i],val_stage10[8*i+1],idx_stage10[8*i+1]};
          assign {val_stage11[8*i+2], idx_stage11[8*i+2],val_stage11[8*i+3], idx_stage11[8*i+3]} =
                (val_stage10[8*i+2] <= val_stage10[8*i+3]) ? {val_stage10[8*i+3],   idx_stage10[8*i+3],val_stage10[8*i+2], idx_stage10[8*i+2]} :
                                                          {val_stage10[8*i+2], idx_stage10[8*i+2],val_stage10[8*i+3],idx_stage10[8*i+3]};
          assign {val_stage11[8*i+4], idx_stage11[8*i+4],val_stage11[8*i+5], idx_stage11[8*i+5]} =
                (val_stage10[8*i+4] <= val_stage10[8*i+5]) ? {val_stage10[8*i+4],   idx_stage10[8*i+4],val_stage10[8*i+5],idx_stage10[8*i+5]} :
                                                          {val_stage10[8*i+5], idx_stage10[8*i+5],val_stage10[8*i+4],idx_stage10[8*i+4]};
          assign {val_stage11[8*i+6], idx_stage11[8*i+6],val_stage11[8*i+7], idx_stage11[8*i+7]} =
                (val_stage10[8*i+6] <= val_stage10[8*i+7]) ? {val_stage10[8*i+6],   idx_stage10[8*i+6],val_stage10[8*i+7],idx_stage10[8*i+7]} :
                                                          {val_stage10[8*i+7], idx_stage10[8*i+7],val_stage10[8*i+6],idx_stage10[8*i+6]};
        end
    endgenerate

    // -------------------------
    // Stage 12: 8 -> 4
    // -------------------------
    wire [WIDTH-1:0] val_stage12 [0:N/8-1];
    wire [$clog2(N)-1:0] idx_stage12 [0:N/8-1];

    generate
        for (i = 0; i < N/16; i = i + 1) begin : stage12
            assign {val_stage12[i], idx_stage12[i]} =
                (val_stage11[i] <= val_stage11[i+N/16]) ? {val_stage11[i],   idx_stage11[i]} :
                                                          {val_stage11[i+N/16], idx_stage11[i+N/16]};
       
        end
    endgenerate
    
         // -------------------------
    // Stage 13: 4 -> 4
    // -------------------------
    wire [WIDTH-1:0] val_stage13 [0:N/8-1];
    wire [$clog2(N)-1:0] idx_stage13 [0:N/8-1];
    generate
       for (i = 0; i < N/64; i = i + 1) begin : stage13
           assign {val_stage13[8*i], idx_stage13[8*i],val_stage13[8*i+2], idx_stage13[8*i+2]} =
                (val_stage12[8*i] <= val_stage12[8*i+2]) ?{val_stage12[8*i],idx_stage12[8*i],val_stage12[8*i+2],idx_stage12[8*i+2]}:
                 {val_stage12[8*i+2], idx_stage12[8*i+2],val_stage12[8*i],idx_stage12[8*i]};
           assign {val_stage13[8*i+1],idx_stage13[8*i+1],val_stage13[8*i+3],idx_stage13[8*i+3]} =
                (val_stage12[8*i+1] <= val_stage12[8*i+3]) ?{val_stage12[8*i+1], idx_stage12[8*i+1],val_stage12[8*i+3],idx_stage12[8*i+3]}:
                 {val_stage12[8*i+3],idx_stage12[8*i+3],val_stage12[8*i+1], idx_stage12[8*i+1]};
                                
        end
    endgenerate

    // -------------------------
    // Stage 14: 4 -> 4
    // -------------------------
    wire [WIDTH-1:0] val_stage14 [0:N/8-1];
    wire [$clog2(N)-1:0] idx_stage14 [0:N/8-1];

    generate
        for (i = 0; i < N/64; i = i + 1) begin : stage14
          assign {val_stage14[8*i], idx_stage14[8*i],val_stage14[8*i+1], idx_stage14[8*i+1]} =
                (val_stage13[8*i] <= val_stage13[8*i+1]) ?{val_stage13[8*i], idx_stage13[8*i],val_stage13[8*i+1],idx_stage13[8*i+1]}:
                 {val_stage13[8*i+1],   idx_stage13[8*i+1],val_stage13[8*i], idx_stage13[8*i]};
          assign {val_stage14[8*i+2], idx_stage14[8*i+2],val_stage14[8*i+3], idx_stage14[8*i+3]} =
                (val_stage13[8*i+2] <= val_stage13[8*i+3]) ? {val_stage13[8*i+2], idx_stage13[8*i+2],val_stage13[8*i+3],idx_stage13[8*i+3]}:
                {val_stage13[8*i+3],idx_stage13[8*i+3],val_stage13[8*i+2],idx_stage13[8*i+2]};
       
        end
    endgenerate
    // -------------------------
    // Outputs
    // -------------------------
assign o0  = val_stage14[0];
assign o1  = val_stage14[1];
assign o2  = val_stage14[2];
assign o3  = val_stage14[3];
//assign o4  = val_stage3[4];
//assign o5  = val_stage3[5];
//assign o6  = val_stage3[6];
//assign o7  = val_stage3[7];
//assign o8  = val_stage3[8];
//assign o9  = val_stage3[9];
//assign o10 = val_stage3[10];
//assign o11 = val_stage3[11];
//assign o12 = val_stage3[12];
//assign o13 = val_stage3[13];
//assign o14 = val_stage3[14];
//assign o15 = val_stage3[15];
//assign o16 = val_stage3[16];
//assign o17 = val_stage3[17];
//assign o18 = val_stage3[18];
//assign o19 = val_stage3[19];
//assign o20 = val_stage3[20];
//assign o21 = val_stage3[21];
//assign o22 = val_stage3[22];
//assign o23 = val_stage3[23];
//assign o24 = val_stage3[24];
//assign o25 = val_stage3[25];
//assign o26 = val_stage3[26];
//assign o27 = val_stage3[27];
//assign o28 = val_stage3[28];
//assign o29 = val_stage3[29];
//assign o30 = val_stage3[30];
//assign o31 = val_stage3[31];
//assign o32 = val_stage3[32];
//assign o33 = val_stage3[33];
//assign o34 = val_stage3[34];
//assign o35 = val_stage3[35];
//assign o36 = val_stage3[36];
//assign o37 = val_stage3[37];
//assign o38 = val_stage3[38];
//assign o39 = val_stage3[39];
//assign o40 = val_stage3[40];
//assign o41 = val_stage3[41];
//assign o42 = val_stage3[42];
//assign o43 = val_stage3[43];
//assign o44 = val_stage3[44];
//assign o45 = val_stage3[45];
//assign o46 = val_stage3[46];
//assign o47 = val_stage3[47];
//assign o48 = val_stage3[48];
//assign o49 = val_stage3[49];
//assign o50 = val_stage3[50];
//assign o51 = val_stage3[51];
//assign o52 = val_stage3[52];
//assign o53 = val_stage3[53];
//assign o54 = val_stage3[54];
//assign o55 = val_stage3[55];
//assign o56 = val_stage3[56];
//assign o57 = val_stage3[57];
//assign o58 = val_stage3[58];
//assign o59 = val_stage3[59];
//assign o60 = val_stage3[60];
//assign o61 = val_stage3[61];
//assign o62 = val_stage3[62];
//assign o63 = val_stage3[63];

assign id0  = idx_stage14[0];
assign id1  = idx_stage14[1];
assign id2  = idx_stage14[2];
assign id3  = idx_stage14[3];
//assign id4  = idx_stage3[4];
//assign id5  = idx_stage3[5];
//assign id6  = idx_stage3[6];
//assign id7  = idx_stage3[7];
//assign id8  = idx_stage3[8];
//assign id9  = idx_stage3[9];
//assign id10 = idx_stage3[10];
//assign id11 = idx_stage3[11];
//assign id12 = idx_stage3[12];
//assign id13 = idx_stage3[13];
//assign id14 = idx_stage3[14];
//assign id15 = idx_stage3[15];
//assign id16 = idx_stage3[16];
//assign id17 = idx_stage3[17];
//assign id18 = idx_stage3[18];
//assign id19 = idx_stage3[19];
//assign id20 = idx_stage3[20];
//assign id21 = idx_stage3[21];
//assign id22 = idx_stage3[22];
//assign id23 = idx_stage3[23];
//assign id24 = idx_stage3[24];
//assign id25 = idx_stage3[25];
//assign id26 = idx_stage3[26];
//assign id27 = idx_stage3[27];
//assign id28 = idx_stage3[28];
//assign id29 = idx_stage3[29];
//assign id30 = idx_stage3[30];
//assign id31 = idx_stage3[31];
//assign id32 = idx_stage3[32];
//assign id33 = idx_stage3[33];
//assign id34 = idx_stage3[34];
//assign id35 = idx_stage3[35];
//assign id36 = idx_stage3[36];
//assign id37 = idx_stage3[37];
//assign id38 = idx_stage3[38];
//assign id39 = idx_stage3[39];
//assign id40 = idx_stage3[40];
//assign id41 = idx_stage3[41];
//assign id42 = idx_stage3[42];
//assign id43 = idx_stage3[43];
//assign id44 = idx_stage3[44];
//assign id45 = idx_stage3[45];
//assign id46 = idx_stage3[46];
//assign id47 = idx_stage3[47];
//assign id48 = idx_stage3[48];
//assign id49 = idx_stage3[49];
//assign id50 = idx_stage3[50];
//assign id51 = idx_stage3[51];
//assign id52 = idx_stage3[52];
//assign id53 = idx_stage3[53];
//assign id54 = idx_stage3[54];
//assign id55 = idx_stage3[55];
//assign id56 = idx_stage3[56];
//assign id57 = idx_stage3[57];
//assign id58 = idx_stage3[58];
//assign id59 = idx_stage3[59];
//assign id60 = idx_stage3[60];
//assign id61 = idx_stage3[61];
//assign id62 = idx_stage3[62];
//assign id63 = idx_stage3[63];

    
endmodule

