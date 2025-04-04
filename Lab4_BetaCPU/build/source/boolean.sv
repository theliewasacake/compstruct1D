/*
    This file was generated automatically by Alchitry Labs 2.0.29-BETA.
    Do not edit this file directly. Instead edit the original Lucid source.
    This is a temporary file and any changes made to it will be destroyed.
*/

module boolean #(
        parameter SIZE = 6'h20
    ) (
        input wire [(SIZE)-1:0] a,
        input wire [(SIZE)-1:0] b,
        input wire [5:0] alufn,
        output reg [(SIZE)-1:0] bool
    );
    logic [31:0] R_13cdf46f_i;
    logic [31:0] RR_13cdf46f_i;
    logic start = 1'h0;
    logic step = 1'h1;
    logic [31:0] M_mux_4_32_s0;
    logic [31:0] M_mux_4_32_s1;
    logic [31:0][3:0] M_mux_4_32_in;
    logic [31:0] M_mux_4_32_out;
    
    genvar idx_0_1890419877;
    
    generate
        for (idx_0_1890419877 = 0; idx_0_1890419877 < 32; idx_0_1890419877 = idx_0_1890419877 + 1) begin: forLoop_idx_0_1890419877
            mux_4 mux_4_32 (
                .s0(M_mux_4_32_s0[idx_0_1890419877]),
                .s1(M_mux_4_32_s1[idx_0_1890419877]),
                .in(M_mux_4_32_in[idx_0_1890419877]),
                .out(M_mux_4_32_out[idx_0_1890419877])
            );
        end
    endgenerate
    
    
    always @* begin
        M_mux_4_32_in = {6'h20{{alufn[2'h3:1'h0]}}};
        for (RR_13cdf46f_i = 0; RR_13cdf46f_i < 6'h20; RR_13cdf46f_i = RR_13cdf46f_i + 1) begin
      R_13cdf46f_i = (start) + RR_13cdf46f_i * (step);
            M_mux_4_32_s0[R_13cdf46f_i] = a[R_13cdf46f_i];
            M_mux_4_32_s1[R_13cdf46f_i] = b[R_13cdf46f_i];
        end
        bool = M_mux_4_32_out;
    end
    
    
endmodule