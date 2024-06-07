require("bappa.core.options")
require("bappa.core.keymaps")
_G.toggle_highlight = function()
	if vim.o.hlsearch then
		vim.o.hlsearch = false
		print("Highlight search turned off")
	else
		vim.o.hlsearch = true
		print("Highlight search turned on")
	end
end
