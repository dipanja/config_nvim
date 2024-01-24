local ftMap = {
    vim = 'indent',
    python = {'indent'},
    git = ''
}

require("ufo").setup({
    open_fold_hl_timeout = 150,
    close_fold_kinds = {'imports', 'comment'},
    preview = {
        win_config = {
            border = {'', '─', '', '', '', '─', '', ''},
            winhighlight = 'Normal:Folded',
            winblend = 0
        },
        mappings = {
            scrollU = '<C-u>',
            scrollD = '<C-d>',
            jumpTop = '[',
            jumpBot = ']'
        }
    },
    provider_selector = function(bufnr, filetype, buftype)
        -- if you prefer treesitter provider rather than lsp,
        -- return ftMap[filetype] or {'treesitter', 'indent'}
        -- return ftMap[filetype]
        -- return {'treesitter', 'indent'}
        return {'lsp', 'indent'}

        -- refer to ./doc/example.lua for detail
    end
})


-- define common options
local opts = {
    noremap = true,      -- non-recursive
    silent = true,       -- do not show message
}

local term_opts = { silent =
    false
}

local keymap = vim.api.nvim_set_keymap
-- ufo for code foding
-- keymap('n', '<leader>fo', require('ufo').openAllFolds)
-- keymap('n', '<leader>fd', require('ufo').closeAllFolds)
-- keymap('n', '<leade>o', require('ufo').openFoldsExceptKinds)
-- keymap('n', '<leader>m', require('ufo').closeFoldsWith) -- closeAllFolds == closeFoldsWith(0)
-- keymap('n', 'K', function()
--     local winid = require('ufo').peekFoldedLinesUnderCursor()
--     if not winid then
--         -- choose one of coc.nvim and nvim lsp
--         -- vim.fn.CocActionAsync('definitionHover') -- coc.nvim
--         vim.lsp.buf.hover()
--     end
-- end)
--
vim.keymap.set('n', 'zk', function()
    local winid = require('ufo').peekFoldedLinesUnderCursor()
    if not winid then
        -- choose one of coc.nvim and nvim lsp
        -- vim.fn.CocActionAsync('definitionHover') -- coc.nvim
        vim.lsp.buf.hover()
    end
end, opts)
