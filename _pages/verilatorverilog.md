---
layout: page
permalink: /verilatorverilog/
title: How to use Verilator to simulate Verilog code
description:
nav: false
---

### (a) Prepare Source Code

cnt_ceil.v:
```verilog
`timescale 1ns / 1ns
module counter (
    input wire clk,
    input wire rst,
    output reg [3:0] cnt
);
    always @(posedge clk or posedge rst) begin
        if (rst) begin
            cnt <= 4'b0;
        end else begin
            cnt <= cnt + 1;
        end
    end
endmodule
```

cnt_ceil_tb.v
```verilog
`timescale 1ns / 1ns
module counter_tb;
    // input signals
    reg        clk;
    reg        rst;
    //output signals
    wire [3:0] cnt;
    //instance
    counter x0 (
        .clk(clk),
        .rst(rst),
        .cnt(cnt)
    );

    //inputs
    initial begin  //clk
        forever #1 clk = ~clk;
    end

    initial begin
        #0 clk = 1'b0;
        rst = 1'b1;
        #10 rst = 1'b0;
        #110 $finish;
    end
endmodule
```

### (b) Prepare Verilator Wrapper

sim_main.cpp
```cpp
#include <verilated.h>
#include <verilated_vcd_c.h>
#include "Vcounter_tb.h" // <-- design changes here

int main(int argc, char** argv){
//构造环境对象，设计对象，波形对象
  VerilatedContext* m_contextp = new VerilatedContext;//环境
  VerilatedVcdC*    m_tracep   = new VerilatedVcdC;//波形
  Vcounter_tb*     m_duvp     = new Vcounter_tb;// <-- design changes here
//波形配置
  m_contextp->traceEverOn(true);//环境里打开波形开关
  m_duvp->trace(m_tracep,3);//深度为3
  m_tracep->open("wave.vcd");//打开要存数据的vcd文件
//写入数据到波形文件里
  while (!m_contextp->gotFinish()){
  //刷新电路状态
    m_duvp->eval();
  //dump数据
    m_tracep->dump(m_contextp->time());
  //增加仿真时间
    m_contextp->timeInc(1);
  }
//记得关闭trace对象以保存文件里的数据
  m_tracep->close();
//释放内存
  delete m_duvp;
  return 0;
}
```

### (c) To Run Simulation

run.sh
```bash
verilator -cc -trace --timing counter_tb.v -exe sim_main.cpp # <-- design changes here
cd ./obj_dir
make -f Vcounter_tb.mk # <-- design changes here
./Vcounter_tb
# gtkwave wave.vcd  # use gtkwave to open resultent waveform
```