return {
	"stevearc/conform.nvim",
	event = { "BufReadPre", "BufNewFile" },
	config = function()
		local conform = require("conform")

		local function detect_formatter()
			-- Check for deno configuration files
			if
				vim.fn.filereadable(vim.fn.getcwd() .. "/deno.json") == 1
				or vim.fn.filereadable(vim.fn.getcwd() .. "/deno.jsonc") == 1
			then
				return { "deno_fmt" }
			end

			-- Check for biome configuration
			if vim.fn.filereadable(vim.fn.getcwd() .. "/biome.json") == 1 then
				return { "biome", "biome-check", "biome-organize-imports" }
			end

			-- Fallback to prettier
			return { "prettier" }
		end

		js_ts_formatters = detect_formatter()

		conform.setup({
			formatters_by_ft = {
				javascript = js_ts_formatters,
				typescript = js_ts_formatters,
				lua = { "stylua" },
				go = { "goimports", "golines", "gofmt" },
				elixir = { "mix" },
			},
			format_on_save = {
				lsp_fallback = true,
				async = false,
				timeout_ms = 1000,
			},
		})

		vim.keymap.set({ "n", "v" }, "<leader>mp", function()
			conform.format({
				lsp_fallback = true,
				async = false,
				timeout_ms = 1000,
			})
		end, { desc = "Format file or range (in visual mode)" })
	end,
}
