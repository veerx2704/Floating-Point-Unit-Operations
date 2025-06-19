`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/21/2025 09:36:20 AM
// Design Name: 
// Module Name: data_path
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


module data_control(
    input clk,
    input [11:0] opfun, 
    output reg RegWrite, ALUSrc, AddSub, DataRead, DataWrite,
    output reg [1:0] RegDst, RegInSrc, FnClass, BrType, LogicFn, PCSrc
);

always @(posedge clk) begin
    casez (opfun)
        12'b001111xxxxxx: {RegWrite, RegDst, RegInSrc, ALUSrc, AddSub, LogicFn, FnClass, DataRead, DataWrite, BrType, PCSrc} = 17'b1_00_01_1_x_x_x_0_0_00_00;
        12'b000000100000: {RegWrite, RegDst, RegInSrc, ALUSrc, AddSub, LogicFn, FnClass, DataRead, DataWrite, BrType, PCSrc} = 17'b1_01_01_0_0_10_00_0_0_00_00;
        12'b000000100010: {RegWrite, RegDst, RegInSrc, ALUSrc, AddSub, LogicFn, FnClass, DataRead, DataWrite, BrType, PCSrc} = 17'b1_01_01_0_1_10_00_0_0_00_00;
        12'b000000101010: {RegWrite, RegDst, RegInSrc, ALUSrc, AddSub, LogicFn, FnClass, DataRead, DataWrite, BrType, PCSrc} = 17'b1_01_01_0_1_10_00_0_0_00_00;
        12'b001000xxxxxx: {RegWrite, RegDst, RegInSrc, ALUSrc, AddSub, LogicFn, FnClass, DataRead, DataWrite, BrType, PCSrc} = 17'b1_00_01_1_0_x_x_0_0_00_00;
        12'b001010xxxxxx: {RegWrite, RegDst, RegInSrc, ALUSrc, AddSub, LogicFn, FnClass, DataRead, DataWrite, BrType, PCSrc} = 17'b1_00_01_1_1_x_x_0_0_00_00;
        12'b000000100100: {RegWrite, RegDst, RegInSrc, ALUSrc, AddSub, LogicFn, FnClass, DataRead, DataWrite, BrType, PCSrc} = 17'b1_01_01_0_x_00_11_0_0_00_00;
        12'b000000100101: {RegWrite, RegDst, RegInSrc, ALUSrc, AddSub, LogicFn, FnClass, DataRead, DataWrite, BrType, PCSrc} = 17'b1_01_01_0_x_00_11_0_0_00_00;
        12'b000000100110: {RegWrite, RegDst, RegInSrc, ALUSrc, AddSub, LogicFn, FnClass, DataRead, DataWrite, BrType, PCSrc} = 17'b1_01_01_0_x_00_11_0_0_00_00;
        12'b000000100111: {RegWrite, RegDst, RegInSrc, ALUSrc, AddSub, LogicFn, FnClass, DataRead, DataWrite, BrType, PCSrc} = 17'b1_01_01_0_x_00_11_0_0_00_00;
        12'b001100xxxxxx: {RegWrite, RegDst, RegInSrc, ALUSrc, AddSub, LogicFn, FnClass, DataRead, DataWrite, BrType, PCSrc} = 17'b1_00_01_1_x_10_11_0_0_00_00;
        12'b001101xxxxxx: {RegWrite, RegDst, RegInSrc, ALUSrc, AddSub, LogicFn, FnClass, DataRead, DataWrite, BrType, PCSrc} = 17'b1_00_01_1_x_11_11_0_0_00_00;
        12'b001110xxxxxx: {RegWrite, RegDst, RegInSrc, ALUSrc, AddSub, LogicFn, FnClass, DataRead, DataWrite, BrType, PCSrc} = 17'b1_00_01_1_x_10_11_0_0_00_00;
        12'b100011xxxxxx: {RegWrite, RegDst, RegInSrc, ALUSrc, AddSub, LogicFn, FnClass, DataRead, DataWrite, BrType, PCSrc} = 17'b1_00_01_1_0_10_00_1_0_00_00;
        12'b101011xxxxxx: {RegWrite, RegDst, RegInSrc, ALUSrc, AddSub, LogicFn, FnClass, DataRead, DataWrite, BrType, PCSrc} = 17'b0_x_01_1_0_10_00_0_1_00_00;
        12'b000010xxxxxx: {RegWrite, RegDst, RegInSrc, ALUSrc, AddSub, LogicFn, FnClass, DataRead, DataWrite, BrType, PCSrc} = 17'b0_x_x_x_x_x_x_0_0_00_01;
        12'b000000001000: {RegWrite, RegDst, RegInSrc, ALUSrc, AddSub, LogicFn, FnClass, DataRead, DataWrite, BrType, PCSrc} = 17'b0_x_x_x_x_x_x_0_0_00_01;
        12'b000001xxxxxx: {RegWrite, RegDst, RegInSrc, ALUSrc, AddSub, LogicFn, FnClass, DataRead, DataWrite, BrType, PCSrc} = 17'b0_x_x_x_x_x_x_0_0_11_00;
        12'b000100xxxxxx: {RegWrite, RegDst, RegInSrc, ALUSrc, AddSub, LogicFn, FnClass, DataRead, DataWrite, BrType, PCSrc} = 17'b0_x_x_x_x_x_x_0_0_10_00;
        12'b000101xxxxxx: {RegWrite, RegDst, RegInSrc, ALUSrc, AddSub, LogicFn, FnClass, DataRead, DataWrite, BrType, PCSrc} = 17'b0_x_x_x_x_x_x_0_0_10_00;
        12'b000011xxxxxx: {RegWrite, RegDst, RegInSrc, ALUSrc, AddSub, LogicFn, FnClass, DataRead, DataWrite, BrType, PCSrc} = 17'b1_10_10_x_x_x_x_0_0_00_01;
        12'b000000001100: {RegWrite, RegDst, RegInSrc, ALUSrc, AddSub, LogicFn, FnClass, DataRead, DataWrite, BrType, PCSrc} = 17'b0_x_x_x_x_x_x_0_0_00_11;
        
        default: {RegWrite, RegDst, RegInSrc, ALUSrc, AddSub, LogicFn, FnClass, DataRead, DataWrite, BrType, PCSrc} = 17'b0_x_x_x_x_x_x_0_0_00_00;
    endcase
end

endmodule