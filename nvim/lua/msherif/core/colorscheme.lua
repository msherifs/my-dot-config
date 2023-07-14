-- vim.g["gruvbox_material_background"] = "hard"
-- vim.g["gruvbox_material_better_performance"] = 1
require("rose-pine").setup({
  variant = 'dawn'
})

local status, _ = pcall(vim.cmd, "colorscheme rose-pine-dawn")

