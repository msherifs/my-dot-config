return {
	"catppuccin/nvim",
	name = "catppuccin",
	priority = 1000,
	config = function(_, _opts)
		vim.cmd("colorscheme catppuccin-frappe")
	end,
}
