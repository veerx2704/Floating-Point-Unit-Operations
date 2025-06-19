`timescale 1ns / 1ps


module addsub_op(
    input [31:0]a,b,
    input [3:0] operation,
    output reg Addbar_sub,
    output reg[31:0] a_out,b_out);
    always @(*) begin
        if(operation == 4'd3 || operation == 4'd10) begin
            a_out <= a;
            b_out <= b;
        end
        else begin
            a_out <= 32'dz;
            b_out <= 32'dz;
        end
        if (operation == 4'd3) Addbar_sub <= 1'b1;
        else if (operation == 4'd10) Addbar_sub <= 1'b0;
        else Addbar_sub <= Addbar_sub;
    end
endmodule
