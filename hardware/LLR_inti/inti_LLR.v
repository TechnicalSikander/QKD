`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 21.09.2025 11:21:19
// Design Name: 
// Module Name: inti_LLR
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



module LLR_array_64 (
    input  wire [5:0]  code_sym,            // input symbol
 output wire [31:0] L0, L1, L2, L3, L4, L5, L6, L7,
                   L8, L9, L10, L11, L12, L13, L14, L15,
                   L16, L17, L18, L19, L20, L21, L22, L23,
                   L24, L25, L26, L27, L28, L29, L30, L31,
                   L32, L33, L34, L35, L36, L37, L38, L39,
                   L40, L41, L42, L43, L44, L45, L46, L47,
                   L48, L49, L50, L51, L52, L53, L54, L55,
                   L56, L57, L58, L59, L60, L61, L62, L63



);

  
    genvar j;
generate
    for (j = 0; j < 64; j = j + 1) begin : LLR_BLOCKS
        LLR u_llr (
            .code_sym(code_sym),
            .j_val   (j[5:0]),
            .L       (L_int[j])
        );
    end
endgenerate

            
wire [31:0] L_int [0:63];

assign L0  = L_int[0];
assign L1  = L_int[1];
assign L2  = L_int[2];
assign L3  = L_int[3];
assign L4  = L_int[4];
assign L5  = L_int[5];
assign L6  = L_int[6];
assign L7  = L_int[7];
assign L8  = L_int[8];
assign L9  = L_int[9];
assign L10 = L_int[10];
assign L11 = L_int[11];
assign L12 = L_int[12];
assign L13 = L_int[13];
assign L14 = L_int[14];
assign L15 = L_int[15];
assign L16 = L_int[16];
assign L17 = L_int[17];
assign L18 = L_int[18];
assign L19 = L_int[19];
assign L20 = L_int[20];
assign L21 = L_int[21];
assign L22 = L_int[22];
assign L23 = L_int[23];
assign L24 = L_int[24];
assign L25 = L_int[25];
assign L26 = L_int[26];
assign L27 = L_int[27];
assign L28 = L_int[28];
assign L29 = L_int[29];
assign L30 = L_int[30];
assign L31 = L_int[31];
assign L32 = L_int[32];
assign L33 = L_int[33];
assign L34 = L_int[34];
assign L35 = L_int[35];
assign L36 = L_int[36];
assign L37 = L_int[37];
assign L38 = L_int[38];
assign L39 = L_int[39];
assign L40 = L_int[40];
assign L41 = L_int[41];
assign L42 = L_int[42];
assign L43 = L_int[43];
assign L44 = L_int[44];
assign L45 = L_int[45];
assign L46 = L_int[46];
assign L47 = L_int[47];
assign L48 = L_int[48];
assign L49 = L_int[49];
assign L50 = L_int[50];
assign L51 = L_int[51];
assign L52 = L_int[52];
assign L53 = L_int[53];
assign L54 = L_int[54];
assign L55 = L_int[55];
assign L56 = L_int[56];
assign L57 = L_int[57];
assign L58 = L_int[58];
assign L59 = L_int[59];
assign L60 = L_int[60];
assign L61 = L_int[61];
assign L62 = L_int[62];
assign L63 = L_int[63];

          
endmodule

module LLR (
    input  wire [5:0] code_sym,
    input  wire [5:0] j_val,
    output wire[31:0] L 
);
wire [5:0] data ;
wire [2:0]nerr_sat;


assign data =(code_sym ^ j_val);
ones_counter_6bit c1(data,nerr_sat);
llr_lookup_table L1(nerr_sat,L);  

endmodule


module llr_lookup_table (
    input  wire [2:0] nerr,               
    output reg  [31:0] llr_value 
);

     always @(*) begin
        case (nerr)
            3'd1: llr_value = 32'd11789;   // -1*log(1e-5)
            3'd2: llr_value = 32'd23579;  // -2*log(1e-5)
            3'd3: llr_value = 32'd35368;  // -3*log(1e-5)
            3'd4: llr_value = 32'd47158;  // -4*log(1e-5)
            3'd5: llr_value = 32'd58947;  // -5*log(1e-5)
            3'd6: llr_value = 32'd70737;  // -6*log(1e-5)
            default: llr_value = 32'd0;
        endcase
    end

endmodule

module ones_counter_6bit (
    input [5:0] data_in,
    output  [2:0] ones_count
);
wire [1:0] x1,x2;
wire [1:0] x3,x4;

  assign x1=data_in[0]+data_in[1];
  assign x2=data_in[3]+data_in[4];
  assign x3= data_in[2]+x1;
  assign x4= data_in[5]+x2;
  assign ones_count=x3+x4;

endmodule