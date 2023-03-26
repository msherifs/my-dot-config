local status, harpoon = pcall(require, "harpoon")
if not status then
	return
end

local mark = require("harpoon.mark") 
local ui = require("harpoon.ui")

local keymap = vim.keymap

keymap.set("n", "<leader>a", mark.add_file)
keymap.set("n", "<leader>he", ui.toggle_quick_menu)
