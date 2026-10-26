module decoder5_32(output [31:0] dec_out,input [4:0] wr,input write_enable); 
    assign dec_out = write_enable ? (32'b1 << wr) : 32'b0; 
endmodule 
 
module mux32_1(output reg [31:0] out,input [4:0] sel,input [31:0] in0,in1,in2,in3,in4,in5,in6,in7,in8,in9,in10,in11,in12,in13,in14,in15,in16,in17,in18,in19,in20,in21,in22,in23,in24,in25,in26,in27,in28,in29,in30,in31); 
    always @(*) begin 
        case(sel) 
            5'd0: out=in0; 
            5'd1: out=in1; 
            5'd2: out=in2; 
            5'd3: out=in3; 
            5'd4: out=in4; 
            5'd5: out=in5; 
            5'd6: out=in6; 
            5'd7: out=in7; 
            5'd8: out=in8; 
            5'd9: out=in9; 
            5'd10: out=in10; 
            5'd11: out=in11; 
            5'd12: out=in12; 
            5'd13: out=in13; 
            5'd14: out=in14; 
            5'd15: out=in15; 
            5'd16: out=in16; 
            5'd17: out=in17; 
            5'd18: out=in18; 
            5'd19: out=in19; 
            5'd20: out=in20; 
            5'd21: out=in21; 
            5'd22: out=in22; 
            5'd23: out=in23; 
            5'd24: out=in24; 
            5'd25: out=in25; 
            5'd26: out=in26; 
            5'd27: out=in27; 
            5'd28: out=in28; 
            5'd29: out=in29; 
            5'd30: out=in30; 
            5'd31: out=in31; 
            default: out=32'b0; 
        endcase 
    end 
endmodule 
 
module register_32bit(output reg [31:0] q, input [31:0] d, input load, input clk); 
 initial begin 
         q= 32'd0; 
 end     
 always @(posedge clk) begin 
        if (load) 
            q <= d; 
    end 
endmodule 
 
module register_file_32x32(output [31:0] data_out1,output [31:0] data_out2,input [31:0] data_in,input [4:0] wr,input write_enable,input [4:0] rd1,input [4:0] rd2,input clk); 
    wire [31:0] dec_out; 
    wire [31:0] q [0:31]; 
 
    decoder5_32 decoder(dec_out,wr,write_enable); 
 
    genvar i; 
    generate 
        for(i=0;i<32;i=i+1) begin : reg_loop 
            register_32bit reg_inst(q[i],data_in,dec_out[i],clk); 
        end 
    endgenerate 
 
    mux32_1 
mux1(data_out1,rd1,q[0],q[1],q[2],q[3],q[4],q[5],q[6],q[7],q[8],q[9],q[10],q[11],q[12],q[13],q[14],q[15],q[16],q[17],q[18],q[19],q[20],q[21],q[22],q[23],q[24],q[25],q[26],q[27],q[28],q[29],q[30],q[31]); 
 
    mux32_1 
mux2(data_out2,rd2,q[0],q[1],q[2],q[3],q[4],q[5],q[6],q[7],q[8],q[9],q[10],q[11],q[12],q[13],q[14],q[15],q[16],q[17],q[18],q[19],q[20],q[21],q[22],q[23],q[24],q[25],q[26],q[27],q[28],q[29],q[30],q[31]); 
endmodule 
 
module tb3; 
    reg [31:0] data_in; 
    reg [4:0] wr,rd1,rd2; 
    reg write_enable,clk; 
    wire [31:0] data_out1,data_out2; 
 
    register_file_32x32 
register_file(.data_out1(data_out1),.data_out2(data_out2),.data_in(data_in),.wr(wr),.write_enable(write_enable),.rd1(rd1),.rd2(rd2),.clk(clk)); 
 
    initial begin 
        clk=0; 
        forever #5 clk=~clk; 
    end 
 
    initial begin 
        data_in=0; 
        wr=0; 
        rd1=0; 
        rd2=0; 
        write_enable=0; 
 #10 
        write_enable=1; 
        wr=5'd0; 
        data_in=32'd10; 
 #10  
 write_enable=1; 
 wr=5'd1; 
 data_in=32'd12; 
 #10  
 write_enable=0; 
        rd1=5'd2; 
        rd2=5'd10; 
        #2; 
 
    end 
endmodule 
