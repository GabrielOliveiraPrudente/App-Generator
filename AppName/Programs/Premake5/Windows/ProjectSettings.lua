Vs2017Path = "C:\\Program Files (x86)\\Microsoft Visual Studio\\2017\\Community\\Common7\\Tools\\VsDevCmd"
Vs2019Path = "C:\\Program Files (x86)\\Microsoft Visual Studio\\2019\\Community\\Common7\\Tools\\VsDevCmd"
Vs2022Path = "C:\\Program Files\\Microsoft Visual Studio\\2022\\Community\\Common7\\Tools\\VsDevCmd"

SettingsString = [[@echo off
If "%~1" == "run" GOTO RunDebugWin64
If "%~1" == "run config=release_x64" GOTO RunReleaseWin64
IF "%~1" == "make" GOTO MakeDebugWin64
IF "%~1" == "make config=release_x64" GOTO MakeReleaseWin64

:Refress
echo "Project Refresh"
cd "PROGRAMSPATH/Premake5/Windows"
call premake5 VSVERSION
cd "../../../"
GOTO Done

:RunDebugWin64
echo "Run Debug Win64"
call "Binaries/Win64/Debug/PROJECTNAME.exe"
GOTO Done

:RunReleaseWin64
echo "Run Release Win64"
call "Binaries/Win64/Release/PROJECTNAME.exe"
GOTO Done

:MakeDebugWin64
echo "Make Project Debug Win64"
if not defined DevEnvDir (
    call "VSPATH"
)
set solutionFile = "Workspace.sln"
msbuild /t:Build /p:Configuration=Debug /p:Platform=Win64 %solutionFile%
GOTO Done

:MakeReleaseWin64
echo "Make Project Release Win64"
if not defined DevEnvDir (
    call "VSPATH"
)
set solutionFile = "Workspace.sln"
msbuild /t:Build /p:Configuration=Release /p:Platform=Win64 %solutionFile%
GOTO Done


:Done

]]

