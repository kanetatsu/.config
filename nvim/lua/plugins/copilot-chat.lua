return {
  {
    "CopilotC-Nvim/CopilotChat.nvim",
    branch = "canary",
    dependencies = {
      { "zbirenbaum/copilot.lua" }, -- or github/copilot.vim
      { "nvim-lua/plenary.nvim" }, -- for curl, log wrapper
    },
    opts = {
      debug = true, -- Enable debugging
      -- See Configuration section for rest
    },
    -- See Commands section for default commands if you want to lazy load on them

    config = function()
      local select = require('CopilotChat.select')
      require("CopilotChat").setup({
          debug = true, -- Enable debugging

          -- https://qiita.com/lx-sasabo/items/97c49d0f354ea3bdd525#prompt-actions-%E3%81%AE%E8%B3%AA%E5%95%8F%E6%96%87%E3%82%92%E6%97%A5%E6%9C%AC%E8%AA%9E%E5%8C%96%E3%81%99%E3%82%8B
          -- プロンプトの設定
          -- デフォルトは英語なので日本語でオーバーライドしています
          prompts = {
            Explain = {
              prompt = '/COPILOT_EXPLAIN カーソル上のコードの説明を段落をつけて書いてください。',
            },
            Tests = {
              prompt = '/COPILOT_TESTS カーソル上のコードの詳細な単体テスト関数を書いてください。',
            },
            Fix = {
              prompt = '/COPILOT_FIX このコードには問題があります。バグを修正したコードに書き換えてください。',
            },
            Optimize = {
              prompt = '/COPILOT_REFACTOR 選択したコードを最適化し、パフォーマンスと可読性を向上させてください。',
            },
            Docs = {
              prompt = '/COPILOT_REFACTOR 選択したコードのドキュメントを書いてください。ドキュメントをコメントとして追加した元のコードを含むコードブロックで回答してください。使用するプログラミング言語に最も適したドキュメントスタイルを使用してください（例：JavaScriptのJSDoc、Pythonのdocstringsなど）',
            },
            FixDiagnostic = {
              prompt = 'ファイル内の次のような診断上の問題を解決してください：',
              selection = select.diagnostics,
            }
          }
        })
    end,
  },
}
