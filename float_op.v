`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/23/2025 05:47:18 PM
// Design Name: 
// Module Name: div_op
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module float_op(
    input [31:0] a,
    input [3:0] operation,
    output reg[31:0] a_out
    );
    
    always @(*) begin
        if(operation == 4'd9) begin
            a_out <= a;
        end
        else a_out <= 32'dz;
    end
endmodule
