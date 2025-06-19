`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/22/2025 03:35:49 PM
// Design Name: 
// Module Name: xor_log
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


module xor_log(
                input[31:0] a,b,
                input [3:0] operation,
                output reg[31:0] xor_out);
    always @(*) begin
        if(operation == 4'd6) xor_out <=  a ^ b;
        else xor_out <= 32'dz;
    end
endmodule
