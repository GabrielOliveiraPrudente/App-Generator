@echo off
cd "./Premake5" 
call premake5 GeneratorVs2022
cd "../../../"
call Project
pause