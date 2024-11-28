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

-- Keybinds
config.leader = { key = "Space", mods = "CTRL", timeout_milliseconds = 10000 }
config.keys = {
  -- Tabs
  { -- Making Tabs
    key = "t",
    mods = "LEADER",
    action = wezterm.action{SpawnTab="CurrentPaneDomain"}
  },
  { -- Navagating Tabs
    key = "n",
    mods = "LEADER",
    action = wezterm.action{ActivateTabRelative=1}
  },
  {
    key = "p",
    mods = "LEADER",
    action = wezterm.action{ActivateTabRelative=-1}
  },
  { -- Kill Tabs
    key = "x",
    mods = "LEADER",
    action = wezterm.action{CloseCurrentTab={confirm=false}}
  },
  -- Panes
  { -- Making Panes
    key = "o",
    mods = "LEADER|SHIFT",
    action = wezterm.action{SplitHorizontal={domain="CurrentPaneDomain"}}
  },
  {
    key = "i",
    mods = "LEADER|SHIFT",
    action = wezterm.action{SplitVertical={domain="CurrentPaneDomain"}}
  },
  { -- Navagating Panes 
    key = "h",
    mods = "LEADER|SHIFT",
    action = wezterm.action{ActivatePaneDirection="Left"}
  },
  {
    key = "l",
    mods = "LEADER|SHIFT",
    action = wezterm.action{ActivatePaneDirection="Right"}
  },
  {
    key = "k",
    mods = "LEADER|SHIFT",
    action = wezterm.action{ActivatePaneDirection="Up"}
  },
  {
    key = "j",
    mods = "LEADER|SHIFT",
    action = wezterm.action{ActivatePaneDirection="Down"}
  },
  { -- Cycle through Pane 
    key = "n",
    mods = "LEADER|ALT",
    action = wezterm.action{ActivatePaneDirection="Next"}
  },
  {
    key = "p",
    mods = "LEADER|ALT",
    action = wezterm.action{ActivatePaneDirection="Prev"}
  },
  { -- Size the Pane
    key = "h",
    mods = "LEADER|ALT",
    action = wezterm.action{AdjustPaneSize={"Left", 1}}
  },
  {
    key = "l",
    mods = "LEADER|ALT",
    action = wezterm.action{AdjustPaneSize={"Right", 1}}
  },
  {
    key = "k",
    mods = "LEADER|ALT",
    action = wezterm.action{AdjustPaneSize={"Up", 1}}
  },
  {
    key = "j",
    mods = "LEADER|ALT",
    action = wezterm.action{AdjustPaneSize={"Down", 1}}
  },
  { -- Kill Panes
    key = "x",
    mods = "LEADER|SHIFT",
    action = wezterm.action{CloseCurrentPane={confirm=false}}
  },
}

-- and finally, return the configuration to wezterm
return config
