module PC(input [31:0] IN, input CLK,EN, output reg[31:0] OUT=0);
always @(posedge CLK)begin
	if(EN) OUT<=IN;
end
endmodule;
