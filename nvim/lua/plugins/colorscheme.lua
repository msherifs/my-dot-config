--[[return {
    {
        "rebelot/kanagawa.nvim",
        lazy = false,
        priority = 1000,
        config = function () 
            require("kanagawa").setup({
                transparent = true,
                background = {
                    dark = "dragon"
                }
            })

            vim.cmd("colorscheme kanagawa")
        end
    }
}]]
--
-- return {
-- 	"catppuccin/nvim",
-- 	name = "catppuccin",
-- 	priority = 1000,
-- 	config = function()
-- 		require("catppuccin").setup({
-- 			flavor = "mocha",
-- 			transparent_background = true,
-- 		})
--
-- 		vim.cmd("colorscheme catppuccin")
-- 	end,
-- }
--
-- return {
-- 	"folke/tokyonight.nvim",
-- 	lazy = false,
-- 	priority = 1000,
-- 	opts = {},
-- 	config = function()
-- 		vim.cmd("colorscheme tokyonight-storm")
-- 	end,
-- }

return {
	"maxmx03/solarized.nvim",
	lazy = false,
	priority = 1000,
	opts = {},
	config = function(_, opts)
		vim.o.termguicolors = true
		vim.o.background = "dark"
		require("solarized").setup(opts)
		vim.cmd.colorscheme("solarized")
	end,
}
