module ALU(input [31:0] INS,INT, input [2:0]CMD, input S, output [31:0] OUT, output EG,NE);
parameter _add=0,_sub=1,_and=2,_or=3,_xor=4,_nor=5,_slt=6;
wire [31:0]IN1={32{S&INS[31]}}^INS+(S&INS[31]);
wire [31:0]IN2={32{S&INT[31]}}^INT+(S&INT[31]);
assign OUT=
(CMD==_add)?IN1+IN2:
(CMD==_sub)?IN1-IN2:
(CMD==_and)?IN1&IN2:
(CMD==_or)?IN1|IN2:
(CMD==_xor)?IN1^IN2:
(CMD==_nor)?~(IN1|IN2):
((CMD==_slt)&&(IN1<IN2))?32'h00000001:
((CMD==_slt)&&(IN1>=IN2))?32'h00000000:
OUT;
assign EG=IN1>=IN2;
assign NE=IN1!=IN2;
endmodule;
