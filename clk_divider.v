module clk_divider(
    input wire clk,      
    input wire rst,       
    output reg divided_clk 
);

    parameter DIVIDE_BY = 10; 
    reg [31:0] counter;

    always @(posedge clk or posedge rst) begin
        if (rst) begin
            counter <= 0;
            divided_clk <= 0;
        end else begin
            if (counter == (DIVIDE_BY/2 - 1)) begin
                divided_clk <= ~divided_clk;
                counter <= 0;
            end else begin
                counter <= counter + 1;
            end
        end
    end

endmodule
