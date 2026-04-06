module vending_fsm(
    input            clk, rst_n,
    input            coin_10,       // 10-won pulse (debounced)
    input            coin_20,       // 20-won pulse (debounced)
    input            cancel,        // cancel pulse  (debounced)
	 input            open,
    output reg       dispense,      // 1-clk pulse when dispensing
    output reg [3:0] bal_tens,      // balance tens digit  (-> HEX1)
    output reg [3:0] bal_ones,      // balance ones digit  (-> HEX0)
    output reg [3:0] chg_tens,      // change tens digit   (-> HEX3)
    output reg [3:0] chg_ones       // change ones digit   (-> HEX2)
);
    // ---- State Encoding ----
    localparam S_IDLE    = 3'd0,    // balance =  0
               S_COIN10  = 3'd1,   // balance = 10
               S_COIN20  = 3'd2,   // balance = 20
               S_COIN30  = 3'd3,   // balance = 30
               S_COIN40  = 3'd4,   // balance = 40 (overpay)
               S_DISP_0  = 3'd5,   // dispense, change =  0
               S_DISP_10 = 3'd6;   // dispense, change = 10

    reg [2:0] state, next_state;

    // ---- P1: State Register ----
    always @(posedge clk or negedge rst_n) begin
        if (!rst_n) state <= S_IDLE;
        else        state <= next_state;
    end

    // ---- P2: Next State Logic ----
    always @(*) begin
        next_state = state;                 // default: hold
        case (state)
            S_IDLE: begin
                if      (coin_10) next_state = S_COIN10;
                else if (coin_20) next_state = S_COIN20;
            end
            S_COIN10: begin
                if      (cancel)  next_state = S_IDLE;
                else if (coin_10) next_state = S_COIN20;
                else if (coin_20) next_state = S_COIN30;
            end
            S_COIN20: begin
                if      (cancel)  next_state = S_IDLE;
                else if (coin_10) next_state = S_COIN30;
                else if (coin_20) next_state = S_COIN40;
            end
            S_COIN30: begin
                if (cancel) next_state = S_IDLE;
                else        next_state = S_DISP_0;   // exact 30
            end
            S_COIN40: begin
                  next_state = S_DISP_10;              // overpay 40
            end
            S_DISP_0: begin
				     if (open) 
                  next_state = S_IDLE;
            end
            S_DISP_10: begin
				      if (open)
                  next_state = S_IDLE;
            end
            default: next_state = S_IDLE;
        endcase
    end

    // ---- P3: Output Logic (Moore — depends only on state) ----
    always @(*) begin
        // Defaults
        dispense  = 1'b0;
        bal_tens   = 4'd0;
        bal_ones   = 4'd0;
        chg_tens   = 4'd0;
        chg_ones   = 4'd0;

        case (state)
            S_IDLE: begin
                bal_tens = 4'd0;  bal_ones = 4'd0;   // "00"
            end
            S_COIN10: begin
                bal_tens = 4'd1;  bal_ones = 4'd0;   // "10"
            end
            S_COIN20: begin
                bal_tens = 4'd2;  bal_ones = 4'd0;   // "20"
            end
            S_COIN30: begin
                bal_tens = 4'd3;  bal_ones = 4'd0;   // "30"
            end
            S_COIN40: begin
                bal_tens = 4'd4;  bal_ones = 4'd0;   // "40"
            end
            S_DISP_0: begin
                dispense = 1'b1;
                bal_tens = 4'd0;  bal_ones = 4'd0;   // "00"
                chg_tens = 4'd0;  chg_ones = 4'd0;   // change "00"
            end
            S_DISP_10: begin
                dispense = 1'b1;
                bal_tens = 4'd0;  bal_ones = 4'd0;   // "00"
                chg_tens = 4'd1;  chg_ones = 4'd0;   // change "10"
            end
            default: ;  // all zeros from defaults
        endcase
    end
endmodule