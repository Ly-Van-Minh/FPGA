@echo off
set xv_path=D:\\Xilinx\\Vivado\\2017.2\\bin
call %xv_path%/xelab  -wto a6c9f429bb2f43ecb0a43e82eea290dd -m64 --debug typical --relax --mt 2 -L xil_defaultlib -L secureip --snapshot tb_Reg_Comp_Add_behav xil_defaultlib.tb_Reg_Comp_Add -log elaborate.log
if "%errorlevel%"=="0" goto SUCCESS
if "%errorlevel%"=="1" goto END
:END
exit 1
:SUCCESS
exit 0
