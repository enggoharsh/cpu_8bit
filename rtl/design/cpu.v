module cpu(
    input        clk,
    input        rst,

    // FPGA-visible outputs
    output [7:0] pc_out,
    output [7:0] R0,
    output [7:0] R1,
    output [7:0] R2,
    output [7:0] R3,
    output       zero_flag_out
);
    // Wires
    wire [7:0] pc, next_pc;
    wire [7:0] instr;
    wire [7:0] A, B;
    wire [7:0] alu_out;
    wire [7:0] mem_dout;
    wire [7:0] write_data;
    wire       alu_zero;

    // Decode fields
    wire [1:0] opcode = instr[7:6];
    wire [1:0] rd     = instr[5:4];
    wire [1:0] rs     = instr[3:2];
    wire [1:0] imm2   = instr[1:0];

    // Memory address (4 bits)
    wire [3:0] mem_addr = {rs, imm2};

    // Control signals
    wire is_alu   = (opcode == 2'b00);
    wire is_load  = (opcode == 2'b01);
    wire is_store = (opcode == 2'b10);
    wire is_jump  = (opcode == 2'b11);

    wire is_jz  = is_jump && instr[5];
    wire is_jmp = is_jump && ~instr[5];

    wire regwrite = is_alu | is_load;
    wire memread  = is_load;
    wire memwrite = is_store;

    // Zero flag register
    reg zero_flag;

    // Program Counter
    pc PC(
        .clk(clk),
        .rst(rst),
        .pc_in(next_pc),
        .pc_out(pc)
    );

    assign pc_out = pc;
    assign zero_flag_out = zero_flag;

    // Instruction Memory
    instr_mem IM(
        .addr(pc),
        .instr(instr)
    );

    // Register file with debug outputs
    wire [7:0] R0_w, R1_w, R2_w, R3_w;

    regfile RF(
        .clk(clk),
        .we(regwrite),
        .rd(rd),
        .rs(rs),
        .din(write_data),
        .A(A),
        .B(B),
        .R0_out(R0_w),
        .R1_out(R1_w),
        .R2_out(R2_w),
        .R3_out(R3_w)
    );

    assign R0 = R0_w;
    assign R1 = R1_w;
    assign R2 = R2_w;
    assign R3 = R3_w;

    // ALU
    alu ALU(
        .A(A),
        .B(B),
        .sel(imm2),
        .Y(alu_out),
        .zero(alu_zero)
    );

    // Data Memory
    data_mem DM(
        .clk(clk),
        .memread(memread),
        .memwrite(memwrite),
        .addr(mem_addr),
        .din(B),
        .dout(mem_dout)
    );

    // Write-back select
    assign write_data = is_load ? mem_dout : alu_out;

    // Update zero flag
    always @(posedge clk or posedge rst) begin
        if (rst)
            zero_flag <= 1'b0;
        else if (is_alu && regwrite)
            zero_flag <= alu_zero;
    end

    // Next PC logic
    wire [7:0] pc_plus1  = pc + 8'd1;
    wire [7:0] jump_addr = {4'b0000, instr[3:0]};

    wire take_branch =
        is_jmp |
        (is_jz & zero_flag);

    assign next_pc = take_branch ? jump_addr : pc_plus1;

endmodule
