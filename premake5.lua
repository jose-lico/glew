project "glew"
	kind "StaticLib"
	language "C"
	configmap 
	{
		["ReleaseWithInfo"] = "Release"
		["ReleaseNoImGui"] = "Release"
	}

	targetdir ("%{wks.location}/bin/" .. outputDir .. "/%{prj.name}")
	objdir ("%{wks.location}/bin-int/" .. outputDir .. "/%{prj.name}")

	files
	{
		"include/GL/glew.h",
		"src/glew.c"
	}

	includedirs
	{
		"include"
	}

	filter "system:linux"
		systemversion "latest"

	filter "system:windows"
		staticruntime "On"
		systemversion "latest"
		defines
		{
			"GLEW_STATIC",
			"_CRT_SECURE_NO_WARNINGS"
		}

	filter "configurations:Debug"
		runtime "Debug"
		symbols "On"

	filter "configurations:Release"
		runtime "Release"
		optimize "On"
