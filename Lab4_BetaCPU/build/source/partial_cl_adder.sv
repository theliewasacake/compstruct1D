/*
    This file was generated automatically by Alchitry Labs 2.0.30-BETA.
    Do not edit this file directly. Instead edit the original Lucid source.
    This is a temporary file and any changes made to it will be destroyed.
*/

module partial_cl_adder (
        input wire a,
        input wire b,
        input wire c,
        output reg s,
        output reg p,
        output reg g
    );
    logic i1;
    always @* begin
        i1 = a ^ b;
        s = i1 ^ c;
        g = a & b;
        p = i1;
    end
    
    
endmodule