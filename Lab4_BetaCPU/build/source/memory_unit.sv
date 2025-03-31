/*
    This file was generated automatically by Alchitry Labs 2.0.29-BETA.
    Do not edit this file directly. Instead edit the original Lucid source.
    This is a temporary file and any changes made to it will be destroyed.
*/

module memory_unit #(
        parameter WORDS = 5'h10
    ) (
        input wire clk,
        input wire [($clog2(WORDS) + 2'h2)-1:0] raddr,
        input wire [($clog2(WORDS) + 2'h2)-1:0] waddr,
        input wire [31:0] wd,
        input wire we,
        output reg [31:0] mrd,
        input wire [($clog2(WORDS) + 2'h2)-1:0] ia,
        input wire instruction_we,
        input wire [31:0] instruction_wd,
        output reg [31:0] id
    );
    localparam _MP_WIDTH_1401182257 = 6'h20;
    localparam _MP_ENTRIES_1401182257 = WORDS;
    logic [((($clog2(_MP_ENTRIES_1401182257)-1) - (0) + 1))-1:0] M_instruction_memory_address;
    logic [31:0] M_instruction_memory_read_data;
    logic [31:0] M_instruction_memory_write_data;
    logic M_instruction_memory_write_enable;
    
    simple_ram #(
        .WIDTH(_MP_WIDTH_1401182257),
        .ENTRIES(_MP_ENTRIES_1401182257)
    ) instruction_memory (
        .clk(clk),
        .address(M_instruction_memory_address),
        .read_data(M_instruction_memory_read_data),
        .write_data(M_instruction_memory_write_data),
        .write_enable(M_instruction_memory_write_enable)
    );
    
    
    localparam _MP_WIDTH_585891198 = 6'h20;
    localparam _MP_ENTRIES_585891198 = WORDS;
    logic [((($clog2(_MP_ENTRIES_585891198)-1) - (0) + 1))-1:0] M_data_memory_waddr;
    logic [31:0] M_data_memory_write_data;
    logic M_data_memory_write_enable;
    logic [((($clog2(_MP_ENTRIES_585891198)-1) - (0) + 1))-1:0] M_data_memory_raddr;
    logic [31:0] M_data_memory_read_data;
    
    simple_dual_port_ram #(
        .WIDTH(_MP_WIDTH_585891198),
        .ENTRIES(_MP_ENTRIES_585891198)
    ) data_memory (
        .wclk(clk),
        .rclk(clk),
        .waddr(M_data_memory_waddr),
        .write_data(M_data_memory_write_data),
        .write_enable(M_data_memory_write_enable),
        .raddr(M_data_memory_raddr),
        .read_data(M_data_memory_read_data)
    );
    
    
    always @* begin
        M_instruction_memory_write_data = instruction_wd;
        M_instruction_memory_address = ia[$clog2(WORDS) + 2'h2 - 1'h1:2'h2];
        M_instruction_memory_write_enable = instruction_we;
        id = M_instruction_memory_read_data;
        M_data_memory_raddr = raddr[$clog2(WORDS) + 2'h2 - 1'h1:2'h2];
        M_data_memory_waddr = waddr[$clog2(WORDS) + 2'h2 - 1'h1:2'h2];
        M_data_memory_write_data = wd;
        M_data_memory_write_enable = we;
        mrd = M_data_memory_read_data;
    end
    
    
endmodule