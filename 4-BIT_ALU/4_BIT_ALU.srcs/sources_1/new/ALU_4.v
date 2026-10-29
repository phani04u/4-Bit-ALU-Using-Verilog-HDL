`timescale 1ns / 1ps
module ALU_4(
    input [3:0] A,
    input [3:0] B,
    input [2:0] S,
    output reg [3:0] Y
);
always @(*) begin
    case (S)
        3'b000: Y = A + B;
        3'b001: Y = A - B;
        3'b010: Y = A * B;
        3'b011: Y = A / B;
        3'b100: Y = A & B;
        3'b101: Y = A | B;
        3'b110: Y = A ^ B;
        3'b111: Y = ~(A ^ B);
        default: Y = 4'b0000;
    endcase
end
endmodule

