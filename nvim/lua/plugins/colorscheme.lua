return {
	"rose-pine/neovim",
	name = "rose-pine",
	priority = 1000,
	config = function()
		require("rose-pine").setup({
			variant = "moon", -- auto, main, moon, or dawn
			dark_variant = "moon", -- main, moon, or dawn
			dim_inactive_windows = false,
			extend_background_behind_borders = true,
			styles = {
				bold = true,
				italic = true,
				transparency = true,
			},
		})
	end,

	-- optionally set the colorscheme within lazy config
	init = function()
		vim.cmd("colorscheme rose-pine")
	end,
}
