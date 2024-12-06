return {
  {
    'akinsho/toggleterm.nvim',
    config = function()
      if vim.loop.os_uname().sysname == 'Windows_NT' then
        vim.cmd [[let &shell = '"C:/Program Files/Git/bin/bash.exe"']]
        vim.cmd [[let &shellcmdflag = '-s']]
      end

      require('toggleterm').setup({
        direction = 'float',
        open_mapping = [[<c-\>]],
      })
    end
  }
}
