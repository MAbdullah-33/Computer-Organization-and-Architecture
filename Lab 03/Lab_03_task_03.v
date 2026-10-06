module comparator(A,B,Y);

input [1:0] A;
input [1:0] B;
output reg [1:0]Y;

always @(*)
begin
     if (A > B)
        Y = 00;
     else 
        Y = 01;
end
endmodule 

module testbench_comparator();

reg [1:0] A;
reg [1:0] B;
wire [1:0] Y;

comparator uut(.A(A), .B(B), .Y(Y));
initial 
begin
A = 2'b01; B = 2'b01; #10;
A = 2'b01; B = 2'b11; #10;
A = 2'b11; B = 2'b01; #10;
end
endmodule 
