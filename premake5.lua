project "imgui"
    kind "StaticLib"
    language "C++"
    staticruntime "On"  -- Ensures that the static runtime is used

    targetdir ("bin/" .. outputdir .. "/%{prj.name}")
    objdir ("bin-int/" .. outputdir .. "/%{prj.name}")

    files 
    {
        "imconfig.h",
        "imgui.cpp",
        "imgui.h",
        "imgui_draw.cpp",
        "imgui_internal.h",
        "imgui_tables.cpp",
        "imgui_widgets.cpp",
        "imstb_rectpack.h",
        "imstb_textedit.h",
        "imstb_truetype.h",
        "imgui_demo.cpp"
    }

    filter "system:windows"
        systemversion "latest"
        cppdialect "C++20"

    filter "system:linux"
        pic "On"
        systemversion "latest"
        cppdialect "C++20"

    filter "configurations:Debug"
        symbols "On"  -- Ensure debug symbols are included
        runtime "Debug"  -- Use /MTd for Debug configuration (if not overridden globally)

    filter "configurations:Release"
        optimize "On"  -- Optimize for release
        runtime "Release"  -- Use /MT for Release configuration (if not overridden globally)

    filter "configurations:Dist"
        optimize "On"
        runtime "Release"  -- Use /MT for Distribution configuration