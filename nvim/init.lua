require('lazy-nvim')

-- map --
vim.api.nvim_set_keymap('i', 'jj', '<ESC>', { noremap = true })
vim.api.nvim_set_keymap('n', '<C-h>', '<C-w><>', { noremap = true })
vim.api.nvim_set_keymap('n', '<C-l>', '<C-w>>>', { noremap = true })
vim.api.nvim_set_keymap('n', '<C-j>', ':bprev<CR>', { noremap = true })
vim.api.nvim_set_keymap('n', '<C-k>', ':bnext<CR>', { noremap = true })
vim.api.nvim_set_keymap('n', '<ESC><ESC>', ':nohl<CR>', { noremap = true })
vim.api.nvim_set_keymap('n', '<C-[>', ':<C-u>tab stj <C-R>=expand("<cword>")<CR><CR>', { noremap = true })

vim.api.nvim_set_keymap('n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>', { noremap = true })
vim.api.nvim_set_keymap('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', { noremap = true })
vim.api.nvim_set_keymap('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', { noremap = true })
vim.api.nvim_set_keymap('n', 'gf', '<cmd>lua vim.lsp.buf.format()<CR>', { noremap = true })

vim.api.nvim_set_keymap('n', 'yy', '"+yy', { noremap = true })
vim.api.nvim_set_keymap('v', 'y', '"+y', { noremap = true })

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

vim.keymap.set('n', '<F5>', function() require('dap').continue() end)
vim.keymap.set('n', '<F10>', function() require('dap').step_over() end)
vim.keymap.set('n', '<F11>', function() require('dap').step_into() end)
vim.keymap.set('n', '<F12>', function() require('dap').step_out() end)
vim.keymap.set('n', '<Leader>b', function() require('dap').toggle_breakpoint() end)
vim.keymap.set('n', '<Leader>B', function() require('dap').set_breakpoint() end)
vim.keymap.set('n', '<Leader>lp', function() require('dap').set_breakpoint(nil, nil, vim.fn.input('Log point message: ')) end)
vim.keymap.set('n', '<Leader>dr', function() require('dap').repl.open() end)
vim.keymap.set('n', '<Leader>dl', function() require('dap').run_last() end)
vim.keymap.set({'n', 'v'}, '<Leader>dh', function()
  require('dap.ui.widgets').hover()
end)
vim.keymap.set({'n', 'v'}, '<Leader>dp', function()
  require('dap.ui.widgets').preview()
end)
vim.keymap.set('n', '<Leader>df', function()
  local widgets = require('dap.ui.widgets')
  widgets.centered_float(widgets.frames)
end)
vim.keymap.set('n', '<Leader>ds', function()
  local widgets = require('dap.ui.widgets')
  widgets.centered_float(widgets.scopes)
end)

