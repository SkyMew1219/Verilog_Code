`timescale 1ns / 1ps
module testbench();
    parameter bits = 32;
    reg [bits-1:0] x;
    reg [bits-1:0] y;
    wire [2*bits-1:0] result;
    
    initial
    begin
            x = 32'b11100111101101111010110011001011;
            y = 32'b00111101011100101101111100010110;
        #20 x = 32'b10101011111001010110000010011000;
            y = 32'b11100101110000010111110100111000;
        #20 x = 32'b00111100110110101101111000101101;
            y = 32'b10001010001000000011010110100010;
        #20 y = 32'b11100111101101111010110011001011;
            x = 32'b00111101011100101101111100010110;
        #20 y = 32'b00010010110111010010111111010011;
            x = 32'b10100111101000010001001010101010;
        #20 x = 32'b10100111101000010001001010101010;
            y = 32'b00010010110111010010111111010011;
        #20 x = 32'b10100111101000010001001010101010;
            y = 32'b00010010110111010010111111010011;
        #20 x = 32'b11011101010110001101111100101010;
            y = 32'b01111010000110111001001111000000;
        #20 x = 32'b11110000010000100001010101111000;
            y = 32'b01010001110000101101000110000011;
        #20 x = 32'b11110011010100100110001000001111;
            y = 32'b10000000100001000000111110011011;
    end
    
//    initial
//    begin
//            y = 32'b00100011010000011101110101011100;
//            x = 32'b01110100011001100010111110100010;
//        #20 y = 32'b10101011111001010110000010011000;
//            x = 32'b11100101110000010111110100111000;
//        #20 y = 32'b00111100110110101101111000101101;
//            x = 32'b10001010001000000011010110100010;
//        #20 x = 32'b11100111101101111010110011001011;
//            y = 32'b00111101011100101101111100010110;
//        #20 x = 32'b00010010110111010010111111010011;
//            y = 32'b10100111101000010001001010101010;
//        #20 y = 32'b10100111101000010001001010101010;
//            x = 32'b00010010110111010010111111010011;
//        #20 y = 32'b10100111101000010001001010101010;
//            x = 32'b00010010110111010010111111010011;
//        #20 y = 32'b11011101010110001101111100101010;
//            x = 32'b01111010000110111001001111000000;
//        #20 y = 32'b11110000010000100001010101111000;
//            x = 32'b01010001110000101101000110000011;
//        #20 y = 32'b11110011010100100110001000001111;
//            x = 32'b10000000100001000000111110011011;
//    end
    
    initial #300 $finish;
    booth u_booth(
                	.x(x),
               	 	.y(y),
                	.result(result)
                	);

endmodule
