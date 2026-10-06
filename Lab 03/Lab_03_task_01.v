module adder_subtractor(A,B,control,Y);

input [3 : 0] A;
input [3 : 0] B;
input control;

output reg [4 : 0] Y;

always @*

begin
if (control == 0)
   Y = A + B ; 
else
   Y = A - B ; 
end

endmodule 

module testbench_adder_subtractor();

reg [3 : 0] A;
reg [3 : 0] B;
reg control;

wire [3 : 0] Y;

adder_subtractor uut(.A(A), .B(B), .control(control), .Y(Y));

initial 
begin
#10;
// Addition
A = 4'b1010;
B = 4'b0001;
control = 0;
#50;

// Subtraction
A = 4'b0101;
B = 4'b0011;
control = 1;

#50;
$stop;
end
endmodule 