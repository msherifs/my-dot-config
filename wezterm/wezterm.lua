-- Pull in the wezterm API
local wezterm = require("wezterm")

-- This will hold the configuration.
local config = wezterm.config_builder()

-- This is where you actually apply your config choices
config.initial_rows = 30
config.initial_cols = 120

-- For example, changing the color scheme:
config.color_scheme = "Tokyo Night Storm (Gogh)"
config.window_background_opacity = 1

config.font = wezterm.font({
	family = "Maple Mono NF",
	harfbuzz_features = { "ss01", "ss03", "zero" },
})

-- config.font = wezterm.font({
-- 	family = "JetBrainsMono Nerd Font",
-- 	harfbuzz_features = { "ss02" },
-- })

config.font_size = 12
config.line_height = 1.4

-- and finally, return the configuration to wezterm
return config
