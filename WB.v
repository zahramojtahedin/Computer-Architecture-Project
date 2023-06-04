module WB(input [31:0]MEM,ALU, input SEL, output [31:0]OUT);
MUX _MUX (.IN({MEM,ALU}),.SEL(SEL),.OUT(OUT));
endmodule;