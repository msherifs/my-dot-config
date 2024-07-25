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

return {
	"catppuccin/nvim",
	name = "catppuccin",
	priority = 1000,
	config = function()
		require("catppuccin").setup({
			flavor = "mocha",
			transparent_background = true,
		})

		vim.cmd("colorscheme catppuccin")
	end,
}
