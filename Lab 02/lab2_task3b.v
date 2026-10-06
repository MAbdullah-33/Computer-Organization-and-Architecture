module mux_g(s0,s1,s2,d0,d1,d2,d3,d4,d5,d6,d7,y);

input s0,s1,s2,d0,d1,d2,d3,d4,d5,d6,d7;
output y;

wire a,b,c,d,e,f,g,h;
wire p,q,r;

not(p,s0);
not(q,s1);
not(r,s2);

and(a,d0,p,q,r);
and(b,d1,s0,q,r);
and(c,d2,p,s1,r);
and(d,d3,s0,s1,r);
and(e,d4,p,q,s2);
and(f,d5,s0,q,s2);
and(g,d6,p,s1,s2);
and(h,d7,s0,s1,s2);

or (y,a,b,c,d,e,f,g,h);

endmodule

module testbench_mux_g();

reg s0,s1,s2,d0,d1,d2,d3,d4,d5,d6,d7;
wire y;

mux_g uut(.s0(s0), .s1(s1), .s2(s2), .d0(d0), .d1(d1), .d2(d2), .d3(d3), .d4(d4), .d5(d5), .d6(d6), .d7(d7), .y(y));

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



 