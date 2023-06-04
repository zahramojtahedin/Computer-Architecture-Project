module REG(input [4:0] RS_ADD,RT_ADD,RD_ADD, input [31:0]WR, input WE,CLK, output [31:0] RS,RT);
reg [31:0] regs[0:31];
integer i;
initial begin
	for(i=0;i<32;i=i+1)begin
		regs[i][31:0]=32'h00000000;
	end
end
assign RS=regs[RS_ADD];
assign RT=regs[RT_ADD];
always @(negedge CLK)begin
	if(WE)begin
		regs[RD_ADD]<=WR;
	end
end
endmodule;
