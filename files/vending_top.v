module vending_top(
    input        CLOCK_50,         // PIN_G21
    input  [7:0] SW,               // SW[7] = reset
    input  [2:0] KEY,              // KEY[0]=coin10, KEY[1]=coin20, KEY[2]=cancel
    output [7:0] LEDG,             // LEDG[0] = dispense
    output [6:0] HEX0, HEX1,      // balance  (HEX1:HEX0 = tens:ones)
    output [6:0] HEX2, HEX3       // change   (HEX3:HEX2 = tens:ones)
);
    wire rst_n = SW[7];
	 wire open = SW[0];

    // ---- Debounce 3 buttons ----
    wire pulse_10, pulse_20, pulse_cancel;

    btn_debounce #(.DEBOUNCE_CNT(999_999)) u_db0(
        .clk(CLOCK_50), .rst_n(rst_n),
        .btn_raw(KEY[0]), .btn_pulse(pulse_10)
    );
    btn_debounce #(.DEBOUNCE_CNT(999_999)) u_db1(
        .clk(CLOCK_50), .rst_n(rst_n),
        .btn_raw(KEY[1]), .btn_pulse(pulse_20)
    );
    btn_debounce #(.DEBOUNCE_CNT(999_999)) u_db2(
        .clk(CLOCK_50), .rst_n(rst_n),
        .btn_raw(KEY[2]), .btn_pulse(pulse_cancel)
    );

    // ---- FSM ----
    wire       dispense;
    wire [3:0] bal_tens, bal_ones, chg_tens, chg_ones;

    vending_fsm u_fsm(
        .clk(CLOCK_50), .rst_n(rst_n),
        .coin_10(pulse_10),
        .coin_20(pulse_20),
        .cancel(pulse_cancel),
        .dispense(dispense),
        .bal_tens(bal_tens),   .bal_ones(bal_ones),
        .chg_tens(chg_tens),   .chg_ones(chg_ones),
		  .open(open)
    );

    // ---- 7-Segment Display ----
    seg7_decoder u_h0(.hex(bal_ones), .seg(HEX0));   // balance ones
    seg7_decoder u_h1(.hex(bal_tens), .seg(HEX1));   // balance tens
    seg7_decoder u_h2(.hex(chg_ones), .seg(HEX2));   // change ones
    seg7_decoder u_h3(.hex(chg_tens), .seg(HEX3));   // change tens

    // ---- LED ----
    assign LEDG[0]   = dispense;
    assign LEDG[7:1] = 7'b0;

endmodule