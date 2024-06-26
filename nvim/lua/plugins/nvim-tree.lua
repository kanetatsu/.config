return  {
  {
    "nvim-tree/nvim-tree.lua",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
      vim.api.nvim_set_keymap('n', '<C-n>', ':NvimTreeToggle<CR>', { noremap = true, silent = true })

      -- visual
      vim.o.ambiwidth = 'double'
      vim.o.tabstop = 2
      vim.o.softtabstop = 2
      vim.o.shiftwidth = 4
      vim.o.expandtab = true
      vim.o.autoindent = true
      vim.o.smartindent = true

      -- optionally enable 24-bit colour
      vim.opt.termguicolors = true

      -- empty setup using defaults
      require("nvim-tree").setup({
          filters = {
            dotfiles = true,
          },
      })
    end,
  }
}
