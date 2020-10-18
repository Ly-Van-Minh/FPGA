@echo off
set xv_path=D:\\Xilinx\\Vivado\\2017.2\\bin
call %xv_path%/xelab  -wto 7566056eda9c451fa07d81e975a7bddd -m64 --debug typical --relax --mt 2 -L xil_defaultlib -L secureip --snapshot tb_d_flipflop_behav xil_defaultlib.tb_d_flipflop -log elaborate.log
if "%errorlevel%"=="0" goto SUCCESS
if "%errorlevel%"=="1" goto END
:END
exit 1
:SUCCESS
exit 0
