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


module div_op(
    input [31:0] a,b,
    input [3:0] operation,
    output reg[31:0] a_out,b_out
    );
    
    always @(*) begin
        if(operation == 4'd2) begin
            a_out <= a;
            b_out <= b;
        end
        else {a_out,b_out} <= 64'dz;
    end
endmodule
