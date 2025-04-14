/*
    This file was generated automatically by Alchitry Labs 2.0.30-BETA.
    Do not edit this file directly. Instead edit the original Lucid source.
    This is a temporary file and any changes made to it will be destroyed.
*/

module alu (
        input wire [31:0] a,
        input wire [31:0] b,
        input wire [5:0] alufn,
        output reg [31:0] out,
        output reg z,
        output reg v,
        output reg n
    );
    logic [31:0] R_019d22e3_i;
    logic [31:0] RR_019d22e3_i;
    logic [31:0] R_57ef965a_i;
    logic [31:0] RR_57ef965a_i;
    logic [31:0] R_110c4885_i;
    logic [31:0] RR_110c4885_i;
    logic [31:0] M_mux_4_s0;
    logic [31:0] M_mux_4_s1;
    logic [31:0][3:0] M_mux_4_in;
    logic [31:0] M_mux_4_out;
    
    genvar idx_0_1825171426;
    
    generate
        for (idx_0_1825171426 = 0; idx_0_1825171426 < 32; idx_0_1825171426 = idx_0_1825171426 + 1) begin: forLoop_idx_0_1825171426
            mux_4 mux_4 (
                .s0(M_mux_4_s0[idx_0_1825171426]),
                .s1(M_mux_4_s1[idx_0_1825171426]),
                .in(M_mux_4_in[idx_0_1825171426]),
                .out(M_mux_4_out[idx_0_1825171426])
            );
        end
    endgenerate
    
    
    logic [31:0] M_mux_2_s0;
    logic [31:0][1:0] M_mux_2_in;
    logic [31:0] M_mux_2_out;
    
    genvar idx_0_239559318;
    
    generate
        for (idx_0_239559318 = 0; idx_0_239559318 < 32; idx_0_239559318 = idx_0_239559318 + 1) begin: forLoop_idx_0_239559318
            mux_2 mux_2 (
                .s0(M_mux_2_s0[idx_0_239559318]),
                .in(M_mux_2_in[idx_0_239559318]),
                .out(M_mux_2_out[idx_0_239559318])
            );
        end
    endgenerate
    
    
    logic [31:0] M_mux_2_md_s0;
    logic [31:0][1:0] M_mux_2_md_in;
    logic [31:0] M_mux_2_md_out;
    
    genvar idx_0_1970317651;
    
    generate
        for (idx_0_1970317651 = 0; idx_0_1970317651 < 32; idx_0_1970317651 = idx_0_1970317651 + 1) begin: forLoop_idx_0_1970317651
            mux_2 mux_2_md (
                .s0(M_mux_2_md_s0[idx_0_1970317651]),
                .in(M_mux_2_md_in[idx_0_1970317651]),
                .out(M_mux_2_md_out[idx_0_1970317651])
            );
        end
    endgenerate
    
    
    logic [31:0] M_adder_a;
    logic [31:0] M_adder_b;
    logic [5:0] M_adder_alufn;
    logic [31:0] M_adder_out;
    logic M_adder_v;
    logic M_adder_n;
    logic M_adder_z;
    
    adder_32b adder (
        .a(M_adder_a),
        .b(M_adder_b),
        .alufn(M_adder_alufn),
        .out(M_adder_out),
        .v(M_adder_v),
        .n(M_adder_n),
        .z(M_adder_z)
    );
    
    
    logic M_compare_z;
    logic M_compare_v;
    logic M_compare_n;
    logic [5:0] M_compare_alufn;
    logic M_compare_cmp;
    
    compare compare (
        .z(M_compare_z),
        .v(M_compare_v),
        .n(M_compare_n),
        .alufn(M_compare_alufn),
        .cmp(M_compare_cmp)
    );
    
    
    localparam _MP_SIZE_1506207016 = 6'h20;
    logic [31:0] M_boolean_a;
    logic [31:0] M_boolean_b;
    logic [5:0] M_boolean_alufn;
    logic [31:0] M_boolean_bool;
    
    boolean #(
        .SIZE(_MP_SIZE_1506207016)
    ) boolean (
        .a(M_boolean_a),
        .b(M_boolean_b),
        .alufn(M_boolean_alufn),
        .bool(M_boolean_bool)
    );
    
    
    localparam _MP_WIDTH_1696157154 = 6'h20;
    logic [31:0] M_divider_a;
    logic [31:0] M_divider_b;
    logic [31:0] M_divider_div;
    
    divider #(
        .WIDTH(_MP_WIDTH_1696157154)
    ) divider (
        .a(M_divider_a),
        .b(M_divider_b),
        .div(M_divider_div)
    );
    
    
    logic [31:0] M_shifter_a;
    logic [4:0] M_shifter_b;
    logic [5:0] M_shifter_alufn;
    logic [31:0] M_shifter_shift;
    
    shifter shifter (
        .a(M_shifter_a),
        .b(M_shifter_b),
        .alufn(M_shifter_alufn),
        .shift(M_shifter_shift)
    );
    
    
    localparam _MP_WIDTH_1806540143 = 6'h20;
    logic [31:0] M_multiplier_a;
    logic [31:0] M_multiplier_b;
    logic [31:0] M_multiplier_mul;
    
    multiplier #(
        .WIDTH(_MP_WIDTH_1806540143)
    ) multiplier (
        .a(M_multiplier_a),
        .b(M_multiplier_b),
        .mul(M_multiplier_mul)
    );
    
    
    always @* begin
        z = M_adder_z;
        v = M_adder_v;
        n = M_adder_n;
        M_compare_z = M_adder_z;
        M_compare_v = M_adder_v;
        M_compare_n = M_adder_n;
        M_compare_alufn = alufn;
        M_adder_a = a;
        M_adder_b = b;
        M_adder_alufn = alufn;
        M_boolean_a = a;
        M_boolean_b = b;
        M_boolean_alufn = alufn;
        M_shifter_a = a;
        M_shifter_b = b[3'h4:1'h0];
        M_shifter_alufn = alufn;
        M_multiplier_a = a;
        M_multiplier_b = b;
        M_divider_a = a;
        M_divider_b = b;
        for (RR_019d22e3_i = 0; RR_019d22e3_i < 6'h20; RR_019d22e3_i = RR_019d22e3_i + 1) begin
      R_019d22e3_i = (0) + RR_019d22e3_i * (1);
            M_mux_2_md_in[R_019d22e3_i][1'h0] = M_multiplier_mul[R_019d22e3_i];
            M_mux_2_md_in[R_019d22e3_i][1'h1] = M_divider_div[R_019d22e3_i];
            M_mux_2_md_s0[R_019d22e3_i] = alufn[1'h0];
        end
        for (RR_57ef965a_i = 0; RR_57ef965a_i < 6'h20; RR_57ef965a_i = RR_57ef965a_i + 1) begin
      R_57ef965a_i = (0) + RR_57ef965a_i * (1);
            M_mux_2_in[R_57ef965a_i][1'h0] = M_adder_out[R_57ef965a_i];
            M_mux_2_in[R_57ef965a_i][1'h1] = M_mux_2_md_out[R_57ef965a_i];
            M_mux_2_s0[R_57ef965a_i] = alufn[1'h1];
        end
        for (RR_110c4885_i = 0; RR_110c4885_i < 6'h20; RR_110c4885_i = RR_110c4885_i + 1) begin
      R_110c4885_i = (0) + RR_110c4885_i * (1);
            M_mux_4_in[R_110c4885_i][1'h0] = M_mux_2_out[R_110c4885_i];
            M_mux_4_in[R_110c4885_i][1'h1] = M_boolean_bool[R_110c4885_i];
            M_mux_4_in[R_110c4885_i][2'h2] = M_shifter_shift[R_110c4885_i];
            if (R_110c4885_i == 1'h0) begin
                M_mux_4_in[R_110c4885_i][2'h3] = M_compare_cmp;
            end else begin
                M_mux_4_in[R_110c4885_i][2'h3] = 1'h0;
            end
            M_mux_4_s1[R_110c4885_i] = alufn[3'h5];
            M_mux_4_s0[R_110c4885_i] = alufn[3'h4];
        end
        out = M_mux_4_out;
    end
    
    
endmodule