return {
	"nvim-telescope/telescope.nvim",
	tag = "0.1.8",
	dependencies = { "nvim-lua/plenary.nvim" },
	opts = {
		defaults = {
			layout_strategy = "vertical",
			layout_config = {
				vertical = {
					prompt_position = "top",
					mirror = true,
					preview_height = 0, -- Set preview height to 0 to remove it
				},
			},
			sorting_strategy = "ascending",
			mappings = {
				i = {
					["<esc>"] = require("telescope.actions").close,
					["<C-j>"] = require("telescope.actions").move_selection_next,
					["<C-k>"] = require("telescope.actions").move_selection_previous,
				},
			},
		},
		pickers = {
			find_files = {
				theme = "dropdown",
				previewer = false, -- Disable previewer for find_files
			},
			-- Disable previewer for other pickers as well
			buffers = {
				previewer = false,
			},
			grep_string = {
				previewer = false,
			},
			live_grep = {
				previewer = false,
			},
		},
	},
	config = function(_, opts)
		require("telescope").setup(opts)
		local builtin = require("telescope.builtin")
		vim.keymap.set("n", "<leader>ff", builtin.find_files, {})
		vim.keymap.set("n", "<leader>fs", builtin.live_grep, {})
	end,
}
