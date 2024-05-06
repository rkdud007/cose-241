module rca_4bit(
    input [3:0] x,
    input [3:0] y,
    input c_in,
    output [3:0] sum,
    output c_out
);

    wire c1, c2, c3;

    full_adder fa0 (
        .x(x[0]),
        .y(y[0]),
        .c_in(c_in),
        .s_out(sum[0]),
        .c_out(c1)
    );

    full_adder fa1 (
        .x(x[1]),
        .y(y[1]),
        .c_in(c1),
        .s_out(sum[1]),
        .c_out(c2)
    );

    full_adder fa2 (
        .x(x[2]),
        .y(y[2]),
        .c_in(c2),
        .s_out(sum[2]),
        .c_out(c3)
    );

    full_adder fa3 (
        .x(x[3]),
        .y(y[3]),
        .c_in(c3),
        .s_out(sum[3]),
        .c_out(c_out)
    );

endmodule
