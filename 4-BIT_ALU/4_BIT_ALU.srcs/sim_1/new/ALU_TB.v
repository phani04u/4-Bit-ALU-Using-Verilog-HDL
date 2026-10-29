`timescale 1ns / 1ps
module ALU_TB;
reg [3:0] A;
reg [3:0] B;
reg [2:0] S;
wire [3:0] Y;
ALU_4 UUT(
.A(A),
.B(B),
.S(S),
.Y(Y)
);
integer i;
initial begin
 A = 4'b0100;
 B = 4'b0010;
 for(i = 0; i < 8; i = i + 1) begin 
  S = i;
  #10;
  end
  $finish;
  end
endmodule
