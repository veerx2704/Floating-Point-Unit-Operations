module and_log(
    input [31:0]a,b,
    input [3:0]operation,
    output reg[31:0] and_out);
    always @(*) begin
        if(operation == 4'd5) and_out <= a & b;
        else and_out <= 32'dz;
    end
endmodule
