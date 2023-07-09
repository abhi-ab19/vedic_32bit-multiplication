`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    00:44:40 06/18/2023 
// Design Name: 
// Module Name:    vedi4_4 
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
module add_4_bit(input1,input2,answer);
parameter N=4;
input signed [N-1:0] input1,input2;
   output signed [N-1:0] answer;
   wire signed carry_out;
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

module add_6_bit(input1,input2,answer);
parameter N=6;
input signed [N-1:0] input1,input2;
   output signed [N-1:0] answer;
   wire signed carry_out;
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

module vedic_4x4(a,b,c);
input signed [3:0]a;
input signed [3:0]b;
output signed [7:0]c;

wire signed [3:0]q0;	
wire signed [3:0]q1;	
wire signed [3:0]q2;
wire signed [3:0]q3;	
wire signed [7:0]c;
wire signed [3:0]temp1;
wire signed [5:0]temp2;
wire signed [5:0]temp3;
wire signed [5:0]temp4;
wire signed [3:0]q4;
wire signed [5:0]q5;
wire signed [5:0]q6;
// using 4 2x2 multipliers
vedic_2x2 z1(a[1:0],b[1:0],q0[3:0]);
vedic_2x2 z2(a[3:2],b[1:0],q1[3:0]);
vedic_2x2 z3(a[1:0],b[3:2],q2[3:0]);
vedic_2x2 z4(a[3:2],b[3:2],q3[3:0]);
// stage 1 adders 
assign temp1 ={2'b0,q0[3:2]};
add_4_bit z5(q1[3:0],temp1,q4);
assign temp2 ={2'b0,q2[3:0]};
assign temp3 ={q3[3:0],2'b0};
add_6_bit z6(temp2,temp3,q5);
assign temp4={2'b0,q4[3:0]};
// stage 2 adder 
add_6_bit z7(temp4,q5,q6);
// fnal output assignment 
assign c[1:0]=q0[1:0];
assign c[7:2]=q6[5:0];

endmodule 