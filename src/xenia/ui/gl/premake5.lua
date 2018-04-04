project_root = "../../../.."
include(project_root.."/tools/build")

group("src")
project("xenia-ui-gl")
  uuid("623300e3-0085-4ccc-af46-d60e88cb43aa")
  kind("StaticLib")
  language("C++")
  links({
    "glew",
    "xenia-base",
    "xenia-ui",
  })
  defines({
    "GLEW_STATIC=1",
    "GLEW_MX=1",
  })
  includedirs({
    project_root.."/third_party/gflags/src",
  })
  local_platform_files()
  removefiles({"*_demo.cc"})

group("demos")
project("xenia-ui-window-gl-demo")
  uuid("e0a687e5-d1f4-4c18-b2f7-012c53ec1ee4")
  kind("WindowedApp")
  language("C++")
  links({
    "gflags",
    "glew",
    "imgui",
    "xenia-base",
    "xenia-ui",
    "xenia-ui-gl",
  })
  filter("platforms:Linux")
    links({
      "X11",
      "xcb",
      "X11-xcb",
      "GL",
      "vulkan",
    })
  filter()
  flags({
    "WinMain",  -- Use WinMain instead of main.
  })
  defines({
    "GLEW_STATIC=1",
    "GLEW_MX=1",
  })
  includedirs({
    project_root.."/third_party/gflags/src",
  })
  files({
    "../window_demo.cc",
    "gl_window_demo.cc",
    project_root.."/src/xenia/base/main_"..platform_suffix..".cc",
  })
  files({
  })
  resincludedirs({
    project_root,
  })
