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

config.font_size = 14.0

-- config.font = wezterm.font "Noto Color Emoji"
-- config.font = wezterm.font("Fira Code")
-- config.font = wezterm.font("JetBrains Mono")
config.font = wezterm.font("Rec Mono Linear")
-- config.font = wezterm.font("Source Code Pro")

config.use_fancy_tab_bar = false

config.window_padding = {
  left = 2,
  right = 2,
  top = 2,
  bottom = 0,
}

-- and finally, return the configuration to wezterm
return config
