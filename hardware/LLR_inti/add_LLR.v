`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 26.09.2025 17:01:20
// Design Name: 
// Module Name: add_LLR
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


module add_LLR#(
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

input  wire [WIDTH-1:0] c0,  c1,  c2,  c3,  c4,  c5,  c6,  c7,  
c8,  c9,  c10, c11, c12, c13, c14, c15,  
c16, c17, c18, c19, c20, c21, c22, c23,  
c24, c25, c26, c27, c28, c29, c30, c31,  
c32, c33, c34, c35, c36, c37, c38, c39,  
c40, c41, c42, c43, c44, c45, c46, c47,  
c48, c49, c50, c51, c52, c53, c54, c55,  
c56, c57, c58, c59, c60, c61, c62, c63,

output  wire [WIDTH-1:0] Ls0,  Ls1,  Ls2,  Ls3,  Ls4,  Ls5,  Ls6,  Ls7,  
Ls8,  Ls9,  Ls10, Ls11, Ls12, Ls13, Ls14, Ls15,  
Ls16, Ls17, Ls18, Ls19, Ls20, Ls21, Ls22, Ls23,  
Ls24, Ls25, Ls26, Ls27, Ls28, Ls29, Ls30, Ls31,  
Ls32, Ls33, Ls34, Ls35, Ls36, Ls37, Ls38, Ls39,  
Ls40, Ls41, Ls42, Ls43, Ls44, Ls45, Ls46, Ls47,  
Ls48, Ls49, Ls50, Ls51, Ls52, Ls53, Ls54, Ls55,  
Ls56, Ls57, Ls58, Ls59, Ls60, Ls61, Ls62, Ls63
);

assign {Ls0,  Ls1,  Ls2,  Ls3,  Ls4,  Ls5,  Ls6,  Ls7,  
Ls8,  Ls9,  Ls10, Ls11, Ls12, Ls13, Ls14, Ls15,  
Ls16, Ls17, Ls18, Ls19, Ls20, Ls21, Ls22, Ls23,  
Ls24, Ls25, Ls26, Ls27, Ls28, Ls29, Ls30, Ls31,  
Ls32, Ls33, Ls34, Ls35, Ls36, Ls37, Ls38, Ls39,  
Ls40, Ls41, Ls42, Ls43, Ls44, Ls45, Ls46, Ls47,  
Ls48, Ls49, Ls50, Ls51, Ls52, Ls53, Ls54, Ls55,  
Ls56, Ls57, Ls58, Ls59, Ls60, Ls61, Ls62, Ls63}={c0,  c1,  c2,  c3,  c4,  c5,  c6,  c7,  
c8,  c9,  c10, c11, c12, c13, c14, c15,  
c16, c17, c18, c19, c20, c21, c22, c23,  
c24, c25, c26, c27, c28, c29, c30, c31,  
c32, c33, c34, c35, c36, c37, c38, c39,  
c40, c41, c42, c43, c44, c45, c46, c47,  
c48, c49, c50, c51, c52, c53, c54, c55,  
c56, c57, c58, c59, c60, c61, c62, c63}+{L0,  L1,  L2,  L3,  L4,  L5,  L6,  L7,  
L8,  L9,  L10, L11, L12, L13, L14, L15,  
L16, L17, L18, L19, L20, L21, L22, L23,  
L24, L25, L26, L27, L28, L29, L30, L31,  
L32, L33, L34, L35, L36, L37, L38, L39,  
L40, L41, L42, L43, L44, L45, L46, L47,  
L48, L49, L50, L51, L52, L53, L54, L55,  
L56, L57, L58, L59, L60, L61, L62, L63};

endmodule
