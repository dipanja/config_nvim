
-- define common options
local opts = {
    noremap = true,      -- non-recursive
    silent = true,       -- do not show message
}

local term_opts = { silent =
    false
}

local keymap = vim.api.nvim_set_keymap
------------------------------
-- Remap space as leader key
------------------------------
keymap("", "<Space>", "<Nop>", opts)
vim.g.mapleader = " "
vim.g.maplocalleader = " "


-----------------
-- Normal mode --
-----------------

-- Hint: see `:h vim.map.set()`
-- Better window navigation
keymap('n', '<C-h>', '<C-w>h', opts)
keymap('n', '<C-j>', '<C-w>j', opts)
keymap('n', '<C-k>', '<C-w>k', opts)
keymap('n', '<C-l>', '<C-w>l', opts)


-- toggle last search
keymap('n', '<leader>v', ':set hlsearch!<CR>', opts)


-- Spliting window
keymap('n', '<leader>vs', ':vsplit<CR>', opts)
keymap('n', '<leader>-', ':split<CR>', opts)


-- nvim-tree
keymap("n", "<leader>e", ":NvimTreeToggle<CR>", opts)

-- Save and quit
keymap('n', '<leader>ww', ':w<CR>', opts)
keymap('n', '<leader>wq', ':wq<CR>', opts)
keymap('n', '<leader>qq', ':q!<CR>', opts)
keymap('n', '<leader>q', ':bdelete<CR>', opts)


-- Resize with arrows
-- delta: 2 lines
keymap('n', '<C-Up>', ':resize -2<CR>', opts)
keymap('n', '<C-Down>', ':resize +2<CR>', opts)
keymap('n', '<C-Left>', ':vertical resize -2<CR>', opts)
keymap('n', '<C-Right>', ':vertical resize +2<CR>', opts)

--telescope
local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', builtin.find_files, opts )
vim.keymap.set('n', '<leader>fg', builtin.live_grep, opts)
vim.keymap.set('n', '<leader>fb', builtin.buffers, opts )
vim.keymap.set('n', '<leader>fh', builtin.help_tags, opts)


-- Navigate buffers
keymap('n', '<leader>l', ':bnext<CR>', opts)
keymap('n', '<leader>h', ':bprevious<CR>', opts)
keymap('n', '<leader>x', ':bdelete<CR>', opts)


-- Move text up and down
-- keymap("n", "<A-j>", "<Esc>:m .+1<CR>", opts)
-- keymap("n", "<A-k>", "<Esc>:m .-2<CR>", opts)
keymap("n", "<A-j>", "<Esc>:m .+1<CR>==gi", opts)
keymap("n", "<A-k>", "<Esc>:m .-2<CR>==gi", opts)

keymap('n', '<leader>rr', ':%s///gc<left><left><left><left>', term_opts)
-----------------
-- Visual mode --
-----------------

-- Move text up and down
keymap("v", "<A-j>", ":m .+1<CR>==", opts)
keymap("v", "<A-k>", ":m .-2<CR>==", opts)
keymap("v", "p", '"_dP', opts)

-- Hint: start visual mode with the same area as the previous area and the same mode
keymap('v', '<', '<gv', opts)
keymap('v', '>', '>gv', opts)

-- Move text up and down
keymap("x", "J", ":move '>+1<CR>gv-gv", opts)
keymap("x", "K", ":move '<-2<CR>gv-gv", opts)
keymap("x", "<A-j>", ":move '>+1<CR>gv-gv", opts)
keymap("x", "<A-k>", ":move '<-2<CR>gv-gv", opts)

-- ufo for code foding
vim.keymap.set('n', '<leader>fo', require('ufo').openAllFolds)
vim.keymap.set('n', '<leader>fd', require('ufo').closeAllFolds)
-- vim.keymap.set('n', '<leade>o', require('ufo').openFoldsExceptKinds)
-- vim.keymap.set('n', '<leader>m', require('ufo').closeFoldsWith) -- closeAllFolds == closeFoldsWith(0)
-- vim.keymap.set('n', 'K', function()
--     local winid = require('ufo').peekFoldedLinesUnderCursor()
--     if not winid then
--         -- choose one of coc.nvim and nvim lsp
--         -- vim.fn.CocActionAsync('definitionHover') -- coc.nvim
--         vim.lsp.buf.hover()
--     end
-- end)
