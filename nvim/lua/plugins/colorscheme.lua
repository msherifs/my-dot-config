return {
	"EdenEast/nightfox.nvim",
	name = "nightfox",
	lazy = false,
	priority = 1000,
	config = function(_, opts)
		vim.cmd("colorscheme dayfox")
	end,
}
