module decoder_d(a,b,c,y0, y1, y2, y3, y4, y5, y6, y7);

input a,b,c;
output y0, y1, y2, y3, y4, y5, y6, y7;

assign y0 = ~a & ~b & ~c ; 
assign y1 = ~a & ~b & c ;
assign y2 = ~a & b & ~c ;
assign y3 = ~a & b & c ;
assign y4 = a & ~b & ~c ;
assign y5 = a & ~b & c ;
assign y6 = a & b & ~c ;
assign y7 = a & b & c ;

endmodule 

module testbench_decoder_d();

reg a,b,c;
wire y0, y1, y2, y3, y4, y5, y6, y7;

decoder_d uut(.a(a), .b(b), .c(c), .y0(y0), .y1(y1), .y2(y2), .y3(y3), .y4(y4), .y5(y5), .y6(y6), .y7(y7));

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