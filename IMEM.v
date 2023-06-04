module IMEM(input [15:0]ADD, output [31:0] RD);
reg [7:0] mem[0:65535];
integer i;
initial begin

/*
000000 add
000001 sub
000010 addu
000011 subu
000100 and
000101 or
000110 xor
000111 nor
001000 slt
001001 sltu
100000 addi
100001 addiu
100010 slti
100011 sltiu
100100 andi
100101 ori
100110 xori

101000 beg
101001 bne

101110 lw
101111 lui

111111 sw

*/


/*
lui r10,7
lui r12,16
lw r5,r0,3
addi r10,-1
add r12,r5
bne r10,r0,-3
add r3,r12,r0
sw r12,r3,14

*/
	//nop
	mem[0]=8'h00;
	mem[1]=8'h00;
	mem[2]=8'h00;
	mem[3]=8'h00;
	//lui r10,7
	mem[4]=8'b10111100;
	mem[5]=8'b00001010;
	mem[6]=8'h00;
	mem[7]=8'h07;
	//lui r12,16
	mem[8]=8'b10111100;
	mem[9]=8'b00001100;
	mem[10]=8'h00;
	mem[11]=8'h10;
	//lw r5,r0,3
	mem[12]=8'b10111000;
	mem[13]=8'b00000101;
	mem[14]=8'h00;
	mem[15]=8'h03;
	//addi r10,r10,-1
	mem[16]=8'b10000001;
	mem[17]=8'b01001010;
	mem[18]=8'hff;
	mem[19]=8'hff;
	//add r12,r12,r5
	mem[20]=8'b00000000;
	mem[21]=8'b10101100;
	mem[22]=8'b01100000;
	mem[23]=8'h00;
	//bne r10,r0
	mem[24]=8'b10100101;
	mem[25]=8'b01000000;
	mem[26]=8'hff;
	mem[27]=8'hfd;
	//add r3,r10,r0
	mem[28]=8'b00000001;
	mem[29]=8'b10000000;
	mem[30]=8'b00011000;
	mem[31]=8'h00;
	//sw r12,r0,14
	mem[32]=8'b11111100;
	mem[33]=8'b00001100;
	mem[34]=8'h00;
	mem[35]=8'h0e;

	for(i=36;i<65536;i=i+1)begin
		mem[i][7:0]=8'hff;
	end
end
assign RD={mem[ADD],mem[ADD+1],mem[ADD+2],mem[ADD+3]};

endmodule;
