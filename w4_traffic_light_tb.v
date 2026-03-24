`timescale 1ns/1ps

module traffic_light_tb;

    reg        clk, rst_n, sensor;
    wire [2:0] light_main, light_side;

    // ── 타이머를 아주 작게 오버라이드 ────────────────────
    defparam dut.GREEN_T  = 4;   // 5 clk
    defparam dut.YELLOW_T = 2;   // 3 clk

    traffic_light dut(
        .clk(clk), .rst_n(rst_n), .sensor(sensor),
        .light_main(light_main), .light_side(light_side)
    );

    always #5 clk = ~clk;

    initial begin
        $dumpfile("traffic_light_tb.vcd");
        $dumpvars(0, traffic_light_tb);

        clk=0; rst_n=0; sensor=0;
        #12 rst_n=1;

        // MAIN_GREEN 유지 확인 (sensor=0)
        #50 $display("sensor=0: main=%03b side=%03b (expect 001 100)", light_main, light_side);

        // sensor=1 → 전체 사이클 한 바퀴
        sensor=1;
        #50 $display("MAIN_YEL: main=%03b side=%03b (expect 010 100)", light_main, light_side);
        #30 $display("SIDE_GRN: main=%03b side=%03b (expect 100 001)", light_main, light_side);
        #50 $display("SIDE_YEL: main=%03b side=%03b (expect 100 010)", light_main, light_side);
        #30 $display("MAIN_GRN: main=%03b side=%03b (expect 001 100)", light_main, light_side);

        #20 $finish;
    end

endmodule
