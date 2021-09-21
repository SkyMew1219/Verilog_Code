`timescale 1ns / 1ps
//Implements a wallace tree
module wallace_tree(
                    input [2*bits-1:0] x,
                    input [bits+2:0] y,
                    input [2*bits-1:0] _x,
                    input [2*bits-1:0] zx,
                    input [2*bits-1:0] _zx,
                    output [2*bits-1:0] result
                    
    );
    parameter bits = 32 ;
    
    //Save the complement values of x,-x,2x,-2x and y into the registers.
    reg [2*bits-1:0] x_reg;
    reg [bits+2:0] y_reg;
    reg [2*bits-1:0] _x_reg;
    reg [2*bits-1:0] zx_reg;
    reg [2*bits-1:0] _zx_reg;
    always @(x or _x or zx or _zx or y)
    begin
        x_reg = x;
        y_reg = y;
        _x_reg = _x;
        zx_reg = zx;
        _zx_reg = _zx;
    end
    
    //Generate  part-products.
    reg [2*bits-1:0] part_product1 [16:0];
    always @(x_reg or y_reg or _x_reg or zx_reg or _zx_reg)
    begin
        case(y_reg[2:0])    //synthesis full_case
            3'b000: part_product1[0] = 0;
            3'b001: part_product1[0] = x_reg;
            3'b010: part_product1[0] = x_reg;
            3'b011: part_product1[0] = zx_reg;
            3'b100: part_product1[0] = _zx_reg;
            3'b101: part_product1[0] = _x_reg;
            3'b110: part_product1[0] = _x_reg;
            3'b111: part_product1[0] = 0;
        endcase
        
        case(y_reg[4:2])    //synthesis full_case
            3'b000: part_product1[1] = 0 << 2;
            3'b001: part_product1[1] = x_reg << 2;
            3'b010: part_product1[1] = x_reg << 2;
            3'b011: part_product1[1] = zx_reg << 2;
            3'b100: part_product1[1] = _zx_reg << 2;
            3'b101: part_product1[1] = _x_reg << 2;
            3'b110: part_product1[1] = _x_reg << 2;
            3'b111: part_product1[1] = 0 << 2;
        endcase
        
        case(y_reg[6:4])    //synthesis full_case
            3'b000: part_product1[2] = 0 << 4;
            3'b001: part_product1[2] = x_reg << 4;
            3'b010: part_product1[2] = x_reg << 4;
            3'b011: part_product1[2] = zx_reg << 4;
            3'b100: part_product1[2] = _zx_reg << 4;
            3'b101: part_product1[2] = _x_reg << 4;
            3'b110: part_product1[2] = _x_reg << 4;
            3'b111: part_product1[2] = 0 << 4;
        endcase
        
        case(y_reg[8:6])    //synthesis full_case
            3'b000: part_product1[3] = 0 << 6;
            3'b001: part_product1[3] = x_reg << 6;
            3'b010: part_product1[3] = x_reg << 6;
            3'b011: part_product1[3] = zx_reg << 6;
            3'b100: part_product1[3] = _zx_reg << 6;
            3'b101: part_product1[3] = _x_reg << 6;
            3'b110: part_product1[3] = _x_reg << 6;
            3'b111: part_product1[3] = 0 << 6;
        endcase
        
        case(y_reg[10:8])    //synthesis full_case
            3'b000: part_product1[4] = 0 << 8;
            3'b001: part_product1[4] = x_reg << 8;
            3'b010: part_product1[4] = x_reg << 8;
            3'b011: part_product1[4] = zx_reg << 8;
            3'b100: part_product1[4] = _zx_reg << 8;
            3'b101: part_product1[4] = _x_reg << 8;
            3'b110: part_product1[4] = _x_reg << 8;
            3'b111: part_product1[4] = 0 << 8;
        endcase
        
        case(y_reg[12:10])    //synthesis full_case
            3'b000: part_product1[5] = 0 << 10;
            3'b001: part_product1[5] = x_reg << 10;
            3'b010: part_product1[5] = x_reg << 10;
            3'b011: part_product1[5] = zx_reg << 10;
            3'b100: part_product1[5] = _zx_reg << 10;
            3'b101: part_product1[5] = _x_reg << 10;
            3'b110: part_product1[5] = _x_reg << 10;
            3'b111: part_product1[5] = 0 << 10;
        endcase
        
        case(y_reg[14:12])    //synthesis full_case
            3'b000: part_product1[6] = 0 << 12;
            3'b001: part_product1[6] = x_reg << 12;
            3'b010: part_product1[6] = x_reg << 12;
            3'b011: part_product1[6] = zx_reg << 12;
            3'b100: part_product1[6] = _zx_reg << 12;
            3'b101: part_product1[6] = _x_reg << 12;
            3'b110: part_product1[6] = _x_reg << 12;
            3'b111: part_product1[6] = 0 << 12;
        endcase
        
        case(y_reg[16:14])    //synthesis full_case
            3'b000: part_product1[7] = 0 << 14;
            3'b001: part_product1[7] = x_reg << 14;
            3'b010: part_product1[7] = x_reg << 14;
            3'b011: part_product1[7] = zx_reg << 14;
            3'b100: part_product1[7] = _zx_reg << 14;
            3'b101: part_product1[7] = _x_reg << 14;
            3'b110: part_product1[7] = _x_reg << 14;
            3'b111: part_product1[7] = 0 << 14;
        endcase
        
        case(y_reg[18:16])    //synthesis full_case
            3'b000: part_product1[8] = 0 << 16;
            3'b001: part_product1[8] = x_reg << 16;
            3'b010: part_product1[8] = x_reg << 16;
            3'b011: part_product1[8] = zx_reg << 16;
            3'b100: part_product1[8] = _zx_reg << 16;
            3'b101: part_product1[8] = _x_reg << 16;
            3'b110: part_product1[8] = _x_reg << 16;
            3'b111: part_product1[8] = 0 << 16;
        endcase
        
        case(y_reg[20:18])    //synthesis full_case
            3'b000: part_product1[9] = 0 << 18;
            3'b001: part_product1[9] = x_reg << 18;
            3'b010: part_product1[9] = x_reg << 18;
            3'b011: part_product1[9] = zx_reg << 18;
            3'b100: part_product1[9] = _zx_reg << 18;
            3'b101: part_product1[9] = _x_reg << 18;
            3'b110: part_product1[9] = _x_reg << 18;
            3'b111: part_product1[9] = 0 << 18;
        endcase
        
        case(y_reg[22:20])    //synthesis full_case
            3'b000: part_product1[10] = 0 << 20;
            3'b001: part_product1[10] = x_reg << 20;
            3'b010: part_product1[10] = x_reg << 20;
            3'b011: part_product1[10] = zx_reg << 20;
            3'b100: part_product1[10] = _zx_reg << 20;
            3'b101: part_product1[10] = _x_reg << 20;
            3'b110: part_product1[10] = _x_reg << 20;
            3'b111: part_product1[10] = 0 << 20;
        endcase
        
        case(y_reg[24:22])    //synthesis full_case
            3'b000: part_product1[11] = 0 << 22;
            3'b001: part_product1[11] = x_reg << 22;
            3'b010: part_product1[11] = x_reg << 22;
            3'b011: part_product1[11] = zx_reg << 22;
            3'b100: part_product1[11] = _zx_reg << 22;
            3'b101: part_product1[11] = _x_reg << 22;
            3'b110: part_product1[11] = _x_reg << 22;
            3'b111: part_product1[11] = 0 << 22;
        endcase
        
        case(y_reg[26:24])    //synthesis full_case
            3'b000: part_product1[12] = 0 << 24;
            3'b001: part_product1[12] = x_reg << 24;
            3'b010: part_product1[12] = x_reg << 24;
            3'b011: part_product1[12] = zx_reg << 24;
            3'b100: part_product1[12] = _zx_reg << 24;
            3'b101: part_product1[12] = _x_reg << 24;
            3'b110: part_product1[12] = _x_reg << 24;
            3'b111: part_product1[12] = 0 << 24;
        endcase
        
        case(y_reg[28:26])    //synthesis full_case
            3'b000: part_product1[13] = 0 << 26;
            3'b001: part_product1[13] = x_reg << 26;
            3'b010: part_product1[13] = x_reg << 26;
            3'b011: part_product1[13] = zx_reg << 26;
            3'b100: part_product1[13] = _zx_reg << 26;
            3'b101: part_product1[13] = _x_reg << 26;
            3'b110: part_product1[13] = _x_reg << 26;
            3'b111: part_product1[13] = 0 << 26;
        endcase
        
        case(y_reg[30:28])    //synthesis full_case
            3'b000: part_product1[14] = 0 << 28;
            3'b001: part_product1[14] = x_reg << 28;
            3'b010: part_product1[14] = x_reg << 28;
            3'b011: part_product1[14] = zx_reg << 28;
            3'b100: part_product1[14] = _zx_reg << 28;
            3'b101: part_product1[14] = _x_reg << 28;
            3'b110: part_product1[14] = _x_reg << 28;
            3'b111: part_product1[14] = 0 << 28;
        endcase
        
        case(y_reg[32:30])    //synthesis full_case
            3'b000: part_product1[15] = 0 << 30;
            3'b001: part_product1[15] = x_reg << 30;
            3'b010: part_product1[15] = x_reg << 30;
            3'b011: part_product1[15] = zx_reg << 30;
            3'b100: part_product1[15] = _zx_reg << 30;
            3'b101: part_product1[15] = _x_reg << 30;
            3'b110: part_product1[15] = _x_reg << 30;
            3'b111: part_product1[15] = 0 << 30;
        endcase
        
        case(y_reg[34:32])    //synthesis full_case
            3'b000: part_product1[16] = 0 << 32;
            3'b001: part_product1[16] = x_reg << 32;
            3'b010: part_product1[16] = x_reg << 32;
            3'b011: part_product1[16] = zx_reg << 32;
            3'b100: part_product1[16] = _zx_reg << 32;
            3'b101: part_product1[16] = _x_reg << 32;
            3'b110: part_product1[16] = _x_reg << 32;
            3'b111: part_product1[16] = 0 << 32;
        endcase
    end
    

    //First layer of compressed addition.
    wire [2*bits-1:0] part_product2 [11:0];
    wire [2*bits-1:0] part_product3 [7:0];
    wire [2*bits-1:0] part_product4 [5:0];
    wire [2*bits-1:0] part_product5 [3:0];
    wire [2*bits-1:0] part_product6 [2:0];
    wire [2*bits-1:0] part_product7 [1:0];
    genvar m;
    generate
        for(m=0; m<5; m=m+1)
        begin:layer1
            wallace_adder u_wallace_adder1_(
                                            .x1(part_product1[3*m]),
                                            .x2(part_product1[3*m+1]),
                                            .x3(part_product1[3*m+2]),
                                            .z(part_product2[2*m]),
                                            .c(part_product2[2*m+1])
                                            );
        end
        assign part_product2[10] = part_product1[15];
        assign part_product2[11] = part_product1[16];

    //Second layer of compressed addition.
        for(m=0; m<4; m=m+1)
        begin:layer2
            wallace_adder u_wallace_adder2_(
                                            .x1(part_product2[3*m]),
                                            .x2(part_product2[3*m+1]),
                                            .x3(part_product2[3*m+2]),
                                            .z(part_product3[2*m]),
                                            .c(part_product3[2*m+1])
                                            );
        end

    //Third layer of compressed addition.
        for(m=0; m<2; m=m+1)
        begin:layer3
            wallace_adder u_wallace_adder3_(
                                            .x1(part_product3[3*m]),
                                            .x2(part_product3[3*m+1]),
                                            .x3(part_product3[3*m+2]),
                                            .z(part_product4[2*m]),
                                            .c(part_product4[2*m+1])
                                            );
            assign part_product4[4] = part_product3[6];
            assign part_product4[5] = part_product3[7];
        end
    
    //Fourth layer of compressed addition.
        for(m=0; m<2; m=m+1)
        begin:layer4
            wallace_adder u_wallace_adder4_(
                                            .x1(part_product4[3*m]),
                                            .x2(part_product4[3*m+1]),
                                            .x3(part_product4[3*m+2]),
                                            .z(part_product5[2*m]),
                                            .c(part_product5[2*m+1])
                                            );
        end
    
    //Fifth layer of compressed addition.
        for(m=0; m<1; m=m+1)
        begin:layer5
            wallace_adder u_wallace_adder5_(
                                            .x1(part_product5[3*m]),
                                            .x2(part_product5[3*m+1]),
                                            .x3(part_product5[3*m+2]),
                                            .z(part_product6[2*m]),
                                            .c(part_product6[2*m+1])
                                            );
            assign part_product6[2] = part_product5[3];
        end
    
    //Six layer of compressed addition.
        for(m=0; m<1; m=m+1)
        begin:layer6
            wallace_adder u_wallace_adder6_(
                                            .x1(part_product6[3*m]),
                                            .x2(part_product6[3*m+1]),
                                            .x3(part_product6[3*m+2]),
                                            .z(part_product7[2*m]),
                                            .c(part_product7[2*m+1])
                                            );
        end
    endgenerate
    
    reg [2*bits-1:0] result_reg;
    always @(part_product7[0] or part_product7[1])
    begin
        result_reg = part_product7[0] + part_product7[1];
    end
    
    assign result =result_reg;

endmodule
