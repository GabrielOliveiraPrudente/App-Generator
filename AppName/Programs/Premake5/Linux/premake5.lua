os.chdir('../../../')
WorkspaceName = path.getbasename(os.getcwd())
ProjectName   = WorkspaceName
ContentPath   = path.getabsolute('Content')  .. '/'
ConfigPath    = path.getabsolute('Config')   .. '/'

-- Add Custon Link Path
function LinkLibraries()
    --includedirs { 'Source/ThirdParty/Libs/Include/MyLibInclude' }
    --links { 'lib.a' }
end

workspace(WorkspaceName)

    configurations {'Debug', 'Release'}
    platforms {'x32', 'x64'}
    defaultplatform ('x64')

project(ProjectName).group = "Application"

    kind      ('ConsoleApp')
    language  ('C++')
    location  ('Intermediate/ProjectFiles')
    targetdir ('Binaries/%{cfg.platform}/%{cfg.buildcfg}')
    objdir    ("Intermediate/Build/%{cfg.platform}/%{cfg.buildcfg}")

    defines {'APP_NAME=%{ProjectName}'}

    SourcePath = 'Source/' .. ProjectName
    os.mkdir (SourcePath)
    os.mkdir ('Content')
    os.mkdir ('Config')
    os.mkdir ('Source/ThirdParty/Include')
    os.mkdir ('Source/ThirdParty/Libs/Linux32/DebugLib')
    os.mkdir ('Source/ThirdParty/Libs/Linux32/ReleaseLib')
    os.mkdir ('Source/ThirdParty/Libs/Linux64/DebugLib')
    os.mkdir ('Source/ThirdParty/Libs/Linux64/ReleaseLib')

    includedirs { SourcePath }
    includedirs { 'Source/ThirdParty/Include' }

    files {'Config/**.*'}
    files {'Source/*.h', 'Source/*.hpp', 'Source/*.c', 'Source/*.cpp'}
    files {'%{SourcePath}/**.h', '%{SourcePath}/**.hpp', '%{SourcePath}/**.c', '%{SourcePath}/**.cpp'}

    vpaths {
        ['Config/*'] = {'Config/**.*'},
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
        ConfigFrom   = path.getabsolute("Config")
        AppData           = path.getabsolute("Binaries/%{cfg.platform}/%{cfg.buildcfg}/AppData/")
        postbuildmessage "Copying content to AppData..."
        -- copy a file from the objects directory to the target directory
        postbuildcommands { "{MKDIR} %{AppData}" }
        postbuildcommands { "{COPYDIR} %{ContentFrom} %{AppData}" }
        postbuildcommands { "{COPYDIR} %{ConfigFrom} %{AppData}" }
    
    filter {'platforms:x32'}
        architecture ('x86')
        libdirs {'Source/ThirdParty/Libs/Linux32/DebugLib'}
        libdirs {'Source/ThirdParty/Libs/Linux32/ReleaseLib'}

    filter {'platforms:x64'}
        architecture ('x86_64')
        libdirs {'Source/ThirdParty/Libs/Linux64/DebugLib'}
        libdirs {'Source/ThirdParty/Libs/Linux64/ReleaseLib'}

    filter {'System:Linux'}
        defines { 'PLATFORM_LINUX' }
        cppdialect 'gnu++17'
        LinkLibraries()

    filter {}

    include('ProjectSettings.lua')

    PROGRAMSPATH = path.getabsolute('Programs')

    prebuildmessage ('Start Project Update.')
    prebuildcommands { "../../App.sh" }

newaction {
    trigger     = "GeneratorGMake2",
    description = "Install the software",
    execute     = function ()
        Filename = "../../../App.sh";
        Content = SettingsString
        io.writefile(Filename, Content)
    end
}



