`timescale 1ns/1ps;
module rshift_log(
    input [31:0]a,
    input [3:0]operation,
    output reg[31:0] rshift_out,
    output reg Underflow);
    always @(*) begin
        if(operation == 4'd8)begin
            if(a[30:23] > 8'd0) begin
                rshift_out <= {a[31],a[30:23] - 1,a[22:0]};
                Underflow <= 1'b0; 
            end
            else begin
                if(a[22:0] > 23'd1) rshift_out <= {a[31],8'd0,a[22:0]>>1};
                else begin 
                    rshift_out <= {a[31],8'h0,23'd1};
                    Underflow <=1'b1; 
                end
            end
        end
        else begin rshift_out <= 32'dz; Underflow <= Underflow; end
    end
endmodule
