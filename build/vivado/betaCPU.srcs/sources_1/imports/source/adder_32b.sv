/*
    This file was generated automatically by Alchitry Labs 2.0.27-BETA.
    Do not edit this file directly. Instead edit the original Lucid source.
    This is a temporary file and any changes made to it will be destroyed.
*/

module adder_32b (
        input wire [31:0] a,
        input wire [31:0] b,
        input wire alufn0,
        output reg [31:0] s,
        output reg v,
        output reg n,
        output reg z
    );
    logic [2:0] R_0bbd472a_i;
    logic [3:0] RR_0bbd472a_i;
    logic [7:0][3:0] M_adder_4b_a;
    logic [7:0][3:0] M_adder_4b_b;
    logic [7:0] M_adder_4b_c;
    logic [7:0][3:0] M_adder_4b_s;
    logic [7:0] M_adder_4b_pg;
    logic [7:0] M_adder_4b_gg;
    logic [7:0] M_adder_4b_cg;
    
    genvar idx_0_2077103879;
    
    generate
        for (idx_0_2077103879 = 0; idx_0_2077103879 < 8; idx_0_2077103879 = idx_0_2077103879 + 1) begin: forLoop_idx_0_2077103879
            cl_4b_adder adder_4b (
                .a(M_adder_4b_a[idx_0_2077103879]),
                .b(M_adder_4b_b[idx_0_2077103879]),
                .c(M_adder_4b_c[idx_0_2077103879]),
                .s(M_adder_4b_s[idx_0_2077103879]),
                .pg(M_adder_4b_pg[idx_0_2077103879]),
                .gg(M_adder_4b_gg[idx_0_2077103879]),
                .cg(M_adder_4b_cg[idx_0_2077103879])
            );
        end
    endgenerate
    
    
    logic [31:0] t;
    logic [31:0] xb;
    logic [7:0] ci2;
    always @* begin
        t = 1'h0;
        xb = b ^ {6'h20{alufn0}};
        v = 1'h0;
        s = 1'h0;
        z = 1'h0;
        n = 1'h0;
        for (RR_0bbd472a_i = 0; RR_0bbd472a_i < 4'h8; RR_0bbd472a_i = RR_0bbd472a_i + 1) begin
      R_0bbd472a_i = (0) + RR_0bbd472a_i * (1);
            M_adder_4b_a[R_0bbd472a_i] = a[R_0bbd472a_i * 3'h4+:3'h4];
            M_adder_4b_b[R_0bbd472a_i] = b[R_0bbd472a_i * 3'h4+:3'h4];
            if (R_0bbd472a_i == 1'h0) begin
                ci2[R_0bbd472a_i] = alufn0;
            end else begin
                ci2[R_0bbd472a_i] = M_adder_4b_gg[R_0bbd472a_i - 1'h1] | (M_adder_4b_pg[R_0bbd472a_i - 1'h1] & ci2[R_0bbd472a_i - 1'h1]);
            end
            M_adder_4b_c[R_0bbd472a_i] = ci2[R_0bbd472a_i];
        end
        t = M_adder_4b_s;
        v = (a[31] & xb[31] & ~t[31]) | (~a[31] & ~xb[31] & t[31]);
        s = t;
        z = ~(|t);
        n = t[31];
    end
    
    
endmodule