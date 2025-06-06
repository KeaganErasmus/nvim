return {
  "neovim/nvim-lspconfig",
  dependencies = {
    "folke/lazydev.nvim",
    ft = "lua", -- only load on lua files
    opts = {
      library = {
        -- See the configuration section for more details
        -- Load luvit types when the `vim.uv` word is found
        { path = "${3rd}/luv/library", words = { "vim%.uv" } },
      },
    },
  },
  config = function()
    -- local capabilities = require('blink.cmp').get_lsp_capabilities()

    require("lspconfig").lua_ls.setup { capabilities }
    require("lspconfig").ts_ls.setup {
      capabilities
      -- filetypes = {"typescript"},
      -- cmd = {"typescript-language-server", "--stdio"}
    }
    require("lspconfig").ols.setup { capabilities }
  end
}
