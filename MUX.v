module MUX #(parameter Nx1=2, BUS=32)(input [BUS*Nx1-1:0]IN, input [clog2(Nx1)-1:0]SEL, output [BUS-1:0]OUT);

assign OUT=(IN >> BUS*SEL) & {{BUS*(Nx1-1){1'b0}},{BUS{1'b1}}};

function integer clog2;
input integer value;
begin
value = value-1;
for (clog2=0; value>0; clog2=clog2+1)
value = value>>1;
end
endfunction

endmodule;