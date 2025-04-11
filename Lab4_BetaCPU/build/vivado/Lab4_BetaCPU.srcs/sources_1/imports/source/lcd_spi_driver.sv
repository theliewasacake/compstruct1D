/*
    This file was generated automatically by Alchitry Labs 2.0.30-BETA.
    Do not edit this file directly. Instead edit the original Lucid source.
    This is a temporary file and any changes made to it will be destroyed.
*/

module lcd_spi_driver (
        input wire clk,
        input wire rst,
        input wire [7:0] out_byte,
        input wire dcx_in,
        input wire enable,
        output reg mosi,
        output reg scl,
        output reg dcx_out,
        output reg csx,
        output reg next_byte
    );
    logic D_active_d, D_active_q = 0;
    logic [3:0] D_clock_ctr_d, D_clock_ctr_q = 0;
    logic [2:0] D_bit_ptr_d, D_bit_ptr_q = 0;
    logic [7:0] D_out_byte_cache_d, D_out_byte_cache_q = 0;
    logic D_mosi_enable_d, D_mosi_enable_q = 0;
    logic D_dcx_in_dff_d, D_dcx_in_dff_q = 0;
    logic spi_clock;
    always @* begin
        D_active_d = D_active_q;
        D_dcx_in_dff_d = D_dcx_in_dff_q;
        D_out_byte_cache_d = D_out_byte_cache_q;
        D_clock_ctr_d = D_clock_ctr_q;
        D_mosi_enable_d = D_mosi_enable_q;
        D_bit_ptr_d = D_bit_ptr_q;
        
        if (enable && ~D_active_q) begin
            D_active_d = 1'h1;
            D_dcx_in_dff_d = dcx_in;
            D_out_byte_cache_d = out_byte;
        end
        if (D_active_q) begin
            D_clock_ctr_d = D_clock_ctr_q + 1'h1;
            spi_clock = D_clock_ctr_q[3];
            scl = spi_clock;
            csx = 1'h0;
            if (D_bit_ptr_q == 1'h0 && D_clock_ctr_q == 1'h0) begin
                
            end
            if (D_clock_ctr_q == 3'h5) begin
                D_mosi_enable_d = !D_mosi_enable_q;
            end
            if (D_clock_ctr_q == 4'he) begin
                D_mosi_enable_d = !D_mosi_enable_q;
            end
            if ((&D_clock_ctr_q)) begin
                D_bit_ptr_d = D_bit_ptr_q + 1'h1;
                D_out_byte_cache_d = {D_out_byte_cache_q[6:1'h0], 1'h0};
            end
            mosi = 1'h0;
            if (D_mosi_enable_q) begin
                if (D_out_byte_cache_q[7]) begin
                    mosi = 1'h1;
                end
            end
            if (D_bit_ptr_q == 3'h7) begin
                if ((&D_clock_ctr_q)) begin
                    next_byte = 1'h1;
                    D_active_d = 1'h0;
                end else begin
                    next_byte = 1'h0;
                end
                dcx_out = D_dcx_in_dff_q;
            end else begin
                dcx_out = 1'h0;
                next_byte = 1'h0;
            end
        end else begin
            csx = 1'h1;
            scl = 1'h0;
            dcx_out = 1'h0;
            spi_clock = 1'h0;
            next_byte = 1'h1;
            mosi = 1'h0;
        end
    end
    
    
    always @(posedge (clk)) begin
        if ((rst) == 1'b1) begin
            D_active_q <= 0;
            D_clock_ctr_q <= 0;
            D_bit_ptr_q <= 0;
            D_out_byte_cache_q <= 0;
            D_mosi_enable_q <= 0;
            D_dcx_in_dff_q <= 0;
        end else begin
            D_active_q <= D_active_d;
            D_clock_ctr_q <= D_clock_ctr_d;
            D_bit_ptr_q <= D_bit_ptr_d;
            D_out_byte_cache_q <= D_out_byte_cache_d;
            D_mosi_enable_q <= D_mosi_enable_d;
            D_dcx_in_dff_q <= D_dcx_in_dff_d;
        end
    end
endmodule