/*
    This file was generated automatically by Alchitry Labs 2.0.29-BETA.
    Do not edit this file directly. Instead edit the original Lucid source.
    This is a temporary file and any changes made to it will be destroyed.
*/

module rca #(
        parameter SIZE = 6'h20
    ) (
        input wire [(SIZE)-1:0] a,
        input wire [(SIZE)-1:0] b,
        input wire cin,
        output reg [(SIZE)-1:0] s,
        output reg cout
    );
    logic [31:0] R_4980e6d6_i;
    logic [31:0] RR_4980e6d6_i;
    logic [(SIZE + 1'h1)-1:0] carry;
    logic start = 1'h0;
    logic step = 1'h1;
    logic [(SIZE)-1:0] M_fa_a;
    logic [(SIZE)-1:0] M_fa_b;
    logic [(SIZE)-1:0] M_fa_cin;
    logic [(SIZE)-1:0] M_fa_s;
    logic [(SIZE)-1:0] M_fa_cout;
    
    genvar idx_0_590942530;
    
    generate
        for (idx_0_590942530 = 0; idx_0_590942530 < SIZE; idx_0_590942530 = idx_0_590942530 + 1) begin: forLoop_idx_0_590942530
            fa fa (
                .a(M_fa_a[idx_0_590942530]),
                .b(M_fa_b[idx_0_590942530]),
                .cin(M_fa_cin[idx_0_590942530]),
                .s(M_fa_s[idx_0_590942530]),
                .cout(M_fa_cout[idx_0_590942530])
            );
        end
    endgenerate
    
    
    always @* begin
        carry[1'h0] = cin;
        for (RR_4980e6d6_i = 0; RR_4980e6d6_i < SIZE; RR_4980e6d6_i = RR_4980e6d6_i + 1) begin
      R_4980e6d6_i = (start) + RR_4980e6d6_i * (step);
            M_fa_a[R_4980e6d6_i] = a[R_4980e6d6_i];
            M_fa_b[R_4980e6d6_i] = b[R_4980e6d6_i];
            M_fa_cin[R_4980e6d6_i] = carry[R_4980e6d6_i];
            carry[R_4980e6d6_i + 1'h1] = M_fa_cout[R_4980e6d6_i];
        end
        s = M_fa_s;
        cout = carry[SIZE];
    end
    
    
endmodule