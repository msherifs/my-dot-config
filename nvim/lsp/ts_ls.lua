return {
	cmd = { "typescript-language-server", "--stdio" },
	filetypes = {
		"javascript",
		"javascriptreact",
		"javascript.jsx",
		"typescript",
		"typescriptreact",
		"typescript.tsx",
	},
	root_dir = function(_, callback)
		local deno_dir = vim.fs.root(0, { "deno.json", "deno.jsonc" })
		local root_dir = vim.fs.root(0, { "tsconfig.json", "jsconfig.json", "package.json" })

		if root_dir and deno_dir == nil then
			callback(root_dir)
		end
	end,
}
