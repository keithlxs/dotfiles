local wezterm = require 'wezterm'
local act = wezterm.action
local config = {}
local gpus = wezterm.gui.enumerate_gpus()

if wezterm.config_builder then
  config = wezterm.config_builder()
end

wezterm.on('update-right-status', function(window, pane)
  window:set_right_status(window:active_workspace())
end)

-- set color & font options
config.color_scheme = 'Kibble'
config.font_dirs = {'fonts'}
config.font =   wezterm.font ('SauceCodePro Nerd Font SemiBold')
config.colors =
{
  background = '#101010',
}
config.font_size = 10

-- Setting for dedicated nVidia GPU
config.front_end = 'WebGpu'
config.webgpu_preferred_adapter = gpus[1]
config.webgpu_power_preference = 'HighPerformance'

-- set window size & cursor
config.initial_cols = 170
config.initial_rows = 60
config.default_cursor_style = 'SteadyUnderline'
config.force_reverse_video_cursor = true

-- some QOL for the window
config.window_decorations = "RESIZE"
config.window_close_confirmation = "NeverPrompt"
config.hide_tab_bar_if_only_one_tab = true
config.use_fancy_tab_bar = false
config.window_padding =
{
  left = '0',
  right = '0',
  top = '0',
  bottom = '0',
}

-- custom keymaps for opening, switching, and listing sessions/workspaces
config.keys =
{
  {
    key = 'm',
    mods = 'ALT',
    action = act.SwitchToWorkspace
  },
  {
    key = 'n',
    mods = 'ALT',
    action = act.SwitchWorkspaceRelative(1)
  },
  {
    key = 'p',
    mods = 'ALT',
    action = act.SwitchWorkspaceRelative(-1)
  }
}
return config
