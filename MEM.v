module MEM(input [15:0]ADD, input [31:0]WR, input WE,CLK, output [31:0] RD);
reg [31:0] mem[0:65535];
integer i;
initial begin
	mem[0][31:0]=25;
	mem[1][31:0]=300;
	mem[2][31:0]=83;
	mem[3][31:0]=3;
	for(i=4;i<65536;i=i+1)begin
		mem[i][31:0]=32'h00000000;
	end
end
assign RD=mem[ADD];
always @(posedge CLK)begin
	if(WE)begin
		mem[ADD]<=WR;
	end
end
endmodule;
