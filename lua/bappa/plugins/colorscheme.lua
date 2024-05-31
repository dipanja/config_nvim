return {
	"folke/tokyonight.nvim",
	lazy = false,
	priority = 1000,
	opts = {},
	config = function()
		require("tokyonight").setup({
			style = "night",
			transparent = true, -- set transparent background
			styles = {
				sidebars = "transparent", -- set transparent sidebars
				floats = "transparent",
			},
		})
		vim.cmd("colorscheme tokyonight")
	end,
}
