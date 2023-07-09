`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    00:41:32 06/18/2023 
// Design Name: 
// Module Name:    vedic32_32 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module add_32_bit(input1,input2,answer);
parameter N=32;
input signed[N-1:0] input1,input2;
   output signed [N-1:0] answer;
   wire  signed carry_out;
  wire signed[N-1:0] carry;
   genvar i;
   generate 
   for(i=0;i<N;i=i+1)
     begin: generate_N_bit_Adder
   if(i==0) 
  half_adder f(input1[0],input2[0],answer[0],carry[0]);
   else
  full_adder f(input1[i],input2[i],carry[i-1],answer[i],carry[i]);
     end
  assign carry_out = carry[N-1];
   endgenerate
endmodule 

module add_48_bit(input1,input2,answer);
parameter N=48;
input signed [N-1:0] input1,input2;
   output signed [N-1:0] answer;
   wire  signed carry_out;
  wire signed [N-1:0] carry;
   genvar i;
   generate 
   for(i=0;i<N;i=i+1)
     begin: generate_N_bit_Adder
   if(i==0) 
  half_adder f(input1[0],input2[0],answer[0],carry[0]);
   else
  full_adder f(input1[i],input2[i],carry[i-1],answer[i],carry[i]);
     end
  assign carry_out = carry[N-1];
   endgenerate
endmodule 

module vedic_32x32(a,b,c);
input signed [31:0]a;
input signed [31:0]b;
output signed[63:0]c;
wire signed [31:0]q0;	
wire signed[31:0]q1;	
wire signed[31:0]q2;
wire signed[31:0]q3;	
wire signed[63:0]c;
wire signed[31:0]temp1;
wire signed[47:0]temp2;
wire signed[47:0]temp3;
wire signed[47:0]temp4;
wire signed[31:0]q4;
wire signed[47:0]q5;
wire signed[47:0]q6;
// using 4 16x16 multipliers
vedic_16x16 z1(a[15:0],b[15:0],q0[31:0]);
vedic_16x16 z2(a[31:16],b[15:0],q1[31:0]);
vedic_16x16 z3(a[15:0],b[31:16],q2[31:0]);
vedic_16x16 z4(a[31:16],b[31:16],q3[31:0]);

// stage 1 adders 
assign temp1 ={16'b0,q0[31:16]};
add_32_bit z5(q1[31:0],temp1,q4);
assign temp2 ={16'b0,q2[31:0]};
assign temp3 ={q3[31:0],16'b0};
add_48_bit z6(temp2,temp3,q5);
assign temp4={16'b0,q4[31:0]};

//stage 2 adder
add_48_bit z7(temp4,q5,q6);
// fnal output assignment 
assign c[15:0]=q0[15:0];
assign c[63:16]=q6[47:0];

endmodule
