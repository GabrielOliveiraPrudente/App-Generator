@echo off
cd "./Windows" 
call premake5 GeneratorVs2019
cd "../../../"
call App
pause