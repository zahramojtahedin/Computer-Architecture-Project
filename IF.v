module IF(input [31:0] PC_4_IN, input PC_SEL, input CLK,PC_WE, output [31:0]PC_4_OUT,INSTR, input IS_BR_EX,BRANCH_EX, output FLUSH);
wire [31:0]PC_IN,PC_OUT,PC_OUT_III;
wire [5:0]OP=INSTR[31:26];
wire IF_BR=(OP==6'b101000)|(OP==6'b101001);
wire [31:0]BR_ADD={{16{INSTR[15]}},INSTR[13:0],2'b00};
wire [31:0]_PC_4=PC_OUT+4;
assign PC_4_OUT=_PC_4;
wire [1:0]SEL=FLUSH?3:IF_BR?2:PC_SEL?1:0;
MUX #(.Nx1(4)) _MUX (.IN({PC_OUT_III,_PC_4+BR_ADD,PC_4_IN,_PC_4}),.SEL(SEL),.OUT(PC_IN));
PC _PC (.IN(PC_IN),.CLK(CLK),.EN(PC_WE),.OUT(PC_OUT));
IMEM _IMEM (.ADD(PC_OUT[15:0]),.RD(INSTR));
BR_PREDICTOR _BR_PREDICTOR(.CLK(CLK),.IF_BR(IF_BR),.IS_BR_EX(IS_BR_EX),.BRANCH_EX(BRANCH_EX),.FLUSH(FLUSH),.PC_OUT(_PC_4),.PC_OUT_III(PC_OUT_III));
endmodule;


module BR_PREDICTOR(input CLK,IF_BR,IS_BR_EX,BRANCH_EX, output FLUSH,input[31:0]PC_OUT,output reg[31:0] PC_OUT_III=0);
reg [1:0]state=2'b00,n_state=2'b00;
reg[31:0]PC_OUT_I=0,PC_OUT_II=0;
assign FLUSH=IS_BR_EX?(BRANCH_EX^(|n_state)):0;
always @(negedge CLK)begin
PC_OUT_I<=PC_OUT;
PC_OUT_II<=PC_OUT_I;
PC_OUT_III<=PC_OUT_II;
state<=n_state;
case(state)
	2'b00:begin n_state<=IS_BR_EX?(BRANCH_EX?2'b01:2'b00):n_state; end
	2'b01:begin n_state<=IS_BR_EX?(BRANCH_EX?2'b11:2'b00):n_state; end
	2'b11:begin n_state<=IS_BR_EX?(BRANCH_EX?2'b11:2'b10):n_state; end
	2'b10:begin n_state<=IS_BR_EX?(BRANCH_EX?2'b11:2'b00):n_state; end
endcase
end

endmodule;