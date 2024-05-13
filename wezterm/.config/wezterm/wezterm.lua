-- Pull in the wezterm API
local wezterm = require("wezterm")

-- This table will hold the configuration.
local config = {}

-- In newer versions of wezterm, use the config_builder which will
-- help provide clearer error messages
if wezterm.config_builder then
  config = wezterm.config_builder()
end

-- This is where you actually apply your config choices

-- For example, changing the color scheme:
-- config.color_scheme = "AdventureTime"
config.color_scheme = "Tokyo Night Moon"
-- config.color_scheme = "Tokyo Night Day"

config.window_decorations = "RESIZE"
config.window_close_confirmation = "NeverPrompt" -- 'AlwaysPrompt'
config.use_dead_keys = false

config.keys = {
  -- Turn off the default CMD-m Hide action, allowing CMD-m to
  -- be potentially recognized and handled by the tab
  {
    key = "m",
    mods = "CMD",
    action = wezterm.action.DisableDefaultAssignment,
  },
}

-- config.font = wezterm.font("Noto Color Emoji")
-- config.font = wezterm.font("Fira Code")
-- config.font = wezterm.font("JetBrains Mono")
config.font = wezterm.font("Fantasque Sans Mono")
-- config.font = wezterm.font("Rec Mono Linear")
-- config.font = wezterm.font("Source Code Pro")
-- config.font = wezterm.font("Hack")
-- config.font = wezterm.font("0xProto Nerd Font")

config.font_size = 14.0

if config.font.font[1].family == "Fantasque Sans Mono" then
  config.font_size = 16.0
end

config.use_fancy_tab_bar = false
config.tab_bar_at_bottom = false
config.hide_tab_bar_if_only_one_tab = true
config.adjust_window_size_when_changing_font_size = false

config.window_padding = {
  left = 2,
  right = 0,
  top = 2,
  bottom = 0,
}

-- config.colors = {
--   tab_bar = {
--     active_tab = {
--       bg_color = "white",
--       fg_color = "blue",
--       intensity = "Bold",
--       italic = false,
--     },
--   },
--
-- }

-- FOR DEBUG
-- You can find log files in $XDG_RUNTIME_DIR/wezterm on unix systems, or $HOME/.local/share/wezterm on macOS and Windows systems.
-- wezterm.log_info(config)

-- and finally, return the configuration to wezterm
return config
