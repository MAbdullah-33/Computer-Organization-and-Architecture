module halfadder_g(a,b,sum,carry);
input a,b;
output sum,carry;
xor (sum, a, b);
and (carry, a, b);
endmodule


module testbench_halfadder_g();

reg a,b;
wire sum,carry;

halfadder_g uut(.a(a), .b(b), .sum(sum), .carry(carry));

initial
begin

    a = 0 ; b = 0;
#50 a = 0 ; b = 1;
#50 a = 1 ; b = 0;
#50 a = 1 ; b = 1;
#50; 

$stop;

end
endmodule 