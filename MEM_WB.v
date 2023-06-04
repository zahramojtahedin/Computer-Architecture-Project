module MEM_WB(input [255:0] IN, input CLK, output [255:0] OUT);
BUFF #(.N(256)) _BUFF(.IN(IN), .CLK(CLK), .EN(1), .OUT(OUT));
endmodule;
