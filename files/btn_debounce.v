module btn_debounce(
    input      clk,       // 50MHz
    input      rst_n,     // async reset (added!)
    input      btn_raw,   // raw button (active low)
    output reg btn_pulse  // debounced 1-clk pulse
);
    localparam IDLE=2'd0, WAIT_P=2'd1, PRESSED=2'd2, WAIT_R=2'd3;
    parameter DEBOUNCE_CNT = 20'd999_999; // 20ms @ 50MHz

    reg [1:0]  state, next_state;
    reg [19:0] cnt;
    wire       cnt_done = (cnt == DEBOUNCE_CNT);

    // Counter: reset on state transition or system reset
    always @(posedge clk or negedge rst_n) begin
        if (!rst_n)                  cnt <= 0;
        else if (state != next_state) cnt <= 0;
        else if (!cnt_done)           cnt <= cnt + 1;
    end

    // P1: State Register (with async reset!)
    always @(posedge clk or negedge rst_n) begin
        if (!rst_n) state <= IDLE;
        else        state <= next_state;
    end

    // P2: Next State
    always @(*) begin
        next_state = state;
        case (state)
            IDLE:    if (!btn_raw)            next_state = WAIT_P;
            WAIT_P:  if (btn_raw)             next_state = IDLE;
                     else if (cnt_done)       next_state = PRESSED;
            PRESSED:                          next_state = WAIT_R;
            WAIT_R:  if (btn_raw && cnt_done) next_state = IDLE;
            default:                          next_state = IDLE;
        endcase
    end

    // P3: Output — PRESSED state generates 1-clk pulse
    always @(posedge clk or negedge rst_n) begin
        if (!rst_n) btn_pulse <= 1'b0;
        else        btn_pulse <= (state == PRESSED);
    end
endmodule