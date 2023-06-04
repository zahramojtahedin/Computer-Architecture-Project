module BUFF #(parameter N=32) (input [N-1:0] IN, input CLK,EN, output reg [N-1:0] OUT=0);
genvar i;
generate
for(i=0;i<N;i=i+1) begin
	always @(posedge CLK)begin
		if(EN) OUT[i]<=(IN[i]===1'b1)?1'b1:1'b0;
	end
end
endgenerate
endmodule;
