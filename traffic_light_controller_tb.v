`timescale 1s / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 01.07.2025 20:59:47
// Design Name: 
// Module Name: traffic_light_controller_tb
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module traffic_light_controller_tb(

    );
    
 wire [2:0]highway,side_road;
 reg clk,rst;
 wire count_rst;
 wire [4:0]count;
 wire [5:0]state;
 assign count=m1.count;
 assign count_rst=m1.count_rst;
 assign state=m1.state;
 
 traffic_light_controller m1(.rst(rst),.highway(highway),.side_road(side_road),.clk(clk));
 
 always #5 begin
 clk=~clk;
 end
 initial begin
 rst =1;
 clk=0;
 #10;
 rst=0;
 #500;
 $finish;
 end
 
endmodule
