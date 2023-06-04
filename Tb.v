`timescale 1ns/1ns
module Tb();
reg CLK=0;
always #5 CLK=~CLK;
CPU _CPU(.CLK(CLK));
endmodule;