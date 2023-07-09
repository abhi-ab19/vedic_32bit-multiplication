`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    00:46:57 06/18/2023 
// Design Name: 
// Module Name:    vedic2_2 
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
module ha(a, b, sum, carry);
// a and b are inputs
input signed a;
input signed b;
output signed sum;
output signed carry;
assign carry=a&b;
assign sum=a^b;
endmodule

module vedic_2x2(a,b,c);
input signed [1:0]a;
input signed [1:0]b;
output signed [3:0]c;
wire signed [3:0]c;
wire signed [3:0]temp;
//stage 1
// four multiplication operation of bits accourding to vedic logic done using and gates 
assign c[0]=a[0]&b[0]; 
assign temp[0]=a[1]&b[0];
assign temp[1]=a[0]&b[1];
assign temp[2]=a[1]&b[1];
//stage two 
// using two half adders 
ha z1(temp[0],temp[1],c[1],temp[3]);
ha z2(temp[2],temp[3],c[2],c[3]);
endmodule

////////////////////////////////////////////////////////////////////////////////////////////////////////////

module half_adder(x,y,s,c);
   input signed x,y;
   output signed s,c;
   assign  s=x^y;
   assign  c=x&y;
endmodule // half adder


module full_adder(x,y,c_in,s,c_out);
   input signed x,y,c_in;
   output signed s,c_out;
 assign s = (x^y) ^ c_in;
 assign c_out = (y&c_in)| (x&y) | (x&c_in);
endmodule // full_adder