return {
	"folke/tokyonight.nvim",
	lazy = false,
	priority = 1000,
	opts = {},

	-- optionally set the colorscheme within lazy config
	init = function()
		vim.cmd("colorscheme tokyonight-storm")
	end,
}
