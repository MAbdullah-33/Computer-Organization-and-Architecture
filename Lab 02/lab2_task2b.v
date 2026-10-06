module decoder_g(a,b,c,y0, y1, y2, y3, y4, y5, y6, y7);

input a,b,c;
output y0, y1, y2, y3, y4, y5, y6, y7;

wire x,y,z;
not (x,a);
not (y,b);
not (z,c);
and (y0,x,y,z);
and (y1,x,y,c);
and (y2,x,b,z);
and (y3,x,b,c);
and (y4,a,y,z);
and (y5,a,y,c);
and (y6,a,b,z);
and (y7,a,b,c);

endmodule 

module testbench_decoder_g();

reg a,b,c;
wire y0, y1, y2, y3, y4, y5, y6, y7;

decoder_g uut(.a(a), .b(b), .c(c), .y0(y0), .y1(y1), .y2(y2), .y3(y3), .y4(y4), .y5(y5), .y6(y6), .y7(y7));

initial 
begin

    a = 0 ; b = 0 ; c = 0;
#50 a = 0 ; b = 0 ; c = 1;
#50 a = 0 ; b = 1 ; c = 0;
#50 a = 0 ; b = 1 ; c = 1;
#50 a = 1 ; b = 0 ; c = 0;
#50 a = 1 ; b = 0 ; c = 1;
#50 a = 1 ; b = 1 ; c = 0;
#50 a = 1 ; b = 1 ; c = 1;
#50; 

$stop;

end
endmodule 