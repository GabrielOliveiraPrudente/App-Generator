
SettingsString = [[
DIR=./Programs
if [ -d "$DIR" ];then
cd Programs/Premake5/Linux
./premake5 gmake2
else
cd ../../Programs/Premake5/Linux
./premake5 gmake2
fi
]]

