-- Pull in the wezterm API
local wezterm = require("wezterm")
-- Using the plugin loader for Smart splits plugin(similar to vim-tmux-navigator)
local smart_splits = wezterm.plugin.require("https://github.com/mrjones2014/smart-splits.nvim")
local tabline = wezterm.plugin.require("https://github.com/michaelbrusegard/tabline.wez")

-- This will hold the configuration.
local config = wezterm.config_builder()

-- config.term = "xterm-256color"
config.term = "wezterm"

config.max_fps = 165

config.window_decorations = "INTEGRATED_BUTTONS|RESIZE"
config.integrated_title_button_style = "Gnome"
config.use_fancy_tab_bar = false
config.hide_tab_bar_if_only_one_tab = true

config.window_padding = { left = 5, right = 0, top = 5, bottom = 0 }
config.front_end = "WebGpu"
config.webgpu_power_preference = "HighPerformance"
-- config.enable_wayland = true
config.enable_wayland = false

config.window_background_opacity = 0.85
config.text_background_opacity = 1
-- config.text_background_opacity = 0.3

-- config.default_cursor_style = "BlinkingBlock"
config.default_cursor_style = "BlinkingBar"
config.cursor_blink_rate = 540
config.cursor_blink_ease_in = "Linear"
config.cursor_blink_ease_out = "Linear"

config.colors = {
	background = "#09090d",

	-- cursor_bg = "#ee006c", -- HotPink background
	cursor_bg = "#a277ff", -- HotPink background
	-- cursor_fg = "#ffffff", -- white foreground (white text)
}

-- config.font = wezterm.font("0xProto", { weight = "Light" })
-- config.font = wezterm.font("Hasklug Nerd Font")
config.font_size = 11
config.font = wezterm.font("MartianMono Nerd Font Mono")
config.use_resize_increments = true
config.line_height = 1.42
-- config.line_height = 1.25
config.freetype_load_flags = "NO_HINTING"

-- Leader for Wezterm Multiplexing: ctrl a
config.leader = { key = "a", mods = "CTRL", timeout_milliseconds = 1000 }
config.keys = {
	-- Windows Splitting (multiplexing)
	{
		mods = "LEADER",
		key = "h",
		action = wezterm.action.SplitVertical({ domain = "CurrentPaneDomain" }),
	},
	{
		mods = "LEADER",
		key = "v",
		action = wezterm.action.SplitHorizontal({ domain = "CurrentPaneDomain" }),
	},

	-- Switches to tab left and right
	{ key = "h", mods = "ALT|SHIFT", action = wezterm.action.ActivateTabRelative(-1) },
	{ key = "l", mods = "ALT|SHIFT", action = wezterm.action.ActivateTabRelative(1) },
}

smart_splits.apply_to_config(config, {
	-- directional keys to use in order of: left, down, up, right
	-- direction_keys = { "h", "j", "k", "l" },
	direction_keys = { "h", "j", "k", "l" },
	-- modifier keys to combine with direction_keys
	modifiers = {
		move = "ALT", -- can also be OPT or META-- modifier to use for pane movement, e.g. CTRL+h to move left
		resize = "CTRL", -- modifier to use for pane resize, e.g. META+h to resize to the left
	},
	-- to use separate direction keys for move vs. resize:
	-- direction_keys = {
	--   move = { 'h', 'j', 'k', 'l' },
	--   resize = { 'LeftArrow', 'DownArrow', 'UpArrow', 'RightArrow' },
	-- },
})

-- tabline.setup({
-- 	options = {
-- 		icons_enabled = true,
-- 		theme = "Catppuccin Mocha",
-- 		section_separators = {
-- 			left = wezterm.nerdfonts.ple_right_half_circle_thick,
-- 			right = wezterm.nerdfonts.ple_left_half_circle_thick,
-- 		},
-- 		component_separators = {
-- 			left = wezterm.nerdfonts.ple_right_half_circle_thin,
-- 			right = wezterm.nerdfonts.ple_left_half_circle_thin,
-- 		},
-- 		tab_separators = {
-- 			left = wezterm.nerdfonts.ple_right_half_circle_thick,
-- 			right = wezterm.nerdfonts.ple_left_half_circle_thick,
-- 		},
-- 	},
-- 	sections = {
-- 		tabline_a = { "mode" },
-- 		tabline_b = { "workspace" },
-- 		tabline_c = { " " },
-- 		tab_active = {
-- 			"index",
-- 			{ "parent", padding = 0 },
-- 			"/",
-- 			{ "cwd", padding = { left = 0, right = 1 } },
-- 			{ "zoomed", padding = 0 },
-- 		},
-- 		tab_inactive = { "index", { "process", padding = { left = 0, right = 1 } } },
-- 		tabline_x = {},
-- 		tabline_y = {},
-- 		-- tabline_y = { "datetime", "battery" },
-- 		tabline_z = { "domain" },
-- 	},
-- 	extensions = {},
-- })

return config
