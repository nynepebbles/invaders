-- set_toolchains("clang")
-- set_toolset("cxx", "clang++") -- breaks on Nix without this line

set_languages "c++20"
set_defaultmode "debug"
set_policy("build.warning", true)
add_rules("mode.release", "mode.debug")

add_requires("ncurses" --[[, {system = false}]])

if is_mode "debug" then
  local sanitize = { "-fsanitize=undefined", "-fsanitize=leak" }
  local warnings = { "-Wall", "-Wextra", "-Weffc++", "-Wshadow" }
  -- "-Wfatal-errors"
  add_cxxflags(warnings, sanitize, "-pedantic-errors")
  add_ldflags(sanitize, "-lubsan")
end

rule("ncurses")
  on_load(function()
      print("Hook is running!")
      os.exec("echo 'Testing from xmake hook'")
      os.exec("exit")
  end)

target "program"
  set_default(true)
  set_kind "binary"
  add_packages "ncurses"
  add_files "src/**.cpp"
  add_includedirs "inc"
