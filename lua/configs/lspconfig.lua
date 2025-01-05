-- -- load defaults i.e lua_lsp
-- require("nvchad.configs.lspconfig").defaults()
--
-- local lspconfig = require "lspconfig"
--
-- -- EXAMPLE
-- local servers = { "html", "cssls", "ts_ls", "gopls", "ols", "clangd" }
--
-- local nvlsp = require "nvchad.configs.lspconfig"
--
-- -- lsps with default config
-- for _, lsp in ipairs(servers) do
--   lspconfig[lsp].setup {
--     on_attach = nvlsp.on_attach,
--     on_init = nvlsp.on_init,
--     capabilities = nvlsp.capabilities,
--   }
-- end
--
-- lspconfig.rust_analyzer.setup {}

-- Load defaults i.e lua_lsp
require("nvchad.configs.lspconfig").defaults()

local lspconfig = require "lspconfig"

-- EXAMPLE
local servers = { "html", "cssls", "ts_ls", "gopls", "ols", "clangd" }

local nvlsp = require "nvchad.configs.lspconfig"

-- Function to auto-organize imports or apply specific actions
local function organize_imports(client, bufnr)
  -- Ensure the LSP server supports the `textDocument/codeAction` capability
  if client.server_capabilities.codeActionProvider then
    vim.api.nvim_create_autocmd("BufWritePre", {
      buffer = bufnr,
      callback = function()
        local params = vim.lsp.util.make_range_params()
        params.context = { only = { "source.organizeImports" } }
        local result = vim.lsp.buf_request_sync(bufnr, "textDocument/codeAction", params, 1000)
        for _, res in pairs(result or {}) do
          for _, r in pairs(res.result or {}) do
            if r.edit then
              vim.lsp.util.apply_workspace_edit(r.edit, "utf-8")
            else
              vim.lsp.buf.execute_command(r.command)
            end
          end
        end
      end,
    })
  end
end

-- Custom `on_attach` function
local function on_attach(client, bufnr)
  nvlsp.on_attach(client, bufnr) -- Load NVChad's default `on_attach`

  -- Add organize imports
  organize_imports(client, bufnr)
end

-- LSPS with default config and custom `on_attach`
for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup {
    on_attach = on_attach,
    on_init = nvlsp.on_init,
    capabilities = nvlsp.capabilities,
  }
end

-- Rust Analyzer setup (no specific organize import support but customizable)
lspconfig.rust_analyzer.setup {
  on_attach = on_attach,
  on_init = nvlsp.on_init,
  capabilities = nvlsp.capabilities,
}

