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
config.color_scheme = "AdventureTime"

config.window_decorations = "RESIZE"
config.window_close_confirmation = "NeverPrompt" -- 'AlwaysPrompt'
config.use_dead_keys = false

config.font_size = 14.0

-- config.font = wezterm.font "Noto Color Emoji"
-- config.font = wezterm.font("Fira Code")
-- config.font = wezterm.font("JetBrains Mono")
config.font = wezterm.font("Rec Mono Linear")

-- and finally, return the configuration to wezterm
return config
