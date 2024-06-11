module full_adder(
    input x,
    input y,
    input c_in,
    output s_out,
    output c_out
);

    wire sum, carry1, carry2;

    half_adder U0 (
        .a(x),
        .b(y),
        .s(sum),
        .c(carry1)
    );

    half_adder U1 (
        .a(sum),
        .b(c_in),
        .s(s_out),
        .c(carry2)
    );

    or_gate U2 (
        .x(carry1),
        .y(carry2),
        .z(c_out)
    );

endmodule

module half_adder(a, b, s, c);
    input a;
    input b;
    output s;
    output c;

    //Behavior Modeling
    reg s;
    reg c;

    always @(a, b)
    begin
    if (a!=b)
        s = 1;
    else
        s = 0;
    end
    always @(a, b)
    begin
    if (a==1 && b == 1)
        c = 1;
    else
        c = 0;
    end
endmodule

module or_gate(x, y, z);
    input x;
    input y;
    output z;

    assign z = x | y;

endmodule