`timescale 1ns/1ps;
module lshift_log(
    input [31:0]a,
    input [3:0]operation,
    output reg[31:0] lshift_out,
    output reg Overflow);
    always @(*) begin
        if(operation == 4'd7)begin
            if(a[30:23] < 8'd254) begin
                lshift_out <= {a[31],a[30:23] + 1,a[22:0]};
                Overflow <= 1'b0; 
            end
            else begin
                lshift_out <= {a[31],8'hff,23'd0};
                Overflow <=1'b1; 
            end
        end
        else begin lshift_out <= 32'dz; Overflow <= Overflow; end
    end
endmodule
