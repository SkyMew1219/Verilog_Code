`timescale 1ns / 1ps
//Convert complementary codes to original codes by this module.
module TwoC_2_sd(
    input  [2*bits-1:0] a,
    output  [2*bits-1:0] b
                );
    parameter bits = 32;
    
    reg  [2*bits-1:0] b_reg;
    always @(a)
        begin
        if(a[2*bits-1] == 0 & a[2*bits-2] == 0)
        begin
            b_reg = a;
        end
        else
        begin
            b_reg[2*bits-1:2*bits-2] = a[2*bits-1:2*bits-2];
            b_reg[2*bits-3:0] = ~(a[2*bits-3:0] - 1);
        end
    end
    
    assign b = b_reg;
    
endmodule
