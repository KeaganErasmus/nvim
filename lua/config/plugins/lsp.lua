return {
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      -- Mason for installing LSP servers
      { "williamboman/mason.nvim",          config = true },
      { "williamboman/mason-lspconfig.nvim" },

      -- Lazydev for better Lua experience
      {
        "folke/lazydev.nvim",
        ft = "lua",
        opts = {
          library = {
            { path = "${3rd}/luv/library", words = { "vim%.uv" } },
          },
        },
      },
    },
    config = function()
      -- Setup mason
      require("mason").setup()
      require("mason-lspconfig").setup {
        ensure_installed = { "lua_ls", "clangd" },
      }

      local lspconfig = require("lspconfig")

      -- Optional: Global on_attach
      local function on_attach(client, bufnr)
        -- Add keymaps or other buffer-local setup here
      end

      -- Setup handlers for LSPs
      require("mason-lspconfig").setup_handlers {
        -- Default handler
        function(server_name)
          lspconfig[server_name].setup {
            on_attach = on_attach,
          }
        end,

        -- Custom config for clangd
        ["clangd"] = function()
          lspconfig.clangd.setup {
            on_attach = function(client, bufnr)
              client.server_capabilities.signatureHelpProvider = false
              on_attach(client, bufnr)
            end,
          }
        end,
      }
    end,
  }
}
