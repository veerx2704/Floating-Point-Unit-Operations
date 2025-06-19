`timescale 1ns/1ps;
module or_log(
    input [31:0]a,b,
    input [3:0]operation,
    output reg[31:0] or_out);
    always @(*) begin
        if(operation == 4'd4) or_out <= a | b;
        else or_out <= 32'dz;
    end
endmodule
