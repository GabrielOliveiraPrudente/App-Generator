# App-Generator
 Project Generator for Application with Premake 5.
   
# Description
Generator to automate the creation of "Console App" application projects for Windows.  
The App Icon can be changed in the "Programs\Premake5\AppIcon\AppIcon.ico" folder.  
When generating the project, folders are created for the use of resources.  
Config  -> Destined for configuration files.  
Content -> Destined for asset files Images, Sounds and etc...  
Source/AppName -> Destined for project source files.  

# Generation
Rename the "AppName" folder to your project name.  
(Optional) Add an icon in place of the default "Programs/Premake5/AppIcon/AppIcon.ico" icon.  
Go to the "Programs/Premake5" folder and run the ".bat" file of the desired Visual Studio version.  

# Macros
CONFIG_PATH      = Full path of the Config folder.  
CONTENT_PATH     = Full path of the Content folder.  
DEBUG_MODE       = Debug Mode.  
RELEASE_MODE     = Release Mode.  
APP_ANAME        = Project name.  
PLATFORM_WINDOWS = Current Windows platform.

# Note
It is possible to use Visual Studio Code, but you must have a version of "Visual Studio" or a "Vs Build Tools" tool.  
To compile and run the project just call the file "Project.bat" in the command line passing the desired parameter.  
Compile in "Debug-Win64" mode-----> call Project.bat "make".  
Run     in "Debug-Win64" mode-----> call Project.bat "run".  
Compile in "Release-Win64" mode --> call Project.bat "make-r".  
Run     in "Release-Win64" mode --> call Project.bat "run -r".  
Depending on the mode, the path of the Config and Content folders changes to "Debug = Full Path" and "Release = Path Relative to .exe"  
In Release Mode all files from the "Config" and "Content" folders will be copied to the ".exe" folder "AppData".
