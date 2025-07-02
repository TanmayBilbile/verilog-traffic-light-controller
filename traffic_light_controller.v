`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////

module traffic_light_controller(
    output reg [2:0] highway, side_road,
    input clk, rst
);
    reg [5:0] state;
    reg [5:0] nextstate;
    parameter red    = 3'b100;
    parameter yellow = 3'b010;
    parameter green  = 3'b001;
    reg [4:0] count = 0;
    reg count_rst;

    always @(posedge clk or posedge count_rst) begin 
        if (count_rst) begin
            count <= 5'd0;
        end else begin
            count <= count + 1;
        end
    end

    
    always @(posedge clk or posedge rst) begin
        if (rst) begin
            state <= 6'o00;
            highway <= red;
            side_road <= red;
            count_rst <= 1;
            count <= 0; 
        end else begin
            case (state)
                6'o00: begin
                    nextstate <= 6'o14;
                    state <= 6'o14;
                    highway <= green;
                    side_road <= red;
                    count_rst <= 1;
                end

                6'o14: begin
                    state<=state;
                    
                    count_rst <= 0;
                    if (count == 8) begin
                        nextstate <= 6'o24;
                        state <= 6'o24;
                        highway<=yellow;
                        side_road<=red;
                        count_rst <= 1;
                    end
                    else begin
                        highway <= green;
                        side_road <= red;
                    end
                end

                6'o24: begin
                    state<=state;
                    
                    count_rst <= 0;
                    if (count == 1) begin
                        nextstate <= 6'o41;
                        highway<=red;
                        side_road=green;
                        state <= 6'o41;
                        count_rst <= 1;
                    end
                    else begin
                    highway <= yellow;
                    side_road <= red;
                    end
                end

                6'o41: begin
                    state<=state;
                    
                    count_rst <= 0;
                    if (count == 3) begin
                        nextstate <= 6'o42;
                        highway<=red;
                        side_road=yellow;
                        state <= 6'o42;
                        count_rst <= 1;
                    end
                    else begin
                    highway <= red;
                    side_road <= green;
                    end
                end

                6'o42: begin
                    state<=state;
                    
                    count_rst <= 0;
                    if (count == 1) begin
                        nextstate <= 6'o14;
                        highway<=green;
                        side_road=red;
                        state <=6'o14;
                        count_rst <= 1;
                    end
                    else begin
                        highway <= red;
                        side_road <= yellow;
                    end
                end

                default: begin
                    nextstate <= 6'o00;
                    state <= 6'o00;
                    count_rst <= 1;
                    highway <= red;
                    side_road <= red;
                end
            endcase
        end
    end

endmodule
