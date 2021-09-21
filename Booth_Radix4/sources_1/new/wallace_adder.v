`timescale 1ns / 1ps
//Implements progressive addition in a wallace tree in the module.
module wallace_adder(
                    input [2*bits-1:0] x1,
                    input [2*bits-1:0] x2,
                    input [2*bits-1:0] x3,
                    output [2*bits-1:0] z,
                    output [2*bits-1:0] c
    );
    parameter bits = 32;
    
    reg [2*bits-1:0] z_reg;
    reg [2*bits-1:0] c_reg;

    always @(x1 or x2 or x3)
    begin
            z_reg = x1 ^ x2 ^ x3;
            c_reg = (x1&x2 | x1&x3 | x2&x3) << 1 ;
    end
    
    assign z = z_reg;
    assign c = c_reg;

endmodule
