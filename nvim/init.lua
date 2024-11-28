require('lazy-nvim')

-- map --
vim.api.nvim_set_keymap('i', 'jj', '<ESC>', { noremap = true })
vim.api.nvim_set_keymap('n', '<C-h>', '<C-w><>', { noremap = true })
vim.api.nvim_set_keymap('n', '<C-l>', '<C-w>>>', { noremap = true })
vim.api.nvim_set_keymap('n', 'gp', ':bprev<CR>', { noremap = true })
vim.api.nvim_set_keymap('n', 'gn', ':bnext<CR>', { noremap = true })
vim.api.nvim_set_keymap('n', '<ESC><ESC>', ':nohl<CR>', { noremap = true })
vim.api.nvim_set_keymap('n', '<C-[>', ':<C-u>tab stj <C-R>=expand("<cword>")<CR><CR>', { noremap = true })

vim.api.nvim_set_keymap('n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>', { noremap = true })
vim.api.nvim_set_keymap('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', { noremap = true })
vim.api.nvim_set_keymap('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', { noremap = true })
vim.api.nvim_set_keymap('n', 'gf', '<cmd>lua vim.lsp.buf.format()<CR>', { noremap = true })

-- set --
vim.o.wildmenu = true
vim.o.ignorecase = smartcase
vim.o.incsearch = true
vim.o.wrap = false
vim.o.nu = true
vim.o.expandtab = true
vim.o.shiftwidth=2
vim.o.foldmethod=indent
vim.o.foldlevel=2
vim.cmd [[ set grepprg=git\ grep\ -I\ --line-number ]]
vim.o.laststatus=2

-- autocmd --
vim.api.nvim_create_autocmd("QuickFixCmdPost", {
  pattern = "*grep*",
  callback = function()
    vim.cmd("cwindow")
  end
})

