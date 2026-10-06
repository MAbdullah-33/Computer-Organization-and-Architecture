module mux_d(s0,s1,s2,d0,d1,d2,d3,d4,d5,d6,d7,y);

input s0,s1,s2,d0,d1,d2,d3,d4,d5,d6,d7;
output y;

wire a,b,c,d,e,f,g,h;

assign a = d0 & ~s0 & ~s1 & ~s2;
assign b = d1 & s0 & ~s1 & ~s2;
assign c = d2 & ~s0 & s1 & ~s2;
assign d = d3 & s0 & s1 & ~s2;
assign e = d4 & ~s0 & ~s1 & s2;
assign f = d5 & s0 & ~s1 & s2;
assign g = d6 & ~s0 & s1 & s2;
assign h = d7 & s0 & s1 & s2;

assign y = a | b | c | d | e | f | g | h;

endmodule

module testbench_mux_d();

reg s0,s1,s2,d0,d1,d2,d3,d4,d5,d6,d7;
wire y;

mux_d uut(.s0(s0), .s1(s1), .s2(s2), .d0(d0), .d1(d1), .d2(d2), .d3(d3), .d4(d4), .d5(d5), .d6(d6), .d7(d7), .y(y));

initial 
begin

d0=0; d1=0; d2=0; d3=0;
d4=1; d5=1; d6=1; d7=1;

s2=0; s1=0; s0=0; 
#50 s2=0; s1=0; s0=1; 
#50 s2=0; s1=1; s0=0; 
#50 s2=0; s1=1; s0=1; 
#50 s2=1; s1=0; s0=0; 
#50 s2=1; s1=0; s0=1; 
#50 s2=1; s1=1; s0=0; 
#50 s2=1; s1=1; s0=1; 
#50;

    $stop;

end

endmodule



 