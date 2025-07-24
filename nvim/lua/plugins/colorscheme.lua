return {
	"folke/tokyonight.nvim",
	lazy = false,
	priority = 1000,
	opts = {
		transparent = true, -- enable transparent background
	},

	-- optionally set the colorscheme within lazy config
	init = function()
		vim.cmd("colorscheme tokyonight-storm")
	end,
}
