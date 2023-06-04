module Controller(input CLK,BRANCH, output reg PC_SEL=0,PC_WE=1);
always @(posedge CLK)begin
	PC_WE<=1'b1;
	if(BRANCH)PC_SEL<=1'b1;
	else PC_SEL<=1'b0;
end
endmodule;