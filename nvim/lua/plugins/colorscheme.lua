return {
	"EdenEast/nightfox.nvim",
	lazy = false,
	priority = 1000,
	opts = {
		options = {
			transparent = true, -- enable transparent background
		},
	},

	-- optionally set the colorscheme within lazy config
	init = function()
		vim.cmd("colorscheme nordfox")
	end,
}
