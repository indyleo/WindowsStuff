-- Pull in the wezterm API
local wezterm = require("wezterm")
local mux = wezterm.mux

-- This will hold the configuration.
local config = wezterm.config_builder()

-- This is where you actually apply your config choices
config.color_scheme = "Dark+"

-- Font
config.font = wezterm.font("CaskaydiaCove NF")
config.font_size = 12

-- Shell
config.default_prog = { "pwsh.exe" }
config.default_cwd = wezterm.home_dir

-- Window Stuff
config.window_decorations = "INTEGRATED_BUTTONS | RESIZE"
-- config.window_decorations = "NONE"
config.use_fancy_tab_bar = true
config.enable_tab_bar = true

-- Blur
config.window_background_opacity = 0.85
config.win32_system_backdrop = "Acrylic"

-- Set Window To Fullscreen
wezterm.on("gui-startup", function(cmd)
  local tab, pane, window = mux.spawn_window(cmd or {})
  window:gui_window():maximize()
end)

config.window_padding = {
  left = "15",
  right = "15",
  top = "15",
  bottom = "15",
}

-- and finally, return the configuration to wezterm
return config
