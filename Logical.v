module Logical(input [1:0]select, input [7:0]z, output [7:0]result);
	wire [3:0]x;
	wire [3:0]y;

	assign x[3:0] = z[3:0];
	assign y[3:0] = z[7:4];
	
	wire [7:0]AND_out;
	assign AND_out[3:0] = x[3:0] & y[3:0];
	
	wire [7:0]OR_out;
	assign OR_out[3:0] = x[3:0] | y[3:0];
	
	wire [7:0]EXOR_out;
	assign EXOR_out[3:0] = x[3:0] ^ y[3:0];
	
	wire [7:0]NOT_out;
	assign NOT_out[7:0] = ~z[7:0];
	
	//use a multiplexor to select the appropiate output
	MUX result_mux({AND_out[7:0],OR_out[7:0],EXOR_out[7:0],NOT_out[7:0]},~select[1:0],result[7:0]);
	defparam result_mux.n = 8;
endmodule