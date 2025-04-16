/*
    This file was generated automatically by Alchitry Labs 2.0.30-BETA.
    Do not edit this file directly. Instead edit the original Lucid source.
    This is a temporary file and any changes made to it will be destroyed.
*/

module alchitry_top (
        input wire clk,
        input wire rst_n,
        output reg [7:0] led,
        input wire usb_rx,
        output reg usb_tx,
        output reg [2:0][7:0] io_led,
        output reg [7:0] io_segment,
        output reg [3:0] io_select,
        input wire [4:0] io_button,
        input wire [2:0][7:0] io_dip,
        output reg data
    );
    localparam COLUMN_DIMENSION = 5'h8;
    localparam ROW_DIMENSION = 5'h8;
    localparam PIXEL_COUNT = 10'h40;
    localparam CLK_FREQ = 27'h5f5e100;
    logic rst;
    localparam _MP_STAGES_271253995 = 3'h4;
    logic M_reset_cond_in;
    logic M_reset_cond_out;
    
    reset_conditioner #(
        .STAGES(_MP_STAGES_271253995)
    ) reset_cond (
        .clk(clk),
        .in(M_reset_cond_in),
        .out(M_reset_cond_out)
    );
    
    
    localparam _MP_RISE_837816514 = 1'h1;
    localparam _MP_FALL_837816514 = 1'h0;
    logic M_left_button_edge_in;
    logic M_left_button_edge_out;
    
    edge_detector #(
        .RISE(_MP_RISE_837816514),
        .FALL(_MP_FALL_837816514)
    ) left_button_edge (
        .clk(clk),
        .in(M_left_button_edge_in),
        .out(M_left_button_edge_out)
    );
    
    
    localparam _MP_RISE_2013522999 = 1'h1;
    localparam _MP_FALL_2013522999 = 1'h0;
    logic M_right_button_edge_in;
    logic M_right_button_edge_out;
    
    edge_detector #(
        .RISE(_MP_RISE_2013522999),
        .FALL(_MP_FALL_2013522999)
    ) right_button_edge (
        .clk(clk),
        .in(M_right_button_edge_in),
        .out(M_right_button_edge_out)
    );
    
    
    localparam _MP_RISE_807746133 = 1'h1;
    localparam _MP_FALL_807746133 = 1'h0;
    logic M_start_button_edge_in;
    logic M_start_button_edge_out;
    
    edge_detector #(
        .RISE(_MP_RISE_807746133),
        .FALL(_MP_FALL_807746133)
    ) start_button_edge (
        .clk(clk),
        .in(M_start_button_edge_in),
        .out(M_start_button_edge_out)
    );
    
    
    localparam _MP_CLK_FREQ_1409687443 = 27'h5f5e100;
    localparam _MP_MIN_DELAY_1409687443 = 5'h14;
    localparam _MP_NUM_SYNC_1409687443 = 2'h2;
    logic M_left_button_cond_in;
    logic M_left_button_cond_out;
    
    button_conditioner #(
        .CLK_FREQ(_MP_CLK_FREQ_1409687443),
        .MIN_DELAY(_MP_MIN_DELAY_1409687443),
        .NUM_SYNC(_MP_NUM_SYNC_1409687443)
    ) left_button_cond (
        .clk(clk),
        .in(M_left_button_cond_in),
        .out(M_left_button_cond_out)
    );
    
    
    localparam _MP_CLK_FREQ_491525373 = 27'h5f5e100;
    localparam _MP_MIN_DELAY_491525373 = 5'h14;
    localparam _MP_NUM_SYNC_491525373 = 2'h2;
    logic M_right_button_cond_in;
    logic M_right_button_cond_out;
    
    button_conditioner #(
        .CLK_FREQ(_MP_CLK_FREQ_491525373),
        .MIN_DELAY(_MP_MIN_DELAY_491525373),
        .NUM_SYNC(_MP_NUM_SYNC_491525373)
    ) right_button_cond (
        .clk(clk),
        .in(M_right_button_cond_in),
        .out(M_right_button_cond_out)
    );
    
    
    localparam _MP_CLK_FREQ_2091300816 = 27'h5f5e100;
    localparam _MP_MIN_DELAY_2091300816 = 5'h14;
    localparam _MP_NUM_SYNC_2091300816 = 2'h2;
    logic M_start_button_cond_in;
    logic M_start_button_cond_out;
    
    button_conditioner #(
        .CLK_FREQ(_MP_CLK_FREQ_2091300816),
        .MIN_DELAY(_MP_MIN_DELAY_2091300816),
        .NUM_SYNC(_MP_NUM_SYNC_2091300816)
    ) start_button_cond (
        .clk(clk),
        .in(M_start_button_cond_in),
        .out(M_start_button_cond_out)
    );
    
    
    localparam _MP_SLOW_CLOCK_DIV_371643271 = 3'h5;
    localparam _MP_FAST_CLOCK_DIV_371643271 = 2'h2;
    logic M_game_datapath_left_button;
    logic M_game_datapath_right_button;
    logic M_game_datapath_start_button;
    logic [3:0] M_game_datapath_debug_general;
    logic M_game_datapath_data;
    
    datapath #(
        .SLOW_CLOCK_DIV(_MP_SLOW_CLOCK_DIV_371643271),
        .FAST_CLOCK_DIV(_MP_FAST_CLOCK_DIV_371643271)
    ) game_datapath (
        .clk(clk),
        .rst(rst),
        .left_button(M_game_datapath_left_button),
        .right_button(M_game_datapath_right_button),
        .start_button(M_game_datapath_start_button),
        .debug_general(M_game_datapath_debug_general),
        .data(M_game_datapath_data)
    );
    
    
    localparam _MP_COLUMN_DIMENSION_852281702 = 5'h8;
    localparam _MP_ROW_DIMENSION_852281702 = 5'h8;
    localparam _MP_PIXEL_COUNT_852281702 = 10'h40;
    localparam _MP_BUFFER_SIZE_852281702 = 11'h400;
    logic [7:0] M_player_mode_led;
    logic [2:0][7:0] M_player_mode_io_led;
    logic [7:0] M_player_mode_io_segment;
    logic [3:0] M_player_mode_io_select;
    logic M_player_mode_data;
    logic [1:0] M_player_mode_debug;
    logic M_player_mode_player_collided;
    
    player_mode #(
        .COLUMN_DIMENSION(_MP_COLUMN_DIMENSION_852281702),
        .ROW_DIMENSION(_MP_ROW_DIMENSION_852281702),
        .PIXEL_COUNT(_MP_PIXEL_COUNT_852281702),
        .BUFFER_SIZE(_MP_BUFFER_SIZE_852281702)
    ) player_mode (
        .left_button(io_button[1'h1]),
        .right_button(io_button[1'h0]),
        .start_button(io_button[2'h2]),
        .clk(clk),
        .rst(rst),
        .led(M_player_mode_led),
        .io_led(M_player_mode_io_led),
        .io_segment(M_player_mode_io_segment),
        .io_select(M_player_mode_io_select),
        .data(M_player_mode_data),
        .debug(M_player_mode_debug),
        .player_collided(M_player_mode_player_collided)
    );
    
    
    always @* begin
        M_reset_cond_in = ~rst_n;
        rst = M_reset_cond_out;
        led = 8'h0;
        io_led = {{8'h0, 8'h0, 8'h0}};
        io_segment = 8'hf0;
        io_select = 4'h0;
        M_left_button_cond_in = io_button[1'h0];
        M_left_button_edge_in = M_left_button_cond_out;
        M_right_button_cond_in = io_button[1'h1];
        M_right_button_edge_in = M_right_button_cond_out;
        M_start_button_cond_in = io_button[2'h2];
        M_start_button_edge_in = M_start_button_cond_out;
        M_game_datapath_left_button = M_left_button_edge_out;
        M_game_datapath_right_button = M_right_button_edge_out;
        M_game_datapath_start_button = M_start_button_edge_out;
        io_led[1'h0][2'h2] = M_player_mode_debug[1'h0];
        io_led[1'h0][2'h3] = M_player_mode_debug[1'h1];
        data = M_player_mode_data;
        usb_tx = usb_rx;
    end
    
    
endmodule