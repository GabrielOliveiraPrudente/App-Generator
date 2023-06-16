os.chdir('../../../')
WorkspaceName = path.getbasename(os.getcwd())
ProjectName   = WorkspaceName
ContentPath   = path.getabsolute('Content')  .. '/'
ConfigPath    = path.getabsolute('Config')   .. '/'

-- Add Custon Link Path
function LinkLibraries()
    links { 'raylib.lib', 'winmm' }
end

workspace(WorkspaceName)

    configurations {'Debug', 'Release'}
    platforms {'Win32', 'Win64'}
    defaultplatform ('Win64')

project(ProjectName).group = "Application"

    kind      ('ConsoleApp')
    language  ('C++')
    location  ('Intermediate/ProjectFiles')
    targetdir ('Binaries/%{cfg.platform}/%{cfg.buildcfg}')
    objdir    ("Intermediate/Build/%{cfg.platform}/%{cfg.buildcfg}")

    defines {'APP_NAME=%{ProjectName}'}
    defines{"PLATFORM_DESKTOP"}

    SourcePath = 'Source/' .. ProjectName
    os.mkdir (SourcePath)
    os.mkdir ('Content')
    os.mkdir ('Config')
    os.mkdir ('Source/ThirdParty/Include')
    os.mkdir ('Source/ThirdParty/Libs/Win32/DebugLib')
    os.mkdir ('Source/ThirdParty/Libs/Win32/ReleaseLib')
    os.mkdir ('Source/ThirdParty/Libs/Win64/DebugLib')
    os.mkdir ('Source/ThirdParty/Libs/Win64/ReleaseLib')

    includedirs { SourcePath }
    includedirs { 'Source/ThirdParty/Include' }

    files {'Programs/Premake5/AppIcon/*.rc'}
    files {'Config/**.*'}
    files {'Source/*.h', 'Source/*.hpp', 'Source/*.c', 'Source/*.cpp'}
    files {'%{SourcePath}/**.h', '%{SourcePath}/**.hpp', '%{SourcePath}/**.c', '%{SourcePath}/**.cpp'}

    vpaths {
        ['Config/*'] = {'Config/**.*'},
        ['Config/Resource'] = {'Programs/Premake5/AppIcon/*.rc'},
        ['Source'] = {'Source/*.h', 'Source/*.hpp', 'Source/*.c', 'Source/*.cpp'},
        ['Source/%{WorkspaceName}/*'] = {'%{SourcePath}/**.h', '%{SourcePath}/**.hpp', '%{SourcePath}/**.c', '%{SourcePath}/**.cpp'}
    }

    filter {'configurations:Debug'}
        defines { 'DEBUG_MODE' }
        defines {'CONTENT_PATH=' .. ContentPath}
        defines {'CONFIG_PATH='  .. ConfigPath}
        optimize 'Off'
        symbols  'On'
    
    filter {'configurations:Release'}
        defines { 'RELEASE_MODE' }
        defines {'CONTENT_PATH=AppData/Content/'}
        defines {'CONFIG_PATH=AppData/Config/'}
        optimize 'On'
        symbols  'Off'

        ContentFrom       = path.getabsolute("Content")
        ContentTo         = path.getabsolute("Binaries/%{cfg.platform}/%{cfg.buildcfg}/AppData/Content/")
        ConfigFilesFrom   = path.getabsolute("Config")
        ConfigFilesTo     = path.getabsolute("Binaries/%{cfg.platform}/%{cfg.buildcfg}/AppData/Config/")
        postbuildmessage "Copying content to AppData..."
        -- copy a file from the objects directory to the target directory
        postbuildcommands { "{COPYDIR} %{ContentFrom} %{ContentTo}" }
        postbuildcommands { "{COPYDIR} %{ConfigFilesFrom} %{ConfigFilesTo}" }
    
    filter {'platforms:Win32'}
        architecture ('x86')
        libdirs {'Source/ThirdParty/Libs/Win32/DebugLib'}
        libdirs {'Source/ThirdParty/Libs/Win32/ReleaseLib'}

    filter {'platforms:Win64'}
        architecture ('x86_64')
        libdirs {'Source/ThirdParty/Libs/Win64/DebugLib'}
        libdirs {'Source/ThirdParty/Libs/Win64/ReleaseLib'}

    filter {'System:Windows'}
        defines { 'PLATFORM_WINDOWS' }
        cppdialect 'C++17'
        LinkLibraries()

    filter {}

    include('ProjectSettings.lua')

    PROGRAMSPATH = path.getabsolute('Programs')

    prebuildmessage ('Start Project Update.')
    prebuildcommands { "call ../../App.bat" }

newaction {
    trigger     = "GeneratorVs2017",
    description = "Install the software",
    execute     = function ()
        Filename = "../../../App.bat";
        Content = SettingsString
        Content = Content:gsub("PROJECTNAME", WorkspaceName)
        Content = Content:gsub("VSVERSION", "vs2017")
        Content = Content:gsub("VSPATH", Vs2017Path)
        Content = Content:gsub("PROGRAMSPATH", PROGRAMSPATH)
        io.writefile(Filename, Content)
    end
}

newaction {
    trigger     = "GeneratorVs2019",
    description = "Install the software",
    execute     = function ()
        Filename = "../../../App.bat";
        Content = SettingsString
        Content = Content:gsub("PROJECTNAME", WorkspaceName)
        Content = Content:gsub("VSVERSION", "vs2019")
        Content = Content:gsub("VSPATH", Vs2019Path)
        Content = Content:gsub("PROGRAMSPATH", PROGRAMSPATH)
        io.writefile(Filename, Content)
    end
}

newaction {
    trigger     = "GeneratorVs2022",
    description = "Install the software",
    execute     = function ()
        Filename = "../../../App.bat";
        Content = SettingsString
        Content = Content:gsub("PROJECTNAME", WorkspaceName)
        Content = Content:gsub("VSVERSION", "vs2022")
        Content = Content:gsub("VSPATH", Vs2022Path)
        Content = Content:gsub("PROGRAMSPATH", PROGRAMSPATH)
        io.writefile(Filename, Content)
    end
 }

