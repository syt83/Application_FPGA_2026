`timescale 1ns/1ps

module vending_fsm_tb;
    reg        clk, rst_n;
    reg        coin_10, coin_20, cancel;
    wire       dispense;
    wire [3:0] bal_tens, bal_ones, chg_tens, chg_ones;

    vending_fsm uut(
        .clk(clk), .rst_n(rst_n),
        .coin_10(coin_10), .coin_20(coin_20), .cancel(cancel),
        .dispense(dispense),
        .bal_tens(bal_tens), .bal_ones(bal_ones),
        .chg_tens(chg_tens), .chg_ones(chg_ones)
    );

    initial clk = 0;
    always #10 clk = ~clk;

    initial begin
        rst_n = 0; coin_10 = 0; coin_20 = 0; cancel = 0;
        repeat(3) @(posedge clk); rst_n = 1;

        // 10+10+10 = 30 -> dispense, change=0
        repeat(2) @(posedge clk);
        coin_10 = 1; @(posedge clk); coin_10 = 0;
        repeat(2) @(posedge clk);
        coin_10 = 1; @(posedge clk); coin_10 = 0;
        repeat(2) @(posedge clk);
        coin_10 = 1; @(posedge clk); coin_10 = 0;
        repeat(5) @(posedge clk);

        // 20+20 = 40 -> dispense, change=10
        coin_20 = 1; @(posedge clk); coin_20 = 0;
        repeat(2) @(posedge clk);
        coin_20 = 1; @(posedge clk); coin_20 = 0;
        repeat(5) @(posedge clk);

        // 10 + cancel
        coin_10 = 1; @(posedge clk); coin_10 = 0;
        repeat(2) @(posedge clk);
        cancel = 1; @(posedge clk); cancel = 0;
        repeat(5) @(posedge clk);

        $finish;
    end
endmodule
