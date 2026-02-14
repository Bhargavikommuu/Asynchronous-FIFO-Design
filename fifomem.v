`timescale 1ns / 1ps
module fifo_memory(
    input wire clk_a,
    input wire clk_b,
    input wire wr_en_i,
    input wire rd_en_i,
    input wire [3:0] wr_ptr,
    input wire [3:0] wr_data,
    input wire [3:0] rd_ptr,
    output reg [3:0] rd_data
    );
    
    reg [3:0] fifo_mem [0:15];
    
    always @ ( posedge clk_a )
        begin
            if( wr_en_i )
                fifo_mem[wr_ptr] <= wr_data;
        end    
    
    always @ (posedge clk_b )
        begin
            if( rd_en_i )
                rd_data <= fifo_mem[rd_ptr];
        end
endmodule