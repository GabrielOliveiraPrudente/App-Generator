# App-Generator
Project Generator for Application with Premake 5 (C/C++).
   
# Description
Windows and Linux cross-platform project generator to facilitate the creation of applications.  
After compiling in Release mode, the "Config" and "Content" folders will be copied to the "Binaries/Platform/Relese/AppData" folder to be distributed easily.  

# Generation
Copy the AppName Folder to another desired location and rename it to the desired app name.  
Change the Icon if you want in the "Programs/Premake5/AppIcon/AppIcon.ico" folder.  
Run one of the generators in the "Programs/Premake5" folder and go back to the root folder.  
In the case of Linux, it is necessary to allow the GMake2.sh file, Click on the file with the right button, go to Properties and check the execute box.  
  
After the generation, several folders will be created to help with the organization.  
Config -> Destined for App configuration files and will be copied in Release mode to the Final Package folder.  
Content-> Destined for App Resource files Images, Sounds ... and will be copied in Release mode to the Final Package folder.  
Source/AppName-> Intended for all App code files and is indicated as rais to locate with #include"File.h".  
Source/ThirdParty-> Intended for storing all libraries used in the App.  

# Macros
CONFIG_PATH      = Full path of the Config folder.  
CONTENT_PATH     = Full path of the Content folder.  
APP_ANAME        = Project name.  
Note-> All above need to be inside "STR(...)" macro to be converted to String.  
DEBUG_MODE       = Debug Mode.  
RELEASE_MODE     = Release Mode.  
PLATFORM_WINDOWS = Current Windows platform.  
PLATFORM_LINUX   = Current Linux platform.

# Note For Windows
You must have a version of "Visual Studio" or "Vs Build Tool" installed in the default locations.  
Commads..  
./App : Update the Project.  
./App make : Compile in Debug x64 mode.  
./App make "config=release_x64" : Compile in Release x64 mode.  

# Note For Linux
./App : Update the Project.  
make : Compile in Debug x64 mode.  
make config=release_x64 : Compile in Release x64 mode.  
