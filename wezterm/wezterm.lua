-- Pull in the wezterm API
local wezterm = require("wezterm")

-- This will hold the configuration.
local config = wezterm.config_builder()

-- This is where you actually apply your config choices
config.initial_rows = 30
config.initial_cols = 120

-- For example, changing the color scheme:
config.color_scheme = "Catppuccin Mocha"
config.window_background_opacity = 0.97

config.font = wezterm.font("SpaceMono Nerd Font")
config.font_size = 13
config.line_height = 1.35

-- and finally, return the configuration to wezterm
return config
