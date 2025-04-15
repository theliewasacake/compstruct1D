/*
    This file was generated automatically by Alchitry Labs 2.0.30-BETA.
    Do not edit this file directly. Instead edit the original Lucid source.
    This is a temporary file and any changes made to it will be destroyed.
*/

module player_mode #(
        parameter COLUMN_DIMENSION = 16'h8,
        parameter ROW_DIMENSION = 16'h8,
        parameter PIXEL_COUNT = 16'h40,
        parameter BUFFER_SIZE = 11'h400
    ) (
        input wire clk,
        input wire rst,
        output reg [7:0] led,
        output reg [2:0][7:0] io_led,
        output reg [7:0] io_segment,
        output reg [3:0] io_select,
        input wire left_button,
        input wire right_button,
        input wire start_button,
        output reg data,
        output reg [1:0] debug,
        output reg player_collided
    );
    logic player_collided_out;
    localparam CLK_FREQ = 27'h5f5e100;
    localparam ENCODING_AMOUNT = 3'h4;
    localparam logic [3:0][23:0] LEDCOLOR = {{24'hf0f0f, 24'h30000, 24'h300, 24'h0}};
    localparam _MP_SIZE_483487351 = $clog2(PIXEL_COUNT);
    localparam _MP_COLUMN_DIMENSION_483487351 = COLUMN_DIMENSION;
    logic [(_MP_SIZE_483487351)-1:0] M_index_reverser_input_address;
    logic [(_MP_SIZE_483487351)-1:0] M_index_reverser_output_address;
    
    index_reverser #(
        .SIZE(_MP_SIZE_483487351),
        .COLUMN_DIMENSION(_MP_COLUMN_DIMENSION_483487351)
    ) index_reverser (
        .input_address(M_index_reverser_input_address),
        .output_address(M_index_reverser_output_address)
    );
    
    
    localparam _MP_ROW_DIMENSION_59676216 = ROW_DIMENSION;
    localparam _MP_COLUMN_DIMENSION_59676216 = COLUMN_DIMENSION;
    localparam _MP_ENCODING_AMOUNT_59676216 = 3'h4;
    logic M_ram_update;
    logic [($clog2(_MP_COLUMN_DIMENSION_59676216))-1:0] M_ram_player_x_pos;
    logic [($clog2(_MP_ROW_DIMENSION_59676216))-1:0] M_ram_player_y_pos;
    logic [($clog2((5'h10)'(_MP_ROW_DIMENSION_59676216 * _MP_COLUMN_DIMENSION_59676216)))-1:0] M_ram_address;
    logic [2:0] M_ram_out_encoding;
    logic M_ram_ready;
    logic [($clog2((5'h10)'(_MP_ROW_DIMENSION_59676216 * _MP_COLUMN_DIMENSION_59676216)))-1:0] M_ram_debug_address_pointer;
    logic [1:0] M_ram_debug_data;
    logic M_ram_start_game;
    logic M_ram_player_collided;
    
    data_ram #(
        .ROW_DIMENSION(_MP_ROW_DIMENSION_59676216),
        .COLUMN_DIMENSION(_MP_COLUMN_DIMENSION_59676216),
        .ENCODING_AMOUNT(_MP_ENCODING_AMOUNT_59676216)
    ) ram (
        .start_button(start_button),
        .clk(clk),
        .rst(rst),
        .update(M_ram_update),
        .player_x_pos(M_ram_player_x_pos),
        .player_y_pos(M_ram_player_y_pos),
        .address(M_ram_address),
        .out_encoding(M_ram_out_encoding),
        .ready(M_ram_ready),
        .debug_address_pointer(M_ram_debug_address_pointer),
        .debug_data(M_ram_debug_data),
        .start_game(M_ram_start_game),
        .player_collided(M_ram_player_collided)
    );
    
    
    logic [($clog2(COLUMN_DIMENSION))-1:0] D_player_x_pos_d, D_player_x_pos_q = 2'h3;
    logic [($clog2(ROW_DIMENSION))-1:0] D_player_y_pos_d, D_player_y_pos_q = 1'h0;
    logic D_update_ram_flag_d, D_update_ram_flag_q = 1'h0;
    localparam _MP_PIXEL_COUNT_1179548004 = PIXEL_COUNT;
    logic M_driver_update;
    logic [23:0] M_driver_color;
    logic M_driver_clear;
    logic [($clog2(_MP_PIXEL_COUNT_1179548004))-1:0] M_driver_pixel_address;
    logic M_driver_data;
    logic M_driver_next_pixel;
    logic M_driver_reset;
    logic M_driver_done;
    
    ws2812b_driver #(
        .PIXEL_COUNT(_MP_PIXEL_COUNT_1179548004)
    ) driver (
        .clk(clk),
        .rst(rst),
        .update(M_driver_update),
        .color(M_driver_color),
        .clear(M_driver_clear),
        .pixel_address(M_driver_pixel_address),
        .data(M_driver_data),
        .next_pixel(M_driver_next_pixel),
        .reset(M_driver_reset),
        .done(M_driver_done)
    );
    
    
    logic D_on_off_toggle_d, D_on_off_toggle_q = 1'h1;
    logic D_start_game_d, D_start_game_q = 1'h0;
    logic D_player_collided_outf_d, D_player_collided_outf_q = 1'h0;
    localparam _MP_CLK_FREQ_68984386 = 27'h5f5e100;
    localparam _MP_MIN_DELAY_68984386 = 5'h14;
    localparam _MP_NUM_SYNC_68984386 = 2'h2;
    logic M_left_cond_in;
    logic M_left_cond_out;
    
    button_conditioner #(
        .CLK_FREQ(_MP_CLK_FREQ_68984386),
        .MIN_DELAY(_MP_MIN_DELAY_68984386),
        .NUM_SYNC(_MP_NUM_SYNC_68984386)
    ) left_cond (
        .clk(clk),
        .in(M_left_cond_in),
        .out(M_left_cond_out)
    );
    
    
    localparam _MP_RISE_1435567587 = 1'h1;
    localparam _MP_FALL_1435567587 = 1'h0;
    logic M_left_edge_in;
    logic M_left_edge_out;
    
    edge_detector #(
        .RISE(_MP_RISE_1435567587),
        .FALL(_MP_FALL_1435567587)
    ) left_edge (
        .clk(clk),
        .in(M_left_edge_in),
        .out(M_left_edge_out)
    );
    
    
    localparam _MP_CLK_FREQ_891256733 = 27'h5f5e100;
    localparam _MP_MIN_DELAY_891256733 = 5'h14;
    localparam _MP_NUM_SYNC_891256733 = 2'h2;
    logic M_right_cond_in;
    logic M_right_cond_out;
    
    button_conditioner #(
        .CLK_FREQ(_MP_CLK_FREQ_891256733),
        .MIN_DELAY(_MP_MIN_DELAY_891256733),
        .NUM_SYNC(_MP_NUM_SYNC_891256733)
    ) right_cond (
        .clk(clk),
        .in(M_right_cond_in),
        .out(M_right_cond_out)
    );
    
    
    localparam _MP_RISE_460176990 = 1'h1;
    localparam _MP_FALL_460176990 = 1'h0;
    logic M_right_edge_in;
    logic M_right_edge_out;
    
    edge_detector #(
        .RISE(_MP_RISE_460176990),
        .FALL(_MP_FALL_460176990)
    ) right_edge (
        .clk(clk),
        .in(M_right_edge_in),
        .out(M_right_edge_out)
    );
    
    
    localparam _MP_CLK_FREQ_1438701881 = 27'h5f5e100;
    localparam _MP_MIN_DELAY_1438701881 = 5'h14;
    localparam _MP_NUM_SYNC_1438701881 = 2'h2;
    logic M_start_cond_in;
    logic M_start_cond_out;
    
    button_conditioner #(
        .CLK_FREQ(_MP_CLK_FREQ_1438701881),
        .MIN_DELAY(_MP_MIN_DELAY_1438701881),
        .NUM_SYNC(_MP_NUM_SYNC_1438701881)
    ) start_cond (
        .clk(clk),
        .in(M_start_cond_in),
        .out(M_start_cond_out)
    );
    
    
    localparam _MP_RISE_177427880 = 1'h1;
    localparam _MP_FALL_177427880 = 1'h0;
    logic M_start_edge_in;
    logic M_start_edge_out;
    
    edge_detector #(
        .RISE(_MP_RISE_177427880),
        .FALL(_MP_FALL_177427880)
    ) start_edge (
        .clk(clk),
        .in(M_start_edge_in),
        .out(M_start_edge_out)
    );
    
    
    always @* begin
        D_player_collided_outf_d = D_player_collided_outf_q;
        D_player_x_pos_d = D_player_x_pos_q;
        D_player_y_pos_d = D_player_y_pos_q;
        D_update_ram_flag_d = D_update_ram_flag_q;
        D_on_off_toggle_d = D_on_off_toggle_q;
        D_start_game_d = D_start_game_q;
        
        D_player_collided_outf_d = D_player_collided_outf_q;
        led = 8'h0;
        io_led = {{8'h0, 8'h0, 8'h0}};
        io_segment = 8'hff;
        io_select = 4'hf;
        data = 1'h0;
        M_ram_start_game = 1'h0;
        D_player_x_pos_d = D_player_x_pos_q;
        D_player_y_pos_d = D_player_y_pos_q;
        D_update_ram_flag_d = D_update_ram_flag_q;
        D_on_off_toggle_d = D_on_off_toggle_q;
        D_start_game_d = D_start_game_q;
        M_ram_address = 1'h0;
        M_ram_update = 1'h0;
        M_left_cond_in = left_button;
        M_left_edge_in = M_left_cond_out;
        M_right_cond_in = right_button;
        M_right_edge_in = M_right_cond_out;
        M_start_cond_in = start_button;
        M_start_edge_in = M_start_cond_out;
        M_driver_update = 1'h0;
        M_driver_clear = 1'h0;
        if (M_left_edge_out) begin
            if (D_player_x_pos_q < COLUMN_DIMENSION - 2'h2) begin
                D_player_x_pos_d = D_player_x_pos_q + 1'h1;
            end
        end
        if (M_right_edge_out) begin
            if ((|D_player_x_pos_q)) begin
                D_player_x_pos_d = D_player_x_pos_q - 1'h1;
            end
        end
        if (M_start_edge_out) begin
            M_driver_clear = 1'h1;
            M_ram_start_game = ~D_start_game_q;
        end
        if (M_left_edge_out | M_right_edge_out | (M_start_edge_out & ~D_on_off_toggle_q)) begin
            M_ram_update = 1'h1;
        end
        M_ram_player_x_pos = D_player_x_pos_q;
        M_ram_player_y_pos = D_player_y_pos_q;
        M_index_reverser_input_address = M_driver_pixel_address;
        M_driver_update = D_on_off_toggle_q;
        M_ram_address = M_index_reverser_output_address;
        M_driver_color = LEDCOLOR[M_ram_out_encoding];
        data = M_driver_data;
        io_led[1'h0] = D_player_x_pos_q;
        io_led[1'h1] = D_player_y_pos_q;
        io_led[2'h2] = M_driver_pixel_address;
        debug = M_ram_debug_data;
        led[3'h7:3'h4] = M_ram_debug_data;
        player_collided_out = M_ram_player_collided;
        D_player_collided_outf_d = M_ram_player_collided;
        player_collided = D_player_collided_outf_q;
    end
    
    
    always @(posedge (clk)) begin
        if ((rst) == 1'b1) begin
            D_player_x_pos_q <= 2'h3;
            D_player_y_pos_q <= 1'h0;
            D_update_ram_flag_q <= 1'h0;
            D_on_off_toggle_q <= 1'h1;
            D_start_game_q <= 1'h0;
            D_player_collided_outf_q <= 1'h0;
        end else begin
            D_player_x_pos_q <= D_player_x_pos_d;
            D_player_y_pos_q <= D_player_y_pos_d;
            D_update_ram_flag_q <= D_update_ram_flag_d;
            D_on_off_toggle_q <= D_on_off_toggle_d;
            D_start_game_q <= D_start_game_d;
            D_player_collided_outf_q <= D_player_collided_outf_d;
        end
    end
endmodule