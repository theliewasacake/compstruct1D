/*
    This file was generated automatically by Alchitry Labs 2.0.29-BETA.
    Do not edit this file directly. Instead edit the original Lucid source.
    This is a temporary file and any changes made to it will be destroyed.
*/

module instruction_rom #(
        parameter WORDS = 5'h10
    ) (
        input wire [($clog2(WORDS))-1:0] addr,
        output reg [31:0] out,
        output reg [9:0] numinstr
    );
    localparam logic [4:0][31:0] INSTRUCTIONS = {{32'h7be3fffb, 32'h607f0020, 32'h643f0020, 32'h90410800, 32'hc03f0003}};
    localparam NUM_OF_INSTRUCTIONS = 6'h5;
    always @* begin
        if (addr < 6'h5) begin
            out = INSTRUCTIONS[addr];
        end else begin
            out = 1'h0;
        end
        numinstr = 6'h5;
    end
    
    
endmodule