-- Hint: use `:h <option>` to figure out the meaning if needed
 
vim.opt.backup = false              -- creates a backup file
vim.opt.fileencoding = "utf-8"      -- the encoding written to a file
vim.opt.clipboard = 'unnamedplus'   -- use system clipboard 
vim.opt.completeopt = {'menu', 'menuone', 'noselect'}
vim.opt.mouse = 'a'                 -- allow the mouse to be used in Nvim
vim.opt.guifont = "monospace:h17"   -- the font used in graphical neovim applications

-- Tab
vim.opt.tabstop = 4                 -- number of visual spaces per TAB
vim.opt.softtabstop = 4             -- number of spacesin tab when editing
vim.opt.shiftwidth = 4              -- insert 4 spaces on a tab
vim.opt.expandtab = true            -- tabs are spaces, mainly because of python

-- UI config
vim.opt.number = true               -- show absolute number
vim.opt.relativenumber = true       -- add numbers to each line on the left side
vim.opt.cursorline = true           -- highlight cursor lin underneath the cursor horizontally
vim.opt.cursorcolumn = true
vim.opt.splitbelow = true           -- open new vertical split bottom
vim.opt.splitright = true           -- open new horizontal splits right
vim.opt.termguicolors = true        -- enabl 24-bit RGB color in the TUI
vim.opt.showmode = true             -- we are experienced, wo don't need the "-- INSERT --" mode hint
vim.cmd "set cc=80"                 -- set colorcolumn at 80.


-- Searching
vim.opt.incsearch = true            -- search as characters are entered
-- vim.opt.hlsearch = true             -- highlight matches
vim.opt.hlsearch = false             -- highlight matches
vim.opt.ignorecase = true           -- ignore case in searches by default
vim.opt.smartcase = true            -- but make it case sensitive if an uppercase is entered


-- Scrolling
vim.opt.scrolloff = 2

-- ufo for code folding
vim.o.foldcolumn = '1' -- '0' is not bad
vim.o.foldlevel = 99 -- Using ufo provider need a large value, feel free to decrease the value
vim.o.foldlevelstart = 99
vim.o.foldenable = true





vim.cmd "set whichwrap+=<,>,[,],h,l"

