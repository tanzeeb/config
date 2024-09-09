-- Pull in the wezterm API
local wezterm = require 'wezterm'

-- This will hold the configuration.
local config = wezterm.config_builder()

-- This is where you actually apply your config choices

-- For example, changing the color scheme:
function get_appearance()
  if wezterm.gui then
    return wezterm.gui.get_appearance()
  end
  return 'Dark'
end

function scheme_for_appearance(appearance)
  if appearance:find 'Dark' then
    return 'Tomorrow Night'
  else
    return 'Tomorrow'
  end
end

config.color_scheme = scheme_for_appearance(get_appearance())

config.window_decorations = "RESIZE|INTEGRATED_BUTTONS"


config.window_frame = {
  font = wezterm.font("SF Pro", { weight='Bold' }),
  font_size = 14.0, 
  active_titlebar_bg = wezterm.color.get_builtin_schemes()[config.color_scheme].selection_bg,
  inactive_titlebar_bg = wezterm.color.get_builtin_schemes()[config.color_scheme].background,
}

config.inactive_pane_hsb = {
  brightness = 0.5,
}

config.colors = {
  tab_bar = {
    active_tab = {
      bg_color = wezterm.color.get_builtin_schemes()[config.color_scheme].background,
      fg_color = wezterm.color.get_builtin_schemes()[config.color_scheme].foreground,
    },
    inactive_tab = {
      fg_color = wezterm.color.get_builtin_schemes()[config.color_scheme].selection_fg,
      bg_color = wezterm.color.get_builtin_schemes()[config.color_scheme].selection_bg,
    },
    inactive_tab_hover = {
      fg_color = wezterm.color.get_builtin_schemes()[config.color_scheme].cursor_fg,
      bg_color = wezterm.color.get_builtin_schemes()[config.color_scheme].cursor_bg,
    },
    new_tab = {
      bg_color = wezterm.color.get_builtin_schemes()[config.color_scheme].selection_bg,
      fg_color = wezterm.color.get_builtin_schemes()[config.color_scheme].selection_fg,
    },
    new_tab_hover = {
      fg_color = wezterm.color.get_builtin_schemes()[config.color_scheme].cursor_fg,
      bg_color = wezterm.color.get_builtin_schemes()[config.color_scheme].cursor_bg,
    },
  },
}

config.font = wezterm.font("SF Mono")
config.font_size = 14.0

config.keys = {
  {
    key = '\'',
    mods = 'SUPER',
    action = wezterm.action.SplitPane { direction = 'Right' },
  },
  {
    key = '"',
    mods = 'SUPER|SHIFT',
    action = wezterm.action.SplitPane { direction = 'Left' },
  },
  {
    key = ';',
    mods = 'SUPER',
    action = wezterm.action.SplitPane { direction = 'Down' },
  },
  {
    key = ':',
    mods = 'SUPER|SHIFT',
    action = wezterm.action.SplitPane { direction = 'Up' },
  },
  {
    key = 'LeftArrow',
    mods = 'SUPER',
    action = wezterm.action.ActivatePaneDirection('Left'),
  },
  {
    key = 'RightArrow',
    mods = 'SUPER',
    action = wezterm.action.ActivatePaneDirection('Right'),
  },
  {
    key = 'UpArrow',
    mods = 'SUPER',
    action = wezterm.action.ActivatePaneDirection('Up'),
  },
  {
    key = 'DownArrow',
    mods = 'SUPER',
    action = wezterm.action.ActivatePaneDirection('Down'),
  },
  {
    key = 'LeftArrow',
    mods = 'SUPER|META',
    action = wezterm.action.AdjustPaneSize({'Left', 3}),
  },
  {
    key = 'RightArrow',
    mods = 'SUPER|META',
    action = wezterm.action.AdjustPaneSize({'Right', 3}),
  },
  {
    key = 'UpArrow',
    mods = 'SUPER|META',
    action = wezterm.action.AdjustPaneSize({'Up', 3}),
  },
  {
    key = 'DownArrow',
    mods = 'SUPER|META',
    action = wezterm.action.AdjustPaneSize({'Down', 3}),
  },
  {
    key = 'w',
    mods = 'CMD',
    action = wezterm.action.CloseCurrentPane { confirm = true },
  },
  {
    key = 'k',
    mods = 'CMD',
    action = wezterm.action.ClearScrollback 'ScrollbackAndViewport',
  },
}

-- and finally, return the configuration to wezterm
return config


-- vim: tabstop=2 shiftwidth=2 expandtab
