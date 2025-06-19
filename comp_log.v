`timescale 1ns / 1ps


module comp_log(
    input [31:0] a,
    input[3:0] operation,
    output reg[31:0] comp_out
    );
    always @(*) begin
        if(operation == 4'd11) comp_out <= {~a[31],a[30:0]};
        else comp_out <= 32'dz;
    end
endmodule
