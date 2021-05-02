workspace "glew"
	architecture "x64"
	outputDir = "%{cfg.buildcfg}-%{cfg.system}-%{cfg.architecture}"

	configurations
	{
		"Debug",
		"Release"
	}

project "glew"
	kind "StaticLib"
	language "C"

	targetdir ("bin/" .. outputDir .. "/%{prj.name}")
	objdir ("bin-int/" .. outputDir .. "/%{prj.name}")

	files
	{
		"include/GL/glew.h",
		"src/glew.c"
	}

	includedirs
	{
		"include"
	}

	defines
	{
		"GLEW_STATIC",
		"_CRT_SECURE_NO_WARNINGS"
	}

	filter "system:linux"
		pic "On"
		systemversion "latest"

	filter "system:windows"
		staticruntime "off"
		systemversion "latest"

	filter "configurations:Debug"
		runtime "Debug"
		symbols "On"

	filter "configurations:Release"
		runtime "Release"
		optimize "On"