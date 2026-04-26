# 9~10주차: 팀 미니 프로젝트

## 개요

- **기간:** 2.5주 (수업 5회 + 수업 외 자율 작업)
- **팀 구성:** 3인 × 12조
- **보드:** DE0 또는 DE1 (팀 선택)

---

## 일정 (수업 5회, 각 70분)

### 수업 1: 9주차 Mon — 킥오프

| 시간 | 활동 |
|------|------|
| 30min | **미니 강의**: 프로젝트에 필요한 새 개념 (아래 참조) |
| 20min | 과제 5개 소개 + 조 편성 + 과제 선택 |
| 20min | 조별 착석 → 요구사항 분석 + 역할 분담 시작 |

> **수업 외 과제 (→ 수업 2까지):** 블록 다이어그램 + FSM 상태 전이도 작성, 모듈 인터페이스 정의

### 수업 2: 9주차 Wed — 설계 리뷰

| 시간    | 활동                                            |
| ----- | --------------------------------------------- |
| 10min | 설계 문서 기준 안내 (블록 다이어그램 + FSM 전이도 필수)           |
| 45min | **조별 설계 리뷰**:  12조 순회하며 블록 다이어그램/FSM 검토 + 피드백 |
| 15min | **조별 1분 발표** — 설계 구조 + 어려운 점 공유 (12조 × ~1분)   |

> **제출:** 블록 다이어그램 + FSM 전이도 (종이 또는 파일) — 설계 안 하고 오면 감점
>
> **수업 외 과제 (→ 수업 3까지):** 핵심 모듈 코딩 + TB 작성 + ModelSim 시뮬레이션

### 수업 3: 10주차 Mon — 코딩 점검

| 시간    | 활동                                          |
| ----- | ------------------------------------------- |
| 5min  | 진행 상황 체크 (조별 손들기: TB PASS? 합성 완료?)          |
| 50min | **조별 코딩 + 시뮬레이션**:  순회하며 코드 리뷰, 공통 실수 지적    |
| 15min | **전체 트러블슈팅**: 공통 문제 화면에 띄워 설명 (흔한 버그 Top 3) |

> **이 시간 목표:** 핵심 모듈 시뮬레이션 PASS 확인
>
> **수업 외 과제 (→ 수업 4까지):** Top Module 통합, 합성, 보드 테스트

### 수업 4: 10주차 Wed — 보드 실습 + 디버깅

| 시간 | 활동 |
|------|------|
| 60min | **보드 실습**: 합성 + 다운로드 + 실제 동작 확인 + 디버깅 |
| 10min | 시연 리허설 — 시연 순서/방법 안내 |

> **이 시간 목표:** 보드에서 기본 기능 동작 확인
>
> **수업 외 과제 (→ 수업 5까지):** 도전 기능 마무리, 보고서 작성, 시연 준비

### 수업 5: 11주차 Mon — 시연 + 제출

| 시간 | 활동 |
|------|------|
| 5min | 최종 준비 |
| 55min | **시연** (12조 × ~4min: 보드 시연 2min + 질의 2min) |
| 10min | 보고서 제출, 프로젝트 마무리 |

### 시연 운영

같은 과제끼리 연속 시연하여 비교 가능하게 배치한다:

```
A(시계) 1조, 2조, 3조 → B(교통) 4조, 5조 → C(주차) 6조, 7조
→ D(자판기) 8조, 9조 → E(자물쇠) 10조, 11조, 12조
```

시연 시 확인 사항:

| 항목 | 확인 |
|------|------|
| 기본 기능 동작 | 보드에서 실제 동작 확인 |
| 도전 기능 동작 | 해당 기능 시연 시 확인 |
| 팀원 전원 이해 | 질의에 팀원 모두 답변 가능한지 |

---

## 조별 산출물 체크리스트

| 시점 | 산출물 | 확인 기준 |
|------|--------|----------|
| 수업 2 (9주 Wed) | 블록 다이어그램 | 모듈 3개 이상, 신호 이름 명시 |
| 수업 2 (9주 Wed) | FSM 상태 전이도 | 상태/전이 조건/출력 명확 |
| 수업 3 (10주 Mon) | 핵심 모듈 + TB | ModelSim 파형 캡처, PASS 확인 |
| 수업 3 (10주 Mon) | 합성 Warning 확인 | inferred latch 없음 |
| 수업 4 (10주 Wed) | 보드 동작 | HEX, LED 기본 기능 정상 |
| 수업 5 (11주 Mon) | 시연 + 보고서 | 전체 기능 동작 + 문서 제출 |

## 공용 모듈 제공 (새로 만들 필요 없음)

아래 모듈은 강의에서 이미 완성된 코드를 제공한다. 팀은 이 모듈을 그대로 사용하고 프로젝트 고유 모듈에 집중하라.

| 모듈 | 출처 | 용도 |
|------|------|------|
| `btn_debounce` | 4주차 | KEY 디바운스 (parameter DEBOUNCE_CNT) |
| `seg7_decoder` | 1주차 | 7-segment 표시 |
| `bcd_digit` | 5주차 | 0~9 BCD 카운터 |
| `prescaler_100hz` | 5주차 | 50MHz → 100Hz tick (parameter MAX) |

> 💡 **TIP:** prescaler의 MAX 값을 변경하면 1Hz(MAX=49,999,999), 2Hz(MAX=24,999,999) 등 원하는 주기를 얻을 수 있다.

---

## 9주차 미니 강의: 프로젝트를 위한 추가 개념 (30min)

### (1) 60진 카운터 — 과제 A, B에 필요

5주차 `bcd_digit`는 0~9 카운트였다. 시계/타이머에는 0~59가 필요하다.

```verilog
// 방법: bcd_digit 2개를 체인하되, 상위 자리를 0~5로 제한
module counter_60(
    input            clk, rst_n, tick_in,
    output [3:0]     ones, tens,     // BCD 2자리
    output           carry           // 59→00 시 1-clk pulse
);
    wire carry_ones;
    bcd_digit u_lo(.clk(clk), .rst_n(rst_n), .tick_in(tick_in),
                   .digit(ones), .carry(carry_ones));

    // 상위 자리: 0~5 (6이 되면 0으로 리셋)
    reg [3:0] tens_r;
    always @(posedge clk or negedge rst_n) begin
        if (!rst_n)             tens_r <= 4'd0;
        else if (carry_ones)    tens_r <= (tens_r == 4'd5) ? 4'd0 : tens_r + 4'd1;
    end
    assign tens  = tens_r;
    assign carry = (tens_r == 4'd5) && carry_ones;  // 59→00
endmodule
```

> 💡 **다른 방법:** 0~59 단일 카운터 + 나눗셈/모듈로 연산으로도 구현 가능하다.
> ```verilog
> reg [5:0] count;  // 0~59
> always @(posedge clk or negedge rst_n)
>     if (!rst_n)          count <= 0;
>     else if (tick_in)    count <= (count == 6'd59) ? 6'd0 : count + 1;
> assign tens  = count / 10;   // 상위 자리
> assign ones  = count % 10;   // 하위 자리
> assign carry = (count == 6'd59) && tick_in;
> ```
> Quartus가 `/10`, `%10`을 조합논리로 합성한다. BCD 체인 방식이 리소스 효율적이지만, 단일 카운터 방식이 코드가 더 짧다. 어느 방법이든 동작이 맞으면 된다.

### (2) 다운 카운터 — 과제 B, C에 필요

교통 신호의 남은 시간 카운트다운, 주차장 타이머 등에 사용한다.

```verilog
// load_val을 로드한 후, tick마다 1씩 감소, 0 도달 시 done 출력
module countdown_timer #(
    parameter WIDTH = 8
)(
    input                   clk, rst_n,
    input                   load,           // 1: load_val 로드
    input                   tick,           // 1: 1씩 감소
    input  [WIDTH-1:0]      load_val,       // 초기값
    output reg [WIDTH-1:0]  count,
    output                  done            // count == 0
);
    always @(posedge clk or negedge rst_n) begin
        if (!rst_n)        count <= 0;
        else if (load)     count <= load_val;
        else if (tick && count != 0) count <= count - 1;
    end
    assign done = (count == 0);
endmodule
```

### (3) 간이 곱셈 — 과제 C에 필요

요금 = 경과시간 × 단가. Verilog `*` 연산자는 조합논리로 합성된다.

```verilog
// 조합논리 곱셈 (합성 가능, 작은 비트폭에 적합)
wire [15:0] fee = time_count * UNIT_PRICE;

// 또는 시프트로 구현 (단가가 2의 거듭제곱일 때)
// 단가=4: fee = time_count << 2;
// 단가=10: fee = (time_count << 3) + (time_count << 1);
```

> 💡 **TIP:** 이 과목 범위에서는 `*` 연산자를 사용해도 된다. Quartus가 자동으로 곱셈기를 합성한다.

### (4) 레지스터 배열 — 과제 D, E에 필요

자판기 재고 3개, 자물쇠 비밀번호 4자리 등 여러 값을 저장할 때 사용한다.

```verilog
// 방법 1: 개별 reg
reg [3:0] stock_a, stock_b, stock_c;

// 방법 2: 배열 (더 깔끔)
reg [3:0] stock [0:2];   // stock[0]=A, stock[1]=B, stock[2]=C

// 접근
stock[sel] <= stock[sel] - 1;  // sel로 선택하여 감소
```

### (5) seg7 문자 표시 — 과제 E에 필요

7-segment로 알파벳 일부를 표시할 수 있다. (Active Low 기준)

```verilog
// 추가 문자 인코딩 (HEX[6:0] = {g,f,e,d,c,b,a})
localparam SEG_L = 7'b100_0111;  // L
localparam SEG_O = 7'b100_0000;  // O (=0)
localparam SEG_P = 7'b000_1100;  // P
localparam SEG_E = 7'b000_0110;  // E
localparam SEG_n = 7'b010_1011;  // n
localparam SEG_r = 7'b010_1111;  // r
localparam SEG_d = 7'b010_0001;  // d
localparam SEG_b = 7'b000_0011;  // b
localparam SEG_BLANK = 7'b111_1111;  // blank
```

---

---

## 공통 요구사항

1. **모듈 분리**: Top Module + 하위 모듈 최소 3개 이상
2. **FSM**: 3-Process 패턴 (P1: state reg, P2: next state, P3: output)
3. **btn_debounce**: 모든 KEY 입력에 디바운스 적용 (`parameter DEBOUNCE_CNT`)
4. **시뮬레이션**: 핵심 모듈 1개 이상 TB 작성 + ModelSim 파형 캡처
5. **보드 시연**: 수업 5(11주 Mon)에서 실제 보드 동작 시연

## 제출물 (수업 5에서 제출)

| 항목 | 파일 |
|------|------|
| 소스코드 | 모든 .v 파일 (Top + 하위 + TB) |
| 핀 배정 | .qsf 파일 |
| 시뮬레이션 | ModelSim 파형 캡처 (.png) |
| 보고서 | 블록 다이어그램, FSM 전이도, 핀 배정표, 소스, 시뮬레이션 결과 |

## 팀 역할 분담 예시 (3인)

| 역할 | 담당 |
|------|------|
| 팀원 A | Controller FSM 설계 + TB |
| 팀원 B | Datapath 모듈 설계 (counter, comparator 등) |
| 팀원 C | Top Module 통합 + 보드 핀 배정 + 시연 |

---

## 배점 체계

과제 난이도에 따라 **기본점을 차등** 적용하고, **도전 기능으로 추가 득점**한다.

| 구분 | 과제 A, B (★★☆) | 과제 C, D, E (★★★) |
|------|-----------|-------------|
| 기본 기능 (필수) | 65점 | 75점 |
| 도전 기능 (선택) | 각 5점 × 3개 = 15점 | 각 5점 × 3개 = 15점 |
| 보고서 + 시연 | 10점 | 10점 |
| 최대 합계 | **90점** | **100점** |
| 보너스 | TB 우수 +5 | TB 우수 +5 |

> 📝 **NOTE:** 쉬운 과제(A,B)를 선택하면 만점이 90점이다. 어려운 과제(C,D,E)는 기본 기능만 잘 구현해도 85점(75+10)이 확보되고, 도전 기능까지 완성하면 100점이다. TB 보너스(+5)는 모든 과제에 공통 적용되며, Self-Checking TB를 작성하고 핵심 시나리오를 자동 검증하면 받을 수 있다.

---

## 과제 A: 디지털 시계 (Digital Clock) — 난이도 ★★☆

### 동작 설명

디지털 시계는 전원이 들어오면 00:00부터 자동으로 동작하는 24시간 시계이다. HEX3:HEX2에 시(HH), HEX1:HEX0에 분(MM)이 표시되며, 초의 진행은 LED로 시각적으로 보여준다.

내부적으로는 prescaler가 50MHz 클럭을 1초 tick으로 변환하고, 이 tick이 초 카운터(0~59)를 구동한다. 초 카운터가 59→0으로 넘어갈 때 carry가 발생하여 분 카운터를 +1 하고, 분이 59→0으로 넘어가면 시 카운터를 +1 한다. 시 카운터는 23→0으로 순환한다.

사용자는 KEY를 눌러 설정 모드에 진입할 수 있다. 설정 모드에서는 시 또는 분을 개별적으로 증가시켜 현재 시각을 맞출 수 있다. 설정 중에도 초 카운터는 계속 동작한다.

### 동작 시나리오

전원을 켜면 시계가 **00:00**(시:분)으로 시작하여 1분마다 분이 1씩 증가한다. HEX3:HEX2에 시(HH), HEX1:HEX0에 분(MM)이 표시된다. 초 단위는 HEX에 직접 표시하지 않고, **LED로 초의 진행 상황**을 시각적으로 보여준다 (예: 6초마다 LED 1개씩 점등).

분이 59에서 다음으로 넘어가면 시가 1 증가하고 분은 00으로 돌아간다. 시가 23에 도달한 후 다음 분이 되면 시도 00으로 돌아가서 하루가 새로 시작된다.

시계는 **항상 동작**한다. 사용자가 시간을 맞추고 싶으면 mode 버튼(KEY[0])을 눌러 **시 설정 모드**로 진입할 수 있다. 이 상태에서 increment 버튼(KEY[1])을 누를 때마다 시(HH)가 1씩 증가하고, 23에서 다시 0으로 돌아간다. mode 버튼을 다시 누르면 **분 설정 모드**로 전환되어 같은 방식으로 분(MM)을 조정할 수 있다. 한 번 더 누르면 정상 동작 모드로 복귀한다.

설정 모드 중에도 내부 시간은 계속 흐르지만, 화면 표시는 사용자가 조작 중인 값을 보여준다.

### 기본 기능 (65점)

| 기능 | 배점 | 설명 |
|------|------|------|
| 시간 카운트 | 25점 | HEX3:HEX2=시(HH), HEX1:HEX0=분(MM), 00:00~23:59 |
| 1초 정확도 | 15점 | prescaler_1hz 사용, 정확한 카운트 |
| 초 LED 표시 | 15점 | LED로 초의 진행을 시각적으로 표시 (방법은 자유) |
| 모듈 분리 | 10점 | Top + 최소 3개 하위 모듈 |

> 📝 **NOTE:** 초 LED 표시 방법은 팀이 자유롭게 결정한다. 예: 6초마다 LED 1개씩 누적, 바 그래프, 점멸 속도 변화 등.

### 도전 기능 (각 5점)

| 도전 | 설명 |
|------|------|
| 시간 설정 | 설정 모드에서 시/분 개별 증가 (KEY 조작) |
| 알람 | 알람 시각 설정 → 도달 시 LED 점멸 → KEY 해제 |
| 12/24시간 | SW 전환으로 12시간(AM/PM)/24시간 모드 |

### 설계 힌트

```
모듈 구성:
  clock_top
  ├── btn_debounce x2       (mode, increment)
  ├── prescaler_1hz         ← 5주차 prescaler 재사용 (MAX=49_999_999)
  ├── counter_60 (초)       ← 내부용, HEX에 안 나감, carry → 분
  ├── counter_60 (분)       ← HEX1:HEX0 표시, carry → 시
  ├── counter_24 (시)       ← HEX3:HEX2 표시, 0~23 순환
  ├── clock_controller      ← FSM (RUN, SET_HR, SET_MIN)
  ├── sec_led_driver        ← 초 카운터 값 → LED 패턴 변환
  └── seg7_decoder x4

FSM 힌트:
  S_RUN     : 정상 동작 (mode 누르면 → S_SET_HR)
  S_SET_HR  : 시 설정 (increment 누르면 시 +1, mode 누르면 → S_SET_MIN)
  S_SET_MIN : 분 설정 (increment 누르면 분 +1, mode 누르면 → S_RUN)

counter_24 핵심:
  always @(posedge clk or negedge rst_n)
    if (!rst_n)          count <= 0;
    else if (tick_in)    count <= (count == 5'd23) ? 5'd0 : count + 1;
```

### 보드 매핑

| 신호 | DE0 | DE1 |
|------|-----|-----|
| rst_n | SW[7] | KEY[3] |
| mode (설정 진입/전환) | KEY[0] | KEY[0] |
| increment (+1) | KEY[1] | KEY[1] |
| HEX3:HEX2 | HH (시) | HH (시) |
| HEX1:HEX0 | MM (분) | MM (분) |
| 초 진행 LED | LEDG[7:0] | LEDR[9:0] |

---

## 과제 B: 교차로 교통 신호 (Advanced Traffic Light) — 난이도 ★★☆

### 동작 설명

2방향 교차로의 교통 신호를 제어하는 시스템이다. 주도로(Main)와 보조도로(Side)에 각각 R(빨강), Y(노랑), G(초록) 신호가 있으며, LED로 표시한다.

동작 순서는 다음과 같다: 주도로 초록(15초) → 주도로 노랑(3초) → 보조도로 초록(10초) → 보조도로 노랑(3초) → 다시 주도로 초록... 으로 무한 반복한다. 한쪽이 초록/노랑일 때 반대쪽은 항상 빨강이다.

HEX1:HEX0에는 현재 신호의 남은 시간(초)이 카운트다운으로 표시된다. 예를 들어 주도로 초록이 시작되면 15부터 0까지 감소하며, 0이 되면 자동으로 다음 상태로 전이한다.

야간 모드(SW 전환)에서는 정상 순환을 멈추고 양방향 모두 황색이 0.5초 간격으로 점멸한다.

### 동작 시나리오

2개 도로(주도로 Main, 보조도로 Side)가 만나는 교차로의 신호등을 제어하는 시스템이다. 신호는 4개 상태가 차례로 순환한다:

1. **Main 초록(15초)**: Main 방향 차량 통행, Side는 빨강. HEX1:HEX0에 남은 시간이 카운트다운된다.
2. **Main 노랑(3초)**: Main 정지 준비, Side는 빨강 유지.
3. **Side 초록(10초)**: Side 방향 통행, Main은 빨강.
4. **Side 노랑(3초)**: Side 정지 준비, Main은 빨강 유지.

각 단계가 끝나면 다음 단계로 자동 전환되며, 마지막 단계가 끝나면 다시 처음으로 돌아가 무한 반복된다. 각 단계의 남은 시간은 항상 HEX에 표시되어 운전자가 신호 변경 시점을 예측할 수 있다.

LED는 신호등 색깔을 표시한다. Main 방향 R/Y/G와 Side 방향 R/Y/G를 각각 별도 LED에 매핑한다. 한 번에 한 색만 켜진다 (예: Main이 초록일 때 Main R=꺼짐, Y=꺼짐, G=켜짐, Side R=켜짐, Y=꺼짐, G=꺼짐).

전체 주기는 15+3+10+3 = 31초이며, 이 시퀀스가 끊임없이 반복된다.

### 기본 기능 (65점)

| 기능 | 배점 | 설명 |
|------|------|------|
| 2방향 순환 | 25점 | Main(G→Y) → Side(G→Y) → Main... 반복 |
| 타이밍 정확 | 15점 | MG:15초, MY:3초, SG:10초, SY:3초 |
| 카운트다운 표시 | 15점 | HEX1:HEX0에 남은 초 표시 |
| 모듈 분리 | 10점 | Top + 최소 3개 하위 모듈 |

### 도전 기능 (각 5점)

| 도전 | 설명 |
|------|------|
| 보행자 버튼 | KEY 누르면 다음 사이클에 보행자 신호 삽입 |
| 야간 모드 | SW 전환 → 양방향 황색 점멸 (0.5초 주기) |
| 좌회전 신호 | Main에 좌회전 전용 단계 추가 |

### 설계 힌트

```
모듈 구성:
  traffic_top
  ├── btn_debounce x1       (보행자, 도전 기능 시)
  ├── prescaler_1hz
  ├── countdown_timer       ← 미니강의 (2) 참조
  ├── traffic_controller    (FSM)
  └── seg7_decoder x2

FSM 힌트:
  각 상태 진입 시 countdown_timer에 해당 시간 load
  done 신호로 다음 상태 전이

  S_MG: load=15 → 카운트다운 → done → S_MY
  S_MY: load=3  → done → S_SG
  S_SG: load=10 → done → S_SY
  S_SY: load=3  → done → S_MG
  (도전) S_WALK: load=8  → done → S_SG (보행자 요청 시 SY 후 삽입)

LED 출력 (조합논리):
  always @(*) case (state)
      S_MG: {main_RYG, side_RYG} = 6'b001_100;  // Main G, Side R
      S_MY: {main_RYG, side_RYG} = 6'b010_100;  // Main Y, Side R
      S_SG: {main_RYG, side_RYG} = 6'b100_001;
      S_SY: {main_RYG, side_RYG} = 6'b100_010;
  endcase

카운트다운 BCD 변환:
  HEX1 = countdown / 10;   // 십의 자리
  HEX0 = countdown % 10;   // 일의 자리
```

### 보드 매핑

| 신호 | DE0 | DE1 |
|------|-----|-----|
| rst_n | SW[7] | KEY[3] |
| 보행자 (도전) | KEY[0] | KEY[0] |
| 야간 모드 (도전) | SW[0] | SW[0] |
| Main {R,Y,G} | LEDG[2:0] | LEDR[2:0] |
| Side {R,Y,G} | LEDG[5:3] | LEDR[5:3] |
| 카운트다운 | HEX1:HEX0 | HEX1:HEX0 |

---

## 과제 C: 자동 주차장 시스템 (Parking Lot Controller) — 난이도 ★★★

### 동작 설명

주차장의 입구와 출구에 센서가 있어 차량의 입출을 감지하는 시스템이다. 입구 센서(KEY[0])가 눌리면 현재 주차 대수가 +1, 출구 센서(KEY[1])가 눌리면 -1 된다. 현재 대수는 HEX1:HEX0에 표시된다.

주차장 최대 용량은 SW[3:0]으로 설정한다 (예: SW=0101이면 최대 5대). 현재 대수가 최대 용량에 도달하면 만차(FULL) 상태가 되어 LED 경고가 켜지고, HEX3에 "F"가 표시된다. 만차 상태에서는 입구 센서를 눌러도 카운트가 증가하지 않는다. 반대로 현재 대수가 0일 때 출구 센서를 눌러도 카운트가 감소하지 않는다 (underflow 방지).

관리자 모드(도전 기능)에서는 카운트를 리셋하거나 최대 용량을 변경할 수 있다.

### 동작 시나리오

주차장 입구와 출구에 차량 감지 센서가 있다고 가정한다. 입구 센서(KEY[0])가 눌리면 차가 한 대 들어온 것이고, 출구 센서(KEY[1])가 눌리면 한 대가 나간 것이다. 시스템은 현재 주차된 차량 수를 항상 파악하고 HEX1:HEX0에 두 자리 숫자로 표시한다.

주차장의 최대 수용 용량은 SW[3:0]으로 설정한다 (예: SW[3:0] = 4'd8이면 최대 8대). 현재 대수가 최대 용량에 도달하면 **만차 상태**가 되어:

- HEX3 위치에 'F' 문자가 표시된다 (Full)
- 만차 LED가 점등된다 (LEDG[7] 또는 LEDR[9])
- 입구 센서가 눌려도 카운트가 증가하지 않는다 (입차 거부)

만차가 아닐 때는 HEX3이 비어 있거나 '0'으로 표시된다. 출차로 차량 수가 줄어들어 만차에서 벗어나면 다시 입차 가능해진다.

차량 수가 0인 상태에서 출구 센서가 눌리면 카운트가 음수가 되지 않도록 보호한다 (underflow 방지). 입구와 출구 센서가 동시에 눌리는 경우(같은 클럭에 둘 다 1)는 입구를 우선 처리하여 +1로 동작한다.

이 시스템은 별도 시작/정지 없이 전원이 들어오면 항상 동작한다.

### 기본 기능 (75점)

| 기능 | 배점 | 설명 |
|------|------|------|
| 입출 카운트 | 25점 | 입구(+1), 출구(-1), 0 이하 방지 |
| 만차 판정 | 20점 | SW[3:0]으로 최대 용량 설정, 도달 시 LED 경고 |
| HEX 표시 | 15점 | HEX1:HEX0=현재 대수, HEX3=상태(F:Full, 0:OK) |
| 모듈 분리 | 15점 | Top + 최소 3개 하위 모듈 |

### 도전 기능 (각 5점)

| 도전 | 설명 |
|------|------|
| 요금 표시 | 출차 시 경과 시간(초)을 HEX에 표시. 곱셈까지 하면 가산점 |
| 관리자 모드 | SW 조합으로 카운트 리셋, 용량 변경 |
| Self-Checking TB | 입출 시나리오 + 만차/underflow 자동 검증 |

### 설계 힌트

```
모듈 구성:
  parking_top
  ├── btn_debounce x2       (입구, 출구)
  ├── parking_controller    (FSM, 단순)
  ├── updown_counter        (0~MAX, underflow 방지)
  ├── comparator            (count == capacity?)
  └── seg7_decoder x4

updown_counter 핵심:
  always @(posedge clk or negedge rst_n)
    if (!rst_n)         count <= 0;
    else if (enter && count < capacity) count <= count + 1;
    else if (exit  && count > 0)        count <= count - 1;

  NOTE: enter와 exit가 동시에 1이면 위 코드처럼 enter를 우선 처리한다.

만차 판정:
  assign full = (count >= capacity);
  // 입차 시 count < capacity 체크가 이미 있으므로,
  // 만차 시 enter 신호가 들어와도 카운트가 증가하지 않음

HEX 표시:
  HEX1 = count / 10;   // 십의 자리 (BCD)
  HEX0 = count % 10;   // 일의 자리
  HEX3 = full ? 'F' : '0';  // seg7 문자 (미니강의 (5))
```

### 보드 매핑

| 신호 | DE0 | DE1 |
|------|-----|-----|
| rst_n | SW[7] | KEY[3] |
| 입구 센서 | KEY[0] | KEY[0] |
| 출구 센서 | KEY[1] | KEY[1] |
| 관리자 (도전) | KEY[2] | KEY[2] |
| 최대 용량 | SW[3:0] | SW[3:0] |
| 현재 대수 | HEX1:HEX0 | HEX1:HEX0 |
| 상태 (F/0) | HEX3 | HEX3 |
| 만차 LED | LEDG[7] | LEDR[9] |

---

## 과제 D: 자판기 확장 (Advanced Vending Machine) — 난이도 ★★★

### 동작 설명

4주차에서 만든 자판기를 확장하여 3종 음료(A=30원, B=50원, C=40원)를 판매하는 자판기이다. 4주차 자판기는 FSM 상태 자체가 금액을 표현했지만, 확장판에서는 **투입금을 레지스터에 누적**하는 방식으로 설계한다. 이것이 6주차에서 배운 Datapath 분리 개념의 실전 적용이다.

사용자는 KEY[0]으로 10원, KEY[1]으로 20원을 투입한다. 투입할 때마다 잔액이 누적되어 HEX1:HEX0에 표시된다. SW[1:0]으로 원하는 음료를 선택(00=A, 01=B, 10=C)한 후 KEY[2]를 누르면, 투입금이 가격 이상이면 음료가 배출(LED 점등)되고 거스름돈이 HEX3:HEX2에 표시된다. 투입금이 부족하면 배출되지 않는다.

SW[6](DE0) 또는 SW[9](DE1)를 올리면 투입금이 환불(cancel)되어 잔액이 0으로 돌아간다.

### 동작 시나리오

3종류의 음료를 판매하는 자판기다. 음료 A는 30원, B는 50원, C는 40원이다. 사용자가 SW[1:0]으로 원하는 음료를 선택한다 (00=A, 01=B, 10=C).

사용자는 KEY[0]으로 10원, KEY[1]로 20원을 투입한다. 누를 때마다 투입금이 누적되어 HEX1:HEX0에 현재 투입된 총액이 표시된다 (예: 10원 한 번 + 20원 두 번 = 50원이면 HEX에 "50" 표시).

투입금이 선택한 음료의 가격 이상이 되면 KEY[2](select)를 눌러 배출을 요청할 수 있다. 가격 이상이면 음료가 배출되고(dispense LED 점등), 거스름돈이 HEX3:HEX2에 표시된다 (예: 50원 투입 + 음료 A(30원) 선택 = 거스름돈 20원). 배출 후 투입금은 자동으로 0이 된다.

투입금이 선택한 음료의 가격보다 적은 상태에서 select를 누르면 아무 일도 일어나지 않는다 (또는 LED로 부족 표시).

언제든 사용자는 cancel(SW[6] 또는 SW[9])을 활성화하여 투입금을 환불받을 수 있다. 투입금이 0으로 리셋되고 거스름돈 영역에 환불 금액이 표시된다.

이 과제의 핵심은 4주차 자판기와의 차이점이다. 4주차에서는 FSM의 각 상태가 곧 금액(S_COIN10, S_COIN20, S_COIN30...)을 의미했지만, 확장판에서는 별도의 **데이터패스 레지스터(coin_register)**가 투입금을 누적한다. 이로써 어떤 금액 조합이든 처리할 수 있고, FSM은 동작 흐름만 관리한다.

### 기본 기능 (75점)

| 기능 | 배점 | 설명 |
|------|------|------|
| 3종 음료 선택 | 20점 | A(30원), B(50원), C(40원), SW[1:0]으로 선택 |
| 투입/거스름 | 25점 | 10원/20원 투입, 정확한 거스름돈 계산 |
| HEX 표시 | 15점 | HEX1:HEX0=투입금, HEX3:HEX2=음료/거스름 |
| 모듈 분리 | 15점 | Top + 최소 3개 하위 모듈 |

### 도전 기능 (각 5점)

| 도전 | 설명 |
|------|------|
| 재고 관리 | 각 음료 재고 9개, 배출 시 -1, 0이면 SOLD OUT |
| 표시 전환 | MODE 버튼으로 투입금/재고 전환 표시 |
| Self-Checking TB | 투입/선택/거스름/재고 시나리오 자동 검증 |

### 설계 힌트

```
모듈 구성:
  vending_adv_top
  ├── btn_debounce x3        (coin10, coin20, select)
  ├── vending_controller     (FSM: IDLE, COIN, DISPENSE, CHANGE)
  ├── coin_register          (투입금 누적, datapath register)
  ├── price_table            (case로 음료별 가격 출력)
  ├── change_calc            (조합논리: balance - price)
  └── seg7_decoder x4

4주차와의 차이점:
  4주차: state가 곧 금액 (S_COIN10, S_COIN20, ...)
  확장판: coin_register에 금액 누적 (datapath register)
         → 어떤 금액 조합이든 처리 가능
  cancel: SW[6](DE0) 또는 SW[9](DE1) 사용

coin_register 핵심:
  always @(posedge clk or negedge rst_n)
    if (!rst_n)              balance <= 0;
    else if (cancel)         balance <= 0;
    else if (coin_10)        balance <= balance + 8'd10;
    else if (coin_20)        balance <= balance + 8'd20;
    else if (dispense)       balance <= 0;

가격 테이블 (조합논리):
  always @(*) case(sw_sel)
    2'b00: price = 8'd30;  // A
    2'b01: price = 8'd50;  // B
    2'b10: price = 8'd40;  // C
    default: price = 8'd0;
  endcase

거스름돈:
  assign change = balance - price;  // balance >= price 조건에서만 의미
  assign can_dispense = (balance >= price);
```

### 보드 매핑

| 신호 | DE0 | DE1 |
|------|-----|-----|
| rst_n | SW[7] | KEY[3] |
| coin_10 | KEY[0] | KEY[0] |
| coin_20 | KEY[1] | KEY[1] |
| select (배출) | KEY[2] | KEY[2] |
| 음료 선택 | SW[1:0] (00=A, 01=B, 10=C) | SW[1:0] |
| cancel (환불) | SW[6] | SW[9] |
| 투입금 | HEX1:HEX0 | HEX1:HEX0 |
| 음료/거스름 | HEX3:HEX2 | HEX3:HEX2 |
| dispense LED | LEDG[0] | LEDR[0] |
| SOLD OUT (도전) | LEDG[7] | LEDR[9] |

---

## 과제 E: 암호 자물쇠 (Combination Lock) — 난이도 ★★★

### 동작 설명

4자리 비밀번호를 순서대로 입력하여 자물쇠를 여는 시스템이다. 전원이 들어오면 HEX에 "LOC-" (LOCKED)가 표시되며 잠긴 상태에서 시작한다.

사용자는 SW[3:0]으로 첫 번째 자릿값(0~9)을 설정한 후 KEY[0](enter)를 누른다. 그러면 HEX에 "d1 --"이 표시되어 1번째 자리가 입력되었음을 알린다. 같은 방식으로 2, 3, 4번째 자리를 순서대로 입력한다. 이미 입력된 자리는 '*'로 가려져 보안을 유지한다.

4자리 입력이 완료되면 시스템이 자동으로 비밀번호를 비교한다. 4자리 모두 일치하면 HEX에 "OPEn"이 표시되고 LED 전체가 점등(OPEN)된다. 불일치하면 HEX에 "Err"과 실패 횟수가 표시되고, 3초 후 자동으로 LOCKED 상태로 돌아간다.

비밀번호는 초기값이 하드코딩되어 있으며 (예: 1-2-3-4), 도전 기능으로 OPEN 상태에서 새 비밀번호를 설정하는 기능을 추가할 수 있다.

### 동작 시나리오

4자리 비밀번호로 잠금/해제되는 전자 자물쇠다. 비밀번호의 각 자리는 0~F의 16진수 1자리이며 (예: "1234", "A5C9"), 초기 비밀번호는 코드 내에 parameter로 정의된다 (예: 4'h1, 4'h2, 4'h3, 4'h4).

전원이 켜지면 자물쇠는 **잠긴 상태**로 시작한다. HEX에 "LOC -" 같은 잠금 표시가 나타난다. 사용자는 SW[3:0]으로 첫 번째 자리 숫자를 입력하고 KEY[0](enter)를 누른다. 시스템은 첫 자리를 내부에 저장하고 다음 자리 입력 대기 상태로 넘어간다 (HEX에 "d1 -" → "d2 -*" 형식으로 진행 상황 표시).

이 과정을 4번 반복하여 4자리를 모두 입력하면 시스템은 입력값과 저장된 비밀번호를 비교한다:

- **일치**: HEX에 "OPEn"이 표시되고 모든 LED가 점등된다 (열림 상태). 사용자가 KEY[1](cancel)을 눌러 다시 잠그면 LOCKED 상태로 복귀한다.
- **불일치**: HEX에 "Err N" (N=실패 횟수)이 표시되고, 약 3초간 입력이 차단된다 (LOCKOUT). 3초 후 자동으로 LOCKED 상태로 돌아간다.

연속해서 비밀번호를 3번 틀리면 시스템이 영구 잠금된다. HEX에 "bLOC"이 표시되고 어떤 입력도 받지 않는다. 오직 rst_n으로만 해제 가능하다.

OPEN 상태에서는 mode 버튼(KEY[2])을 누르면 비밀번호 변경 모드로 진입할 수 있다. 새 비밀번호 4자리를 같은 방식으로 입력하면 저장된다.

### 기본 기능 (75점)

| 기능 | 배점 | 설명 |
|------|------|------|
| 4자리 입력 | 25점 | SW[3:0]으로 한 자리씩, KEY로 확인 |
| 비교 판정 | 20점 | 4자리 일치 → OPEN, 불일치 → ERROR |
| 상태 표시 | 15점 | HEX에 상태 문자 표시 (LOCK, d1~d4, OPEn, Err) |
| 모듈 분리 | 15점 | Top + 최소 3개 하위 모듈 |

### 도전 기능 (각 5점)

| 도전 | 설명 |
|------|------|
| 보안 잠금 | 3회 연속 실패 → 영구 잠금 (rst로만 해제) |
| 비밀번호 변경 | OPEN 상태에서 KEY 조합으로 새 PW 설정 |
| Self-Checking TB | 성공/실패/잠금 시나리오 자동 검증 |

### HEX 상태 표시 예시

| 상태 | HEX3 | HEX2 | HEX1 | HEX0 | 의미 |
|------|------|------|------|------|------|
| LOCKED | L | O | C | - | 잠김 (대기 중) |
| 1번째 입력 후 | d | 1 | * | - | 첫 자리 저장 완료 |
| 2번째 입력 후 | d | 2 | * | * | 두 자리 입력 |
| 3번째 입력 후 | d | 3 | * | * | 세 자리 입력 |
| 4번째 입력 후 | d | 4 | * | * | 비교 직전 |
| OPEN | O | P | E | n | 열림 |
| ERROR | E | r | r | (횟수) | 오류, LOCKOUT 진행 중 |
| BLOCKED | b | L | O | C | 영구 잠금 (도전 기능) |

> 📝 **NOTE:** 위 문자 표시는 미니강의 (5)의 SEG_L, SEG_O, SEG_E 등을 사용한다. '*'는 SEG_BLANK 또는 가운데 막대만 켜는 패턴 등 학생이 결정한다.

### 설계 힌트

```
모듈 구성:
  lock_top
  ├── btn_debounce x3        (enter, cancel, mode)
  ├── lock_controller        (FSM, 8+ 상태)
  ├── password_reg           (4x4bit, parameter 초기값)
  ├── input_reg              (4x4bit, 순차 저장)
  ├── comparator_4digit      (4자리 일괄 ==)
  ├── fail_counter           (0~3, 도전 기능)
  ├── lockout_timer          (prescaler + 3초 카운트)
  └── seg7_char_decoder      (숫자 + 문자 겸용)

FSM 핵심:
  S_LOCKED → S_D1 → S_D2 → S_D3 → S_D4 → S_CHECK
  S_CHECK: (input == password) ? S_OPEN : S_ERROR
  S_ERROR: 3초 LOCKOUT 후 S_LOCKED (fail_count +1)
  S_OPEN:  LED 전체 점등, cancel로 S_LOCKED 복귀

input_reg 저장 (레지스터 배열, 미니강의 (4)):
  reg [3:0] input_reg [0:3];
  S_D1 + enter: input_reg[0] <= SW[3:0];
  S_D2 + enter: input_reg[1] <= SW[3:0];
  ... (S_D3, S_D4 동일)

비교:
  assign match = (input_reg[0]==pw[0]) && (input_reg[1]==pw[1])
              && (input_reg[2]==pw[2]) && (input_reg[3]==pw[3]);

비밀번호 초기값:
  parameter [3:0] PW0 = 4'h1, PW1 = 4'h2, PW2 = 4'h3, PW3 = 4'h4;
```

### 보드 매핑

| 신호 | DE0 | DE1 |
|------|-----|-----|
| rst_n | SW[7] | KEY[3] |
| digit 입력 | SW[3:0] | SW[3:0] |
| enter (입력 확정) | KEY[0] | KEY[0] |
| cancel (잠금) | KEY[1] | KEY[1] |
| mode (PW 변경, 도전) | KEY[2] | KEY[2] |
| HEX3~HEX0 | 상태/입력 표시 | 상태/입력 표시 |
| OPEN LED | LEDG[7:0] 전체 | LEDR[9:0] 전체 |
| 실패 횟수 (도전) | LEDG[2:0] | LEDR[2:0] |

---

## 배점 요약

| 과제 | 난이도 | 기본 | 도전 | 보고서 | 합계 | 보너스 |
|------|--------|------|------|--------|------|--------|
| A. 디지털 시계 | ★★☆ | 65 | 15 | 10 | **90** | TB우수 +5 |
| B. 교통 신호 | ★★☆ | 65 | 15 | 10 | **90** | TB우수 +5 |
| C. 주차장 | ★★★ | 75 | 15 | 10 | **100** | TB우수 +5 |
| D. 자판기 확장 | ★★★ | 75 | 15 | 10 | **100** | TB우수 +5 |
| E. 암호 자물쇠 | ★★★ | 75 | 15 | 10 | **100** | TB우수 +5 |

> 💡 **TIP:** 쉬운 과제를 완벽하게 vs 어려운 과제에 도전 — 둘 다 90점대 도달 가능. 자신 있는 팀은 ★★★ 과제 + 도전 기능 전부 → 최대 105점(보너스 포함)으로 도전해 보라.
