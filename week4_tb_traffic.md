# `traffic_light_tb` Testbench 설명

## 개요

`traffic_light` FSM 모듈을 검증하는 간단한 testbench입니다.  
핵심 아이디어는 **`defparam`으로 타이머를 아주 작게 줄여** 수백 ns 안에 전체 시나리오를 완료하는 것입니다.

---

## 전체 코드

```verilog
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
```

---

## 전체 구조

```
traffic_light_tb
├── ① 포트 선언       reg / wire
├── ② defparam        GREEN_T=4, YELLOW_T=2  ← 핵심
├── ③ DUT 인스턴스    traffic_light dut(...)
├── ④ 클럭 생성       always #5 clk = ~clk
└── ⑤ initial 블록
    ├── VCD 덤프      $dumpfile / $dumpvars
    └── 시나리오       리셋 → sensor=0 → sensor=1
```

---

## 블록별 설명

### ① 포트 선언

```verilog
reg        clk, rst_n, sensor;
wire [2:0] light_main, light_side;
```

| 종류 | 신호 | 이유 |
|------|------|------|
| `reg` | clk, rst_n, sensor | TB가 직접 **구동**하는 입력 |
| `wire` | light_main, light_side | DUT가 **출력**하는 신호 |

---

### ② defparam — 타이머 축소 (핵심)

```verilog
defparam dut.GREEN_T  = 4;   // 원본 49_999_999 → 5 클럭
defparam dut.YELLOW_T = 2;   // 원본 24_999_999 → 3 클럭
```

- 원본 타이머 그대로 사용하면 시뮬레이션이 수십억 클럭 필요
- `defparam`으로 DUT 내부 파라미터를 TB에서 오버라이드
- 덕분에 `#30 ~ #50` 딜레이만으로 상태 전이 확인 가능

> **주의:** `defparam`은 Verilog-2001 이후로 deprecated 추세.  
> Vivado 등 최신 툴에서는 인스턴스 시 `#(.GREEN_T(4), .YELLOW_T(2))` 방식 권장.

---

### ③ DUT 인스턴스

```verilog
traffic_light dut(
    .clk(clk), .rst_n(rst_n), .sensor(sensor),
    .light_main(light_main), .light_side(light_side)
);
```

검증 대상 모듈을 `dut`라는 이름으로 연결합니다.

---

### ④ 클럭 생성

```verilog
always #5 clk = ~clk;   // 주기 10 ns (100 MHz)
```

- `clk=0` 초기값 후 반전 반복
- `#5`는 반주기(half-period) → 주기 = 10 ns

---

### ⑤ initial 블록 — 시나리오

#### VCD 파형 저장

```verilog
$dumpfile("traffic_light_tb.vcd");
$dumpvars(0, traffic_light_tb);
```

GTKWave로 파형 확인 시 필요합니다.

#### 시나리오 흐름

```
clk=0, rst_n=0, sensor=0
       │
  #12  └─ rst_n=1  (비동기 리셋 해제)
       │
  #50  └─ $display  sensor=0 → MAIN_GREEN 유지 확인
       │             (expect: main=001 side=100)
       │
sensor=1
  #50  └─ $display  MAIN_YELLOW 전이 확인
       │             (expect: main=010 side=100)
  #30  └─ $display  SIDE_GREEN 전이 확인
       │             (expect: main=100 side=001)
  #50  └─ $display  SIDE_YELLOW 전이 확인
       │             (expect: main=100 side=010)
  #30  └─ $display  MAIN_GREEN 복귀 확인
       │             (expect: main=001 side=100)
  #20  └─ $finish
```

#### 출력 신호 인코딩

```
{R, Y, G}
 3'b100  →  RED    켜짐
 3'b010  →  YELLOW 켜짐
 3'b001  →  GREEN  켜짐
```

---

## 실행 방법 (Icarus Verilog)

```bash
# 컴파일
iverilog -o sim traffic_light.v traffic_light_tb.v

# 시뮬레이션
vvp sim

# 파형 확인
gtkwave traffic_light_tb.vcd
```

### 예상 콘솔 출력

```
sensor=0: main=001 side=100 (expect 001 100)
MAIN_YEL: main=010 side=100 (expect 010 100)
SIDE_GRN: main=100 side=001 (expect 100 001)
SIDE_YEL: main=100 side=010 (expect 100 010)
MAIN_GRN: main=001 side=100 (expect 001 100)
```

---

## 요약

| 항목 | 내용 |
|------|------|
| 시뮬레이션 시간 | 약 300 ns |
| 상태 전이 확인 | 4개 전체 순환 |
| 비동기 리셋 확인 | 포함 |
| sensor=0 유지 확인 | 포함 |
| 파형 저장 | VCD (GTKWave 용) |
