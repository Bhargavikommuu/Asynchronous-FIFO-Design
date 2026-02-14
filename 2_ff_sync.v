`timescale 1ns / 1ps
module two_ff_sync(
    input wire clk_i,
    input wire rst_n,
    input wire in_i,
    output wire out_o);
    
    reg [1:0] sync_ff;
    
    assign out_o = sync_ff[0];
    
    always @( posedge clk_i  or negedge rst_n )
        begin
            if( !rst_n )
                sync_ff <= 2'b0;
            else
                begin
                    sync_ff[1] <= in_i;
                    sync_ff[0] <= sync_ff[1];
                end
        end

endmodule
