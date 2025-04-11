/*
    This file was generated automatically by Alchitry Labs 2.0.30-BETA.
    Do not edit this file directly. Instead edit the original Lucid source.
    This is a temporary file and any changes made to it will be destroyed.
*/

module beta_manual_tester #(
        parameter CLK_FREQ = 10'h3e8
    ) (
        input wire clk,
        input wire rst,
        input wire acc_in,
        output reg [2:0] acc,
        output reg [3:0] lcd,
        output reg [7:0] led,
        output reg [2:0][7:0] io_led,
        output reg [7:0] io_segment,
        output reg [3:0] io_select,
        input wire [4:0] io_button,
        input wire [2:0][7:0] io_dip
    );
    logic next;
    logic [15:0] debug_pcsel;
    logic [15:0] debug_asel;
    logic [15:0] debug_bsel;
    logic [15:0] debug_wdsel;
    logic [2:0] M_motherboard_irq;
    logic M_motherboard_slowclk;
    logic M_motherboard_acc_miso;
    logic [31:0] M_motherboard_id;
    logic [31:0] M_motherboard_ia;
    logic [31:0] M_motherboard_ma;
    logic [31:0] M_motherboard_mrd;
    logic [31:0] M_motherboard_mwd;
    logic [31:0] M_motherboard_output_buffer;
    logic [31:0] M_motherboard_input_buffer;
    logic [3:0] M_motherboard_lcd_spi_out;
    logic [2:0] M_motherboard_acc_spi_out;
    logic [3:0][15:0] M_motherboard_debug;
    
    motherboard motherboard (
        .clk(clk),
        .rst(rst),
        .irq(M_motherboard_irq),
        .slowclk(M_motherboard_slowclk),
        .acc_miso(M_motherboard_acc_miso),
        .id(M_motherboard_id),
        .ia(M_motherboard_ia),
        .ma(M_motherboard_ma),
        .mrd(M_motherboard_mrd),
        .mwd(M_motherboard_mwd),
        .output_buffer(M_motherboard_output_buffer),
        .input_buffer(M_motherboard_input_buffer),
        .lcd_spi_out(M_motherboard_lcd_spi_out),
        .acc_spi_out(M_motherboard_acc_spi_out),
        .debug(M_motherboard_debug)
    );
    
    
    localparam _MP_CLK_FREQ_1700518151 = CLK_FREQ;
    localparam _MP_MIN_DELAY_1700518151 = 5'h14;
    localparam _MP_NUM_SYNC_1700518151 = 2'h2;
    logic M_next_button_conditioner_in;
    logic M_next_button_conditioner_out;
    
    button_conditioner #(
        .CLK_FREQ(_MP_CLK_FREQ_1700518151),
        .MIN_DELAY(_MP_MIN_DELAY_1700518151),
        .NUM_SYNC(_MP_NUM_SYNC_1700518151)
    ) next_button_conditioner (
        .clk(clk),
        .in(M_next_button_conditioner_in),
        .out(M_next_button_conditioner_out)
    );
    
    
    localparam _MP_RISE_566057598 = 1'h1;
    localparam _MP_FALL_566057598 = 1'h0;
    logic M_next_button_edge_in;
    logic M_next_button_edge_out;
    
    edge_detector #(
        .RISE(_MP_RISE_566057598),
        .FALL(_MP_FALL_566057598)
    ) next_button_edge (
        .clk(clk),
        .in(M_next_button_edge_in),
        .out(M_next_button_edge_out)
    );
    
    
    localparam logic [2:0][31:0] _MP_CLK_FREQ_1655657595 = {2'h3{{(6'h20)'(CLK_FREQ)}}};
    localparam _MP_MIN_DELAY_1655657595 = 5'h14;
    localparam _MP_NUM_SYNC_1655657595 = 2'h2;
    logic [2:0] M_interrupt_button_conditioner_in;
    logic [2:0] M_interrupt_button_conditioner_out;
    logic [2:0] M_interrupt_button_conditioner_clk = {2'h3{clk}};
    
    genvar idx_0_1655657595;
    
    generate
        for (idx_0_1655657595 = 0; idx_0_1655657595 < 3; idx_0_1655657595 = idx_0_1655657595 + 1) begin: forLoop_idx_0_1655657595
            button_conditioner #(
                .CLK_FREQ(_MP_CLK_FREQ_1655657595[idx_0_1655657595]),
                .MIN_DELAY(_MP_MIN_DELAY_1655657595),
                .NUM_SYNC(_MP_NUM_SYNC_1655657595)
            ) interrupt_button_conditioner (
                .clk(M_interrupt_button_conditioner_clk[idx_0_1655657595]),
                .in(M_interrupt_button_conditioner_in[idx_0_1655657595]),
                .out(M_interrupt_button_conditioner_out[idx_0_1655657595])
            );
        end
    endgenerate
    
    
    localparam logic [2:0][0:0] _MP_RISE_1147879320 = {{1'h1, 1'h1, 1'h1}};
    localparam logic [2:0][0:0] _MP_FALL_1147879320 = {{1'h0, 1'h0, 1'h0}};
    logic [2:0] M_interrupt_button_edge_in;
    logic [2:0] M_interrupt_button_edge_out;
    logic [2:0] M_interrupt_button_edge_clk = {2'h3{clk}};
    
    genvar idx_0_1147879320;
    
    generate
        for (idx_0_1147879320 = 0; idx_0_1147879320 < 3; idx_0_1147879320 = idx_0_1147879320 + 1) begin: forLoop_idx_0_1147879320
            edge_detector #(
                .RISE(_MP_RISE_1147879320[idx_0_1147879320]),
                .FALL(_MP_FALL_1147879320[idx_0_1147879320])
            ) interrupt_button_edge (
                .clk(M_interrupt_button_edge_clk[idx_0_1147879320]),
                .in(M_interrupt_button_edge_in[idx_0_1147879320]),
                .out(M_interrupt_button_edge_out[idx_0_1147879320])
            );
        end
    endgenerate
    
    
    localparam _MP_SIZE_572601436 = 5'h1c;
    localparam _MP_DIV_572601436 = 1'h0;
    localparam _MP_TOP_572601436 = 1'h0;
    localparam _MP_UP_572601436 = 1'h1;
    logic [27:0] M_frequency_divider_value;
    
    counter #(
        .SIZE(_MP_SIZE_572601436),
        .DIV(_MP_DIV_572601436),
        .TOP(_MP_TOP_572601436),
        .UP(_MP_UP_572601436)
    ) frequency_divider (
        .clk(clk),
        .rst(rst),
        .value(M_frequency_divider_value)
    );
    
    
    localparam _MP_RISE_1018519059 = 1'h1;
    localparam _MP_FALL_1018519059 = 1'h0;
    logic M_slowclock_edge_in;
    logic M_slowclock_edge_out;
    
    edge_detector #(
        .RISE(_MP_RISE_1018519059),
        .FALL(_MP_FALL_1018519059)
    ) slowclock_edge (
        .clk(clk),
        .in(M_slowclock_edge_in),
        .out(M_slowclock_edge_out)
    );
    
    
    localparam _MP_RISE_140110788 = 1'h1;
    localparam _MP_FALL_140110788 = 1'h0;
    logic M_fastclock_edge_in;
    logic M_fastclock_edge_out;
    
    edge_detector #(
        .RISE(_MP_RISE_140110788),
        .FALL(_MP_FALL_140110788)
    ) fastclock_edge (
        .clk(clk),
        .in(M_fastclock_edge_in),
        .out(M_fastclock_edge_out)
    );
    
    
    localparam _MP_DIGITS_38054474 = 3'h4;
    localparam _MP_DIV_38054474 = 5'h10;
    logic [3:0][3:0] M_seg_values;
    logic [6:0] M_seg_seg;
    logic [3:0] M_seg_sel;
    
    multi_seven_seg #(
        .DIGITS(_MP_DIGITS_38054474),
        .DIV(_MP_DIV_38054474)
    ) seg (
        .clk(clk),
        .rst(rst),
        .values(M_seg_values),
        .seg(M_seg_seg),
        .sel(M_seg_sel)
    );
    
    
    always @* begin
        io_led = {{8'h0, 8'h0, 8'h0}};
        io_segment = 8'hff;
        io_select = 4'hf;
        lcd = M_motherboard_lcd_spi_out;
        M_motherboard_acc_miso = acc_in;
        acc = M_motherboard_acc_spi_out;
        led = {3'h0, io_button};
        io_led[2'h2][3'h7] = io_dip[2'h2][3'h7];
        io_led[2'h2][3'h6] = io_dip[2'h2][3'h6];
        io_led[2'h2][3'h5] = M_frequency_divider_value[5'h1b];
        io_led[2'h2][3'h4] = M_frequency_divider_value[4'h8];
        M_next_button_conditioner_in = io_button[3'h4];
        M_next_button_edge_in = M_next_button_conditioner_out;
        M_slowclock_edge_in = M_frequency_divider_value[5'h1b];
        M_fastclock_edge_in = M_frequency_divider_value[4'h8];
        M_interrupt_button_conditioner_in = io_button[2'h2:1'h0];
        M_interrupt_button_edge_in = M_interrupt_button_conditioner_out;
        M_motherboard_irq = M_interrupt_button_edge_out;
        next = (M_slowclock_edge_out & io_dip[2'h2][3'h7]) | M_next_button_edge_out;
        if (io_dip[2'h2][3'h6]) begin
            next = (M_fastclock_edge_out & io_dip[2'h2][3'h7]) | M_next_button_edge_out;
        end
        M_motherboard_slowclk = next;
        M_seg_values = {{4'h0, 4'h0, 4'h0, 4'h0}};
        io_segment = ~M_seg_seg;
        io_select = ~M_seg_sel;
        debug_pcsel = M_motherboard_debug[1'h0];
        debug_asel = M_motherboard_debug[1'h1];
        debug_bsel = M_motherboard_debug[2'h2];
        debug_wdsel = M_motherboard_debug[2'h3];
        
        case (io_dip[1'h0])
            8'h0: begin
                io_led[1'h0] = M_motherboard_id[5'h17:5'h10];
                io_led[1'h1] = M_motherboard_id[5'h1f:5'h18];
                M_seg_values = {M_motherboard_id[5'h1f:5'h1c], M_motherboard_id[5'h1b:5'h18], M_motherboard_id[5'h17:5'h14], M_motherboard_id[5'h13:5'h10]};
            end
            8'h1: begin
                io_led[1'h0] = M_motherboard_id[3'h7:1'h0];
                io_led[1'h1] = M_motherboard_id[4'hf:4'h8];
                M_seg_values = {M_motherboard_id[4'hf:4'hc], M_motherboard_id[4'hb:4'h8], M_motherboard_id[3'h7:3'h4], M_motherboard_id[2'h3:1'h0]};
            end
            8'h2: begin
                io_led[1'h0] = M_motherboard_ia[3'h7:1'h0];
                io_led[1'h1] = M_motherboard_ia[4'hf:4'h8];
                M_seg_values = {M_motherboard_ia[4'hf:4'hc], M_motherboard_ia[4'hb:4'h8], M_motherboard_ia[3'h7:3'h4], M_motherboard_ia[2'h3:1'h0]};
            end
            8'h3: begin
                io_led[1'h0] = M_motherboard_ma[3'h7:1'h0];
                io_led[1'h1] = M_motherboard_ma[4'hf:4'h8];
                M_seg_values = {M_motherboard_ma[4'hf:4'hc], M_motherboard_ma[4'hb:4'h8], M_motherboard_ma[3'h7:3'h4], M_motherboard_ma[2'h3:1'h0]};
            end
            8'h4: begin
                io_led[1'h0] = M_motherboard_ma[5'h17:5'h10];
                io_led[1'h1] = M_motherboard_ma[5'h1f:5'h18];
                M_seg_values = {M_motherboard_ma[5'h1f:5'h1c], M_motherboard_ma[5'h1b:5'h18], M_motherboard_ma[5'h17:5'h14], M_motherboard_ma[5'h13:5'h10]};
            end
            8'h5: begin
                io_led[1'h0] = M_motherboard_mrd[3'h7:1'h0];
                io_led[1'h1] = M_motherboard_mrd[4'hf:4'h8];
                M_seg_values = {M_motherboard_mrd[4'hf:4'hc], M_motherboard_mrd[4'hb:4'h8], M_motherboard_mrd[3'h7:3'h4], M_motherboard_mrd[2'h3:1'h0]};
            end
            8'h6: begin
                io_led[1'h0] = M_motherboard_mrd[5'h17:5'h10];
                io_led[1'h1] = M_motherboard_mrd[5'h1f:5'h18];
                M_seg_values = {M_motherboard_mrd[5'h1f:5'h1c], M_motherboard_mrd[5'h1b:5'h18], M_motherboard_mrd[5'h17:5'h14], M_motherboard_mrd[5'h13:5'h10]};
            end
            8'h7: begin
                io_led[1'h0] = M_motherboard_mwd[3'h7:1'h0];
                io_led[1'h1] = M_motherboard_mwd[4'hf:4'h8];
                M_seg_values = {M_motherboard_mwd[4'hf:4'hc], M_motherboard_mwd[4'hb:4'h8], M_motherboard_mwd[3'h7:3'h4], M_motherboard_mwd[2'h3:1'h0]};
            end
            8'h8: begin
                io_led[1'h0] = M_motherboard_mwd[5'h17:5'h10];
                io_led[1'h1] = M_motherboard_mwd[5'h1f:5'h18];
                M_seg_values = {M_motherboard_mwd[5'h1f:5'h1c], M_motherboard_mwd[5'h1b:5'h18], M_motherboard_mwd[5'h17:5'h14], M_motherboard_mwd[5'h13:5'h10]};
            end
            8'h9: begin
                io_led[1'h0] = debug_pcsel[3'h7:1'h0];
                io_led[1'h1] = debug_pcsel[4'hf:4'h8];
                M_seg_values = {debug_pcsel[4'hf:4'hc], debug_pcsel[4'hb:4'h8], debug_pcsel[3'h7:3'h4], debug_pcsel[2'h3:1'h0]};
            end
            8'ha: begin
                io_led[1'h0] = debug_asel[3'h7:1'h0];
                io_led[1'h1] = debug_asel[4'hf:4'h8];
                M_seg_values = {debug_asel[4'hf:4'hc], debug_asel[4'hb:4'h8], debug_asel[3'h7:3'h4], debug_asel[2'h3:1'h0]};
            end
            8'hb: begin
                io_led[1'h0] = debug_bsel[3'h7:1'h0];
                io_led[1'h1] = debug_bsel[4'hf:4'h8];
                M_seg_values = {debug_bsel[4'hf:4'hc], debug_bsel[4'hb:4'h8], debug_bsel[3'h7:3'h4], debug_bsel[2'h3:1'h0]};
            end
            8'hc: begin
                io_led[1'h0] = debug_wdsel[3'h7:1'h0];
                io_led[1'h1] = debug_wdsel[4'hf:4'h8];
                M_seg_values = {debug_wdsel[4'hf:4'hc], debug_wdsel[4'hb:4'h8], debug_wdsel[3'h7:3'h4], debug_wdsel[2'h3:1'h0]};
            end
            8'hd: begin
                io_led[1'h0] = M_motherboard_ia[5'h1f:5'h18];
                io_led[1'h1] = M_motherboard_ia[5'h17:5'h10];
                M_seg_values = {M_motherboard_ia[5'h1f:5'h1c], M_motherboard_ia[5'h1b:5'h18], M_motherboard_ia[5'h17:5'h14], M_motherboard_ia[5'h13:5'h10]};
            end
            8'he: begin
                io_led[1'h1:1'h0] = {M_motherboard_input_buffer[4'hf:4'h8], M_motherboard_input_buffer[3'h7:1'h0]};
                M_seg_values = {M_motherboard_input_buffer[4'hf:4'hc], M_motherboard_input_buffer[4'hb:4'h8], M_motherboard_input_buffer[3'h7:3'h4], M_motherboard_input_buffer[2'h3:1'h0]};
            end
            8'hf: begin
                io_led[1'h1:1'h0] = {M_motherboard_output_buffer[4'hf:4'h8], M_motherboard_output_buffer[3'h7:1'h0]};
                M_seg_values = {M_motherboard_output_buffer[4'hf:4'hc], M_motherboard_output_buffer[4'hb:4'h8], M_motherboard_output_buffer[3'h7:3'h4], M_motherboard_output_buffer[2'h3:1'h0]};
            end
        endcase
    end
    
    
endmodule