# Appendix: 3~7주차 핵심 체크리스트

## A. FSM Design Checklist

1. `localparam`으로 상태 정의 (no magic numbers)
2. 3-Process: P1(register), P2(next state), P3(output) 분리
3. P2 첫 줄: `next_state = state;` (latch 방지)
4. P3: 모든 출력의 기본값 할당
5. `case`에 `default` 포함
6. 비동기 리셋: `always @(posedge clk or negedge rst_n)`
7. 버튼은 반드시 debounce 처리
8. 시뮬레이션에서 모든 전이 경로 검증

## B. Board Compatibility Quick Reference

| Resource | DE0 | DE1 |
|----------|-----|-----|
| FPGA | Cyclone III EP3C16F484C6 | Cyclone II EP2C20F484C7 |
| CLOCK_50 | PIN_G21 | PIN_L1 |
| Switches | SW[7:0] (8) | SW[9:0] (10) |
| Buttons | KEY[2:0] (3) | KEY[3:0] (4) |
| LEDs (main) | LEDG[7:0] (8 green) | LEDR[9:0] (10 red) |
| LEDs (extra) | — | LEDG[7:0] (8 green) |
| 7-Seg | HEX0~HEX3 (4) | HEX0~HEX3 (4) |
| Quartus Family | Cyclone III | Cyclone II |

> ⚠️ **KEY DIFFERENCE:** DE0 has **no LEDR** — use LEDG. DE0 has only **3 KEYs** and **8 switches**.

## C. Diagram List (3~7주차)

### Week 3
1. `w3_testbench_arch.svg` — Testbench Architecture
2. `w3_waveform.svg` — ModelSim Waveform Example
3. `w3_sim_flow.svg` — Simulation Flow Diagram (NEW)

### Week 4
4. `w4_moore_vs_mealy.svg` — Moore vs Mealy Comparison (NEW)
5. `w4_fsm_3process.svg` — 3-Process FSM Architecture
6. `w4_traffic_fsm.svg` — Traffic Light State Diagram
7. `w4_debounce_waveform.svg` — Bounce/Debounce Waveform (NEW)
8. `w4_debounce_fsm.svg` — Debounce FSM State Diagram (NEW)
9. `w4_vending_fsm.svg` — Vending Machine FSM

### Week 5
10. `w5_7seg_layout.svg` — 7-Segment Layout & Encoding
11. `w5_stopwatch.svg` — Stopwatch Block Diagram
12. `w5_bcd_chain.svg` — BCD Counter Chain Signal Flow (NEW)

### Week 6
13. `w6_datapath_ctrl.svg` — Datapath + Controller Architecture
14. `w6_alu_structure.svg` — ALU Internal Structure (NEW)
15. `w6_calculator.svg` — Calculator Block Diagram

### Week 7
16. `w7_lfsr_structure.svg` — LFSR Feedback Structure (NEW)
17. `w7_seq_detector.svg` — Sequence Detector State Diagram
18. `w7_reaction_timer.svg` — Reaction Timer Block Diagram (NEW)

## D. Revision Notes (이전 버전 대비 변경사항)

| # | Location | Issue | Fix |
|---|----------|-------|-----|
| 1 | W3 pwm_top | SW[9:0], LEDR 사용 → DE0 불가 | 보드별 Top Module 분리 |
| 2 | W4 btn_debounce | rst_n 누락, 비동기 리셋 없음 | rst_n 포트 추가, 모든 sequential에 리셋 |
| 3 | W4 traffic_light | 타이머 race condition | state_d 비교 방식으로 수정 |
| 4 | W5 stopwatch | DE0 호환 불가 | 보드 독립 모듈 + 보드별 Top |
| 5 | W5 stopwatch | Testbench 없음 | TB 추가 (defparam 활용) |
| 6 | W6 ALU | Testbench 없음 | 8개 연산 전수 검증 TB 추가 |
| 7 | W6 calculator | S_B에서 result 동시 할당 버그 | S_SHOW에서 result 래치 |
| 8 | W6 calculator | hex2bcd 설명 없음 | Double-dabble 코드 추가 |
| 9 | W7 LFSR | 미검증 다항식 | 표준 maximal-length 다항식으로 교체 |
| 10 | W7 LFSR | seed=0 lock-up 미방지 | load 시 0 체크 추가 |
| 11 | W7 seq_detector | P2 기본값 불일치 | next_state=state로 통일 |
| 12 | W7 reaction_timer | 카운터 로직 미완성 | 완전한 카운터 로직 제공 |
| 13 | 전체 | DE0/DE1 보드 차이 미반영 | 모든 Top Module에 보드별 버전 |
| 14 | 신규 | 다이어그램 8개 추가 | Moore/Mealy, debounce, BCD chain 등 |
