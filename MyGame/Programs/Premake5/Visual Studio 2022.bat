@echo off
cd "./Windows" 
call premake5 GeneratorVs2022
cd "../../../"
call App
pause