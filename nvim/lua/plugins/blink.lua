return {
	"saghen/blink.cmp",
	dependencies = "rafamadriz/friendly-snippets",
	version = "v0.*",
	opts = {
		keymap = {
			-- preset = "default",
			["<Tab>"] = { "select_and_accept" },
			["<C-j>"] = { "select_next" },
			["<C-k>"] = { "select_prev" },
		},
		appearance = {
			use_nvim_cmp_as_default = false,
			nerd_font_variant = "mono",
		},

		signature = { enabled = true },
	},
}
