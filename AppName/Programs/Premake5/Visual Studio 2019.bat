@echo off
cd "./Premake5" 
call premake5 GeneratorVs2019
cd "../../../"
call Project
pause