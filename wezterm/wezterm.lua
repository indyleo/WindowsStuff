-- Pull in the wezterm API
local wezterm = require("wezterm")
local mux = wezterm.mux

-- This will hold the configuration.
local config = wezterm.config_builder()

-- This is where you actually apply your config choices
config.color_scheme = "Dark+"

config.font = wezterm.font("CaskaydiaCove NF")
config.font_size = 12
config.default_prog = { "pwsh.exe" }

config.window_decorations = "RESIZE"

config.enable_tab_bar = false

wezterm.on('gui-startup', function(cmd)
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
