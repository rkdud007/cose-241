`timescale 1ns / 1ps

module SyncCounter_tb;

    reg clk;
    reg rst;
    wire [3:0] q0;
    wire [3:0] q1;
    wire [3:0] q2;
    wire [3:0] q3;

    // SyncCounter
    SyncCounter uut (
        .clk(clk),
        .rst(rst),
        .q0(q0),
        .q1(q1),
        .q2(q2),
        .q3(q3)
    );

    initial begin
        clk = 0;
        forever #10 clk = ~clk; // 20ns clock period
    end

    initial begin
          rst = 0; // reset active
        #20;
        // Case 1: ctn0 vs ctn1 
      
        rst = 1; // reset off
        #1000;   
        rst = 0; // reset active
        #20;     

        // Case 2: ctn1 vs ctn2 
        rst = 1; // reset off
        #1000;   
        rst = 0; // reset active
        #20;   

        // Case 3: ctn2 vs ctn3 
        rst = 1; // reset off
        #1000;   
        rst = 0; // reset active
        #20;    

        // 시뮬레이션 종료
        $stop;
    end

endmodule
