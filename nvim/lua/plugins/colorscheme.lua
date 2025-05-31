return {
	"catppuccin/nvim",
	name = "catppuccin",
	priority = 1000,
	config = function()
		require("catppuccin").setup({
			flavor = "frappe",
		})
	end,

	-- optionally set the colorscheme within lazy config
	init = function()
		vim.cmd("colorscheme catppuccin-frappe")
	end,
}
