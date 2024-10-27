return {
	"EdenEast/nightfox.nvim",
	lazy = false,
	priority = 1000,
	opts = {
		transparent = true,
	},
	config = function(_, opts)
		require("nightfox").setup({ options = opts })
		vim.cmd("colorscheme nordfox")
	end,
}
