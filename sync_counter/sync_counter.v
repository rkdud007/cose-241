module SyncCounter (
    input wire rst,     
    input wire clk,      
    output wire [3:0] q0,
    output wire [3:0] q1, 
    output wire [3:0] q2, 
    output wire [3:0] q3  
);

    wire clk_div0;
    wire clk_div1;
    wire clk_div2;
    wire clk_div3;

    clk_10 div0 (.rst(rst), .clk(clk), .out_clk(clk_div0));
    clk_10 div1 (.rst(rst), .clk(clk_div0),  .out_clk(clk_div1));
    clk_10 div2 (.rst(rst), .clk(clk_div1), .out_clk(clk_div2));
    clk_10 div3 (.rst(rst), .clk(clk_div2), .out_clk(clk_div3));

    counter cnt0 (.rst(rst), .clk(clk_div0), .q(q0));
    counter cnt1 (.rst(rst), .clk(clk_div1), .q(q1));
    counter cnt2 (.rst(rst), .clk(clk_div2), .q(q2));
    counter cnt3 (.rst(rst), .clk(clk_div3), .q(q3));

endmodule
