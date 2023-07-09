`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   00:48:57 06/18/2023
// Design Name:   vedic_32x32
// Module Name:   D:/project_mul/New folder/vedic/vedic32_tb.v
// Project Name:  vedic
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: vedic_32x32
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module vedic32_tb;

	// Inputs
	reg signed [31:0] a;
	reg signed [31:0] b;

	// Outputs
	wire signed[63:0] c;
integer x1=0;
	// Instantiate the Unit Under Test (UUT)
	vedic_32x32 uut (
		.a(a), 
		.b(b), 
		.c(c)
	);

	initial begin
		 a = 1;
		b = 0;
		#5 $display("x = %d, y = %d, ans = %d\n", a, b, c);
		for (x1=1; x1<10; x1=x1+1)
		begin
			#5 a = a+x1+1;
			    b = b+x1+2;
			#5 $display("x = %d, y = %d, ans = %d\n", a, b, c);
		end
		
		for (x1=9; x1<100; x1=x1+10)
		begin
			#5 a = a+x1;
			    b = b+2*x1;
			#5 $display("x = %d, y = %d, ans = %d\n", a, b, c);
		end
		a = -11;
		b = 12;
		#5 $display("a = %d, b = %d",a,b);
		if(a<0&&b<0)
			begin
			a=~a+1;
			b=~b+1;
			#5 $display("ans = %d\n",c);
			end
		else if(a<0)
		begin
		 a=~a+1;
		 #5 $display("ans = %d\n",~c+1);
		end
		else if(b<0)
		begin
		 b=~b+1;
		#5 $display("ans = %d\n",~c+1);
		end
		a = 11;
		b = -12;
		#5 $display("a = %d, b = %d",a,b);
		if(a<0&&b<0)
			begin
			a=~a+1;
			b=~b+1;
			#5 $display("ans = %d\n",c);
			end
		else if(a<0)
		begin
		 a=~a+1;
		 #5 $display("ans = %d\n",~c+1);
		end
		else if(b<0)
		begin
		 b=~b+1;
		#5 $display("ans = %d\n",~c+1);
		end
		a = -2147483647;
		b = 1;
		#5 $display("a = %d, b = %d",a,b);
		if(a<0&&b<0)
			begin
			a=~a+1;
			b=~b+1;
			#5 $display("ans = %d\n",c);
			end
		else if(a<0)
		begin
		 a=~a+1;
		 #5 $display("ans = %d\n",~c+1);
		end
		else if(b<0)
		begin
		 b=~b+1;
		#5 $display("ans = %d\n",~c+1);
		end
      $finish;

   end
endmodule 