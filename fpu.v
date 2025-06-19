module fpu(
    input clk,
	input [31:0] op_a,
	input [31:0] op_b,
	input [3:0] opcode,	
	output reg[31:0] ALU_out,
	output reg Exception,Overflow,Underflow
	);
wire [31:0] addsub_A,addsub_B,Mul_A,Mul_B,Div_A,Div_B,OR_out,AND_out,XOR_out,L_S_out,R_S_out,Floating_Point;
wire addsub_Exception,Mul_Exception,Mul_Overflow,Mul_Underflow,Div_Exception, RS_Underflow, LS_Overflow;
wire [31:0] addsub_out,Mul_out,Div_out,Integer_Value;
wire AddBar_Sub;
wire [31:0] Complement_out;
wire [31:0] alu_wire;
wire exc_wire,ovf_wire,und_wire;
//Stage 1
// Initialising Registers

addsub_op addsub_OP(op_a,op_b,opcode,addsub_A,addsub_B,AddBar_Sub);
mul_op MUL_OP(op_a, op_b, opcode, Mul_A, Mul_B);
div_op DIV_OP(op_a, op_b, opcode, Div_A, Div_B);
float_op FLOAT_OP(op_a, opcode, Floating_Point);

reg [31:0] addsub_A_reg,addsub_B_reg,Mul_A_reg,Mul_B_reg,Div_A_reg,Div_B_reg,OR_out_reg,AND_out_reg,XOR_out_reg,L_S_out_reg,R_S_out_reg,Floating_Point_reg;
reg addsub_Exception_reg,Mul_Exception_reg,Mul_Overflow_reg,Mul_Underflow_reg,Div_Exception_reg, RS_Underflow_reg, LS_Overflow_reg;
reg [31:0] addsub_out_reg,Mul_out_reg,Div_out_reg,Integer_Value_reg;
reg AddBar_Sub_reg;
reg [3:0] opcode_reg,opcode_reg_2;
reg [31:0] Complement_out_reg;
reg [31:0] op_a_reg,op_b_reg;
always @(posedge clk) begin
    addsub_A_reg <= addsub_A;
    addsub_B_reg <= addsub_B;
    Mul_A_reg <= Mul_A;
    Mul_B_reg <= Mul_B;
    Div_A_reg <= Div_A;
    Div_B_reg <= Div_B;
    opcode_reg <= opcode;
    Floating_Point_reg <= Floating_Point;
    op_a_reg <= op_a;
    op_b_reg <= op_b;
    AddBar_Sub_reg <= AddBar_Sub;
end

Addition_Subtraction AuI(addsub_A_reg,addsub_B_reg,AddBar_Sub_reg,addsub_Exception,addsub_out);
Multiplication MuI(Mul_A_reg,Mul_B_reg,Mul_Exception,Mul_Overflow,Mul_Underflow,Mul_out);
Division DuI(Div_A_reg,Div_B_reg,Div_Exception,Div_out);
Floating_Point_to_Integer FuI(Floating_Point_reg,Integer_Value);
or_log ORI(op_a_reg, op_b_reg, opcode_reg, OR_out);
and_log ANDI(op_a_reg, op_b_reg, opcode_reg, AND_out);
xor_log XORI(op_a_reg, op_b_reg, opcode_reg, XOR_out);
lshift_log LSHIFT(op_a_reg, opcode_reg, L_S_out, LS_Overflow);
rshift_log RSHIFT(op_a_reg, opcode_reg, R_S_out, RS_Underflow);
comp_log COMPLEMENT(op_a_reg,opcode_reg, Complement_out);


always @(posedge clk) begin
    Complement_out_reg <= Complement_out;
    XOR_out_reg <= XOR_out;
    AND_out_reg <= AND_out;
    OR_out_reg <= OR_out;
    Integer_Value_reg <= Integer_Value;
    L_S_out_reg <= L_S_out;
    LS_Overflow_reg <= LS_Overflow;
    RS_Underflow_reg <= RS_Underflow;
    R_S_out_reg <= R_S_out;
    opcode_reg_2 <= opcode_reg;
    Mul_Exception_reg <= Mul_Exception;
    Mul_Overflow_reg <= Mul_Overflow;
    Mul_Underflow_reg <= Mul_Underflow;
    Div_Exception_reg <= Div_Exception;
    Mul_out_reg <= Mul_out;
    Div_out_reg <= Div_out;
    addsub_out_reg <= addsub_out;
    addsub_Exception_reg <= addsub_Exception;
end

assign {exc_wire,ovf_wire,und_wire,alu_wire} = (opcode_reg_2 == 4'd1) ? {Mul_Exception_reg,Mul_Overflow_reg,Mul_Underflow_reg,Mul_out_reg}	: 35'dz;
assign {exc_wire,ovf_wire,und_wire,alu_wire} = (opcode_reg_2 == 4'd2) ? {Div_Exception_reg,1'b0,1'b0,Div_out_reg}	: 35'dz;
assign {exc_wire,ovf_wire,und_wire,alu_wire} = (opcode_reg_2 == 4'd10)? {addsub_Exception_reg,1'b0,1'b0,addsub_out_reg}	: 35'dz;
assign {exc_wire,ovf_wire,und_wire,alu_wire} = (opcode_reg_2 == 4'd3) ? {addsub_Exception_reg,1'b0,1'b0,addsub_out_reg}	: 35'dz;
assign {exc_wire,ovf_wire,und_wire,alu_wire} = (opcode_reg_2 == 4'd4) ? {1'b0,1'b0,1'b0,OR_out_reg}	: 35'dz;
assign {exc_wire,ovf_wire,und_wire,alu_wire} = (opcode_reg_2 == 4'd5) ? {1'b0,1'b0,1'b0,AND_out_reg}	: 35'dz;
assign {exc_wire,ovf_wire,und_wire,alu_wire} = (opcode_reg_2 == 4'd6) ? {1'b0,1'b0,1'b0,XOR_out_reg}	: 35'dz;
assign {exc_wire,ovf_wire,und_wire,alu_wire} = (opcode_reg_2 == 4'd7) ? {1'b0,LS_Overflow_reg,1'b0,L_S_out_reg}	: 35'dz;
assign {exc_wire,ovf_wire,und_wire,alu_wire} = (opcode_reg_2 == 4'd8) ? {1'b0,1'b0,RS_Underflow_reg,R_S_out_reg}	: 35'dz;
assign {exc_wire,ovf_wire,und_wire,alu_wire} = (opcode_reg_2 == 4'd9) ? {1'b0,1'b0,1'b0,Integer_Value_reg}	: 35'dz;
assign {exc_wire,ovf_wire,und_wire,alu_wire} = (opcode_reg_2 == 4'd11) ? {1'b0,1'b0,1'b0,Complement_out_reg} : 35'dz;

always @(posedge clk) begin
    Exception <= exc_wire;
    ALU_out <= alu_wire;
    Overflow <= ovf_wire;
    Underflow <= und_wire;
end

endmodule