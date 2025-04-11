/*
    This file was generated automatically by Alchitry Labs 2.0.30-BETA.
    Do not edit this file directly. Instead edit the original Lucid source.
    This is a temporary file and any changes made to it will be destroyed.
*/

module instruction_rom #(
        parameter WORDS = 6'h20
    ) (
        input wire [($clog2(WORDS))-1:0] addr,
        output reg [31:0] out,
        output reg [9:0] numinstr
    );
    localparam logic [56:0][31:0] INSTRUCTIONS = {{32'h7be3fffb, 32'h607f0020, 32'h643f0020, 32'h90410800, 32'hc03f0003, 32'h3f39800, 32'h6bff9800, 32'hc27f0000, 32'h6bf39802, 32'hc27f00f8, 32'h6bff9800, 32'hc27f0000, 32'h6bff9800, 32'hc27f00f8, 32'h6bf39802, 32'hc27f0000, 32'h6bff9800, 32'hc27f00f8, 32'h6bff9800, 32'hc27f0000, 32'h6bf39802, 32'hc27f00f8, 32'h6bff9800, 32'hc27f012c, 32'h6bff9800, 32'hc27f0011, 32'h6bf39802, 32'hc27f0000, 32'h6bff9800, 32'hc27f0010, 32'h6bff9800, 32'hc27f0000, 32'h6bf39802, 32'hc27f012b, 32'h6bff9800, 32'hc27f0011, 32'h6bff9800, 32'hc27f0000, 32'h6bf39802, 32'hc27f0010, 32'h6bff9800, 32'hc27f0000, 32'h6bff9800, 32'hc27f012a, 32'h6bf39802, 32'hc27f0129, 32'h6bff9800, 32'hc27f0055, 32'h6bff9800, 32'hc27f013a, 32'h6bf39802, 32'hc27f0048, 32'h6bf39801, 32'hc27f0136, 32'h6bf39800, 32'hc27f0111, 32'h3f39800}};
    localparam NUM_OF_INSTRUCTIONS = 6'h39;
    always @* begin
        if (addr < 6'h39) begin
            out = INSTRUCTIONS[addr];
        end else begin
            out = 1'h0;
        end
        numinstr = 6'h39;
    end
    
    
endmodule