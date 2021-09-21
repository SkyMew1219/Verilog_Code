`timescale 1ns / 1ps
//Convert the original code to a complementary code by this module.
module sd_2_2c (
    input  [bits-1:0] a,
    output  [bits-1:0] b
);
    parameter bits = 32;
    
    reg  [bits-1:0] b_reg;
    always @(a)
        begin
        if(a[bits-1] == 0)
        begin
            b_reg = a;
        end
        else
        begin
            b_reg[bits-1] = a[bits-1];
            b_reg[bits-2:0] = ~a[bits-2:0] + 1;
        end
    end
    
    assign b = b_reg;
    
endmodule