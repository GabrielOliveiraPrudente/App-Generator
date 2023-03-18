@echo off
cd "./Premake5" 
call premake5 GeneratorVs2017
cd "../../../"
call Project
pause