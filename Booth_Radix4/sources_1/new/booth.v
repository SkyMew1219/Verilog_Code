`timescale 1ns / 1ps

module booth(
            input [bits-1:0] x,
            input [bits-1:0] y,
            output [2*bits-1:0] result
    );
    parameter bits = 32;
    
    //Calculate the original code of x,-x,2x,-2x,y.
    reg [bits-1:0] x_reg;
    reg [bits-1:0] _x_reg;
    reg [bits-1:0] y_reg;
    always @(x or y)
    begin
        x_reg = x;
        y_reg = y;
        _x_reg = {~x[bits-1],x[bits-2:0]};
    end
    
    //Compute the complement code of x,-x,2x,-2x,y.
    wire [bits-1:0] x_2c;
    wire [bits-1:0] y_2c;
    wire [bits-1:0] _x_2c;
    sd_2_2c u_2c1(.a(x_reg),.b(x_2c));
    sd_2_2c u_2c2(.a(y_reg),.b(y_2c));
    sd_2_2c u_2c3(.a(_x_reg),.b(_x_2c));

    
    //Bitwise expansion of (x,-x,2x,-2x and y)'s complement.
    reg [2*bits-1:0] x_2c_expand;
    reg [bits+2:0] y_2c_expand;
    reg [2*bits-1:0] _x_2c_expand;
    reg [2*bits-1:0] zx_2c_expand;
    reg [2*bits-1:0] _zx_2c_expand;
    always @(x_2c or y_2c or _x_2c)
    begin
        x_2c_expand = {{bits{x_2c[bits-1]}},x_2c};
        y_2c_expand = {{2{y_2c[bits-1]}},y_2c,1'b0};
        _x_2c_expand = {{bits{_x_2c[bits-1]}},_x_2c};
        zx_2c_expand = x_2c_expand << 1;
        _zx_2c_expand = _x_2c_expand << 1;
    end
    
    //Use a wallace tree to calculate the partial product and sum it.
    wire [2*bits-1:0] result_2c;
    reg [2*bits-1:0] result_2c_reg;
    wallace_tree u_tree(
                        .x(x_2c_expand),
                        .y(y_2c_expand),
                        ._x(_x_2c_expand),
                        .zx(zx_2c_expand),
                        ._zx(_zx_2c_expand),
                        .result(result_2c)
                        );
    always @(result_2c)
    begin
        result_2c_reg = result_2c;
    end
    
    //Complementary codes are converted to original codes and output.
    TwoC_2_sd u_TwoC_2_sd(
                            .a(result_2c_reg),
                            .b(result)
                            );
    
endmodule
