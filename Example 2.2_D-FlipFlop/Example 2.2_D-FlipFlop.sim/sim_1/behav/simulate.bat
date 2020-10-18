@echo off
set xv_path=D:\\Xilinx\\Vivado\\2017.2\\bin
call %xv_path%/xsim tb_d_flipflop_behav -key {Behavioral:sim_1:Functional:tb_d_flipflop} -tclbatch tb_d_flipflop.tcl -log simulate.log
if "%errorlevel%"=="0" goto SUCCESS
if "%errorlevel%"=="1" goto END
:END
exit 1
:SUCCESS
exit 0
