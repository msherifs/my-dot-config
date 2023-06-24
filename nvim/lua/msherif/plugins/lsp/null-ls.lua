local null_ls = require("null-ls")

null_ls.setup({
    sources = {
        null_ls.builtins.formatting.stylua,
        null_ls.builtins.diagnostics.eslint.with({
          condition = function (utils)
            return utils.root_has_file(".eslintrc")
          end
        }),
        null_ls.builtins.formatting.prismaFmt,
        null_ls.builtins.formatting.gofmt,
        null_ls.builtins.formatting.goimports,
        null_ls.builtins.formatting.rome.with({
          condition = function (utils)
            return utils.root_has_file("rome.json")
          end
        }),
        null_ls.builtins.formatting.prettier.with({
          condition = function (utils)
            return utils.root_has_file(".prettierrc")
          end
        }),
        null_ls.builtins.completion.spell,
    },
  -- configure format on save
  on_attach = function(current_client, bufnr)
    if current_client.supports_method("textDocument/formatting") then
      vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
      vim.api.nvim_create_autocmd("BufWritePre", {
        group = augroup,
        buffer = bufnr,
        callback = function()
          vim.lsp.buf.format({
            filter = function(client)
              --  only use null-ls for formatting instead of lsp server
              return client.name == "null-ls"
            end,
            bufnr = bufnr,
          })
        end,
      })
    end
  end,
})
