module IF_ID(input RST,input [255:0] IN, input CLK, output [255:0] OUT);
BUFF #(.N(256)) _BUFF(.IN(RST?{256{1'b0}}:IN), .CLK(CLK), .EN(1), .OUT(OUT));
endmodule;
