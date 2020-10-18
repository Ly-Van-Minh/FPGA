@echo off
set xv_path=C:\\Xilinx\\Vivado\\2017.2\\bin
call %xv_path%/xelab  -wto 13d0c703d679494dbb5c43826058e6c3 -m64 --debug typical --relax --mt 2 -L xil_defaultlib -L secureip --snapshot tb_comp_add_behav xil_defaultlib.tb_comp_add -log elaborate.log
if "%errorlevel%"=="0" goto SUCCESS
if "%errorlevel%"=="1" goto END
:END
exit 1
:SUCCESS
exit 0
