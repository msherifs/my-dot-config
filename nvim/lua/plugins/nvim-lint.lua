return {
	"mfussenegger/nvim-lint",
	event = { "BufReadPre", "BufNewFile" },
	config = function()
		local lint = require("lint")

		local function detect_linter()
		  if vim.fn.filereadable(vim.fn.getcwd() .. "/eslint.json") == 1 then
		    return { "eslint" }
		  end
		
		  return { }
		end
		
		lint.linters_by_ft = {
		  javascript = detect_linter(),
		  typescript = detect_linter(),
		}

		local lint_augroup = vim.api.nvim_create_augroup("lint", { clear = true })

		vim.api.nvim_create_autocmd({ "BufEnter", "BufWritePost", "InsertLeave" }, {
			group = lint_augroup,
			callback = function()
				lint.try_lint()
			end,
		})

		vim.keymap.set("n", "<leader>l", function()
			lint.try_lint()
		end, { desc = "Trigger linting for current file" })
	end,
}
