return {
  "neovim/nvim-lspconfig",
  opts = {
    inlay_hints = { enabled = false },
    servers = {
      gopls = {
        settings = {
          gopls = {
            analyses = { -- Ref: https://github.com/golang/tools/blob/master/gopls/doc/analyzers.md
              unusedfunc = true,
            },
          },
        },
      },
    },
  },
}
