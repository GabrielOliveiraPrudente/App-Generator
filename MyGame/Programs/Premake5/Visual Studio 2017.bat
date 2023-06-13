@echo off
cd "./Windows" 
call premake5 GeneratorVs2017
cd "../../../"
call App
pause