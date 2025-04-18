/*
    This file was generated automatically by Alchitry Labs 2.0.30-BETA.
    Do not edit this file directly. Instead edit the original Lucid source.
    This is a temporary file and any changes made to it will be destroyed.
*/

module register_files (
        input wire clk,
        input wire rst,
        input wire [2:0] wa,
        input wire we,
        input wire [31:0] data,
        input wire [2:0] ra1,
        input wire [2:0] ra2,
        output reg [31:0] rd1,
        output reg [31:0] rd2,
        output reg [31:0] player_x_data
    );
    logic [31:0] D_player_lives_d, D_player_lives_q = 1'h0;
    logic [31:0] D_player_score_d, D_player_score_q = 1'h0;
    logic [31:0] D_player_x_d, D_player_x_q = 1'h0;
    logic [31:0] D_player_y_d, D_player_y_q = 1'h0;
    logic [31:0] D_dot_x_d, D_dot_x_q = 1'h0;
    logic [31:0] D_dot_y_d, D_dot_y_q = 1'h0;
    logic D_collisionFlag_d, D_collisionFlag_q = 1'h0;
    always @* begin
        D_player_lives_d = D_player_lives_q;
        D_player_score_d = D_player_score_q;
        D_player_x_d = D_player_x_q;
        D_player_y_d = D_player_y_q;
        D_dot_x_d = D_dot_x_q;
        D_dot_y_d = D_dot_y_q;
        D_collisionFlag_d = D_collisionFlag_q;
        
        if (we) begin
            
            case (wa)
                1'h0: begin
                    D_player_lives_d = data;
                end
                1'h1: begin
                    D_player_score_d = data;
                end
                2'h2: begin
                    D_player_x_d = data;
                end
                2'h3: begin
                    D_player_y_d = data;
                end
                3'h4: begin
                    D_dot_x_d = data;
                end
                3'h5: begin
                    D_dot_y_d = data;
                end
                3'h6: begin
                    D_collisionFlag_d = data[1'h0];
                end
            endcase
        end
        
        case (ra1)
            1'h0: begin
                rd1 = D_player_lives_q;
            end
            1'h1: begin
                rd1 = D_player_score_q;
            end
            2'h2: begin
                rd1 = D_player_x_q;
            end
            2'h3: begin
                rd1 = D_player_y_q;
            end
            3'h4: begin
                rd1 = D_dot_x_q;
            end
            3'h5: begin
                rd1 = D_dot_y_q;
            end
            3'h6: begin
                rd1 = D_collisionFlag_q;
            end
            default: begin
                rd1 = 1'h0;
            end
        endcase
        
        case (ra2)
            1'h0: begin
                rd2 = D_player_lives_q;
            end
            1'h1: begin
                rd2 = D_player_score_q;
            end
            2'h2: begin
                rd2 = D_player_x_q;
            end
            2'h3: begin
                rd2 = D_player_y_q;
            end
            3'h4: begin
                rd2 = D_dot_x_q;
            end
            3'h5: begin
                rd2 = D_dot_y_q;
            end
            3'h6: begin
                rd2 = D_collisionFlag_q;
            end
            default: begin
                rd2 = 1'h0;
            end
        endcase
        player_x_data = D_player_x_q;
    end
    
    
    always @(posedge (clk)) begin
        if ((rst) == 1'b1) begin
            D_player_lives_q <= 1'h0;
            D_player_score_q <= 1'h0;
            D_player_x_q <= 1'h0;
            D_player_y_q <= 1'h0;
            D_dot_x_q <= 1'h0;
            D_dot_y_q <= 1'h0;
            D_collisionFlag_q <= 1'h0;
        end else begin
            D_player_lives_q <= D_player_lives_d;
            D_player_score_q <= D_player_score_d;
            D_player_x_q <= D_player_x_d;
            D_player_y_q <= D_player_y_d;
            D_dot_x_q <= D_dot_x_d;
            D_dot_y_q <= D_dot_y_d;
            D_collisionFlag_q <= D_collisionFlag_d;
        end
    end
endmodule