return {
	"webhooked/kanso.nvim",
	lazy = false,
	priority = 1000,
	config = function()
		require("kanso").setup({
			theme = "zen",
		})
	end,

	-- optionally set the colorscheme within lazy config
	init = function()
		vim.cmd("colorscheme kanso")
	end,
}
