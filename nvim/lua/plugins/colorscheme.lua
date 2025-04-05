return {
	"folke/tokyonight.nvim",
	lazy = false,
	priority = 1000,
	opts = {
		style = "night",
		transparent = true,
		terminal_colors = true,
		styles = {
			comments = { italic = true },
			keywords = { italic = true },
			sidebars = "transparent", -- Make sidebars like NvimTree transparent
			floats = "transparent", -- Make floating windows like LSP hints transparent
		},
	},
	config = function(_, opts)
		require("tokyonight").setup(opts)

		vim.cmd.colorscheme("tokyonight")
	end,
}
