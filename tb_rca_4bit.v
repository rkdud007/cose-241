module tb_rca_4bit;
    reg [3:0] x;
    reg [3:0] y;
    reg c_in;
    wire [3:0] sum;
    wire c_out;

    rca_4bit U0 (
        .x(x),
        .y(y),
        .c_in(c_in),
        .sum(sum),
        .c_out(c_out)
    );

    initial begin
        x = 4'b0000;
        y = 4'b0000;
        c_in = 1'b0;
        #10;
        x = 4'b0001;
        y = 4'b0001;
        c_in = 1'b0;
        #10;
        x = 4'b0001;
        y = 4'b0001;
        c_in = 1'b1;
        #10;
        x = 4'b1111;
        y = 4'b1111;
        c_in = 1'b1;
        #10;
        x = 4'b1111;
        y = 4'b1111;
        c_in = 1'b0;
        #10;
        x = 4'b1111;
        y = 4'b0000;
        c_in = 1'b0;
        #10;
        x = 4'b1111;
        y = 4'b0000;
        c_in = 1'b1;
        #10;
        x = 4'b0000;
        y = 4'b1111;
        c_in = 1'b0;
        #10;
        x = 4'b0000;
        y = 4'b1111;
        c_in = 1'b1;
        #10;
        x = 4'b0000;
        y = 4'b0000;
        c_in = 1'b1;
        #10;
        $finish;
    end

endmodule
