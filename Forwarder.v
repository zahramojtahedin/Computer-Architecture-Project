module Forwarder(input WB_EN_MEM,WB_EN_WB,IS_IMM,IS_LDI, input [4:0]RS,RT,RD_ADD_OUT_MEM,RD_ADD_OUT_WB, output [1:0] SELS,SELT);
assign SELS=IS_LDI?2'b00:((RS==RD_ADD_OUT_MEM) && (RD_ADD_OUT_MEM!=0) && WB_EN_MEM)?2'b11:((RS==RD_ADD_OUT_WB) && (RD_ADD_OUT_WB!=0) && WB_EN_WB)?2'b10:2'b01;
assign SELT=IS_IMM?2'b00:((RT==RD_ADD_OUT_MEM) && (RD_ADD_OUT_MEM!=0) && WB_EN_MEM)?2'b11:((RT==RD_ADD_OUT_WB) && (RD_ADD_OUT_WB!=0) && WB_EN_WB)?2'b10:2'b01;
endmodule;
