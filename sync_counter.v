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

    clk_divider #(.DIVIDE_BY(10)) div0 (.clk(clk), .rst(rst), .divided_clk(clk_div0));
    clk_divider #(.DIVIDE_BY(100)) div1 (.clk(clk_div0), .rst(rst), .divided_clk(clk_div1));
    clk_divider #(.DIVIDE_BY(1000)) div2 (.clk(clk_div1), .rst(rst), .divided_clk(clk_div2));
    clk_divider #(.DIVIDE_BY(10000)) div3 (.clk(clk_div2), .rst(rst), .divided_clk(clk_div3));

    counter cnt0 (.clk(clk_div0), .rst(rst), .q(q0));
    counter cnt1 (.clk(clk_div1), .rst(rst), .q(q1));
    counter cnt2 (.clk(clk_div2), .rst(rst), .q(q2));
    counter cnt3 (.clk(clk_div3), .rst(rst), .q(q3));

endmodule
