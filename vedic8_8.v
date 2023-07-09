`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    00:43:55 06/18/2023 
// Design Name: 
// Module Name:    vedic8_8 
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
module add_8_bit(input1,input2,answer);
parameter N=8;
input signed[N-1:0] input1,input2;
   output signed[N-1:0] answer;
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

module add_12_bit(input1,input2,answer);
parameter N=12;
input signed[N-1:0] input1,input2;
   output signed[N-1:0] answer;
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


module vedic_8x8(a,b,c);
   
input signed [7:0]a;
input signed [7:0]b;
output signed [15:0]c;

wire signed [15:0]q0;	
wire signed [15:0]q1;	
wire signed  [15:0]q2;
wire signed [15:0]q3;	
wire signed [15:0]c;
wire signed [7:0]temp1;
wire signed  [11:0]temp2;
wire signed [11:0]temp3;
wire signed [11:0]temp4;
wire signed [7:0]q4;
wire signed [11:0]q5;
wire signed [11:0]q6;
// using 4 4x4 multipliers
vedic_4x4 z1(a[3:0],b[3:0],q0[15:0]);
vedic_4x4 z2(a[7:4],b[3:0],q1[15:0]);
vedic_4x4 z3(a[3:0],b[7:4],q2[15:0]);
vedic_4x4 z4(a[7:4],b[7:4],q3[15:0]);

// stage 1 adders 
assign temp1 ={4'b0,q0[7:4]};
add_8_bit z5(q1[7:0],temp1,q4);
assign temp2 ={4'b0,q2[7:0]};
assign temp3 ={q3[7:0],4'b0};
add_12_bit z6(temp2,temp3,q5);
assign temp4={4'b0,q4[7:0]};
// stage 2 adder
add_12_bit z7(temp4,q5,q6);
// fnal output assignment 
assign c[3:0]=q0[3:0];
assign c[15:4]=q6[11:0];

endmodule 