return {
	"iamcco/markdown-preview.nvim",
	event = "VeryLazy",
	cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
	ft = { "markdown" },
	build = function()
		vim.fn["mkdp#util#install"]()
	end,
	config = function()
		vim.keymap.set(
			"n",
			"<leader>mm",
			"<cmd>MarkdownPreviewToggle<CR>",
			{ desc = "Preview markdown files in browser" }
		)
	end,
}
