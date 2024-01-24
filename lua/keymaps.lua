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
keymap('n', '<leader>w', ':w<CR>', opts)
keymap('n', '<leader>wq', ':wq<CR>', opts)
keymap('n', '<leader>qq', ':q!<CR>', opts)
keymap('n', '<leader>q', '<C-w>q', opts)

-- Resize with arrows
-- delta: 2 lines
keymap('n', '<C-Up>', ':resize -2<CR>', opts)
keymap('n', '<C-Down>', ':resize +2<CR>', opts)
keymap('n', '<C-Left>', ':vertical resize +2<CR>', opts)
keymap('n', '<C-Right>', ':vertical resize -2<CR>', opts)

-- Navigate buffers
keymap('n', '<leader>l', ':bnext<CR>', opts)
keymap('n', '<leader>h', ':bprevious<CR>', opts)
keymap('n', '<leader>x', ':bdelete<CR>', opts)

-- Move text up and down
keymap("n", "<A-j>", "<Esc>:m .+1<CR>", opts)
keymap("n", "<A-k>", "<Esc>:m .-2<CR>", opts)

keymap('n', '<leader>rr', ':%s///gc<left><left><left><left>', term_opts)

-- To preview Markdown files in browser
-- Markdowm preview toggle.
keymap("n", '<leader>p', ":MarkdownPreviewToggle<CR>", opts)
-----------------
-- Visual mode --
-----------------

-- use ctrl+c to copy to system clipboard
-- need xclip to be installed.
keymap("v", '<C-c>', '"+y', opts)
-- Move text up and down
-- keymap("v", "<A-j>", ":m .+1<CR>==", opts)
-- keymap("v", "<A-k>", ":m .-1<CR>==", opts)


