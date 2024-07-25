return {
  'stevearc/oil.nvim',
  opts = {},
  dependencies = { "nvim-tree/nvim-web-devicons" }, -- Optional
  config = function()
    require("oil").setup({
      default_file_explorer = true,
      float = {
        padding = 10,
        border = "rounded"
      }
    })

    vim.keymap.set("n", "-", "<CMD>Oil --float<CR>", { desc = "Open parent directory" })
  end 
}
