return {
	"github/copilot.vim",
	config = function()
		-- Set up keybindings for Copilot
		vim.g.copilot_no_tab_map = true -- Disable the default Tab mapping

		-- Accept suggestion with Ctrl+l
		vim.api.nvim_set_keymap("i", "<C-l>", 'copilot#Accept("<CR>")', {
			expr = true,
			silent = true,
			noremap = true,
		})

		-- Force show suggestion with Ctrl+s
		vim.api.nvim_set_keymap("i", "<C-s>", "copilot#Suggest()", {
			expr = true,
			silent = true,
			noremap = true,
		})
	end,
}
