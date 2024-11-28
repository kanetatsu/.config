return {
  {
    "nvimtools/none-ls.nvim",
    dependencies = {
      "jose-elias-alvarez/null-ls.nvim",
      "nvim-lua/plenary.nvim",
      "vim-test/vim-test"
    },
    config = function()
      local status, null_ls = pcall(require, "null-ls")
      if (not status) then return end
      null_ls.setup({ -- nul-lsを初期化
          -- sources={}の中に利用したいLinter/Formatterを記載（後述）
          sources = {
          -- 例：ローカルおよびグローバルのeslintのコード診断機能をnull-lsで利用
          --     null_ls.builtins.diagnostics.eslint.with({ 
          --     prefer_local = "node_modules/.bin", --プロジェクトローカルがある場合はそれを利用
          -- }),
          --例：ローカルおよびグローバルのPrettierをFormatに利用
              null_ls.builtins.formatting.prettier,
          },
          debug = false,
        })
    end
  },
}
