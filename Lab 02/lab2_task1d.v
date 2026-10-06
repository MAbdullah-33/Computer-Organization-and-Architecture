module fulladder_g(a,b,c,sum,carry);
input a,b,c;
output sum,carry;
wire x,y,z;

xor (sum,a,b,c);
and(x,a,b);
and(y,b,c);
and(z,a,c);
or (carry,x,y,z);
endmodule


module testbench_fulladder_g();

reg a,b,c;
wire sum,carry;

fulladder_g uut(.a(a), .b(b), .c(c), .sum(sum), .carry(carry));

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