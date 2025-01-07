return {
	"folke/tokyonight.nvim",
	lazy = false,
	priority = 1000,
	opts = {},
	config = function(_, _opts)
		vim.cmd("colorscheme tokyonight-night")
	end,
}
