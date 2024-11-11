-- local options = {
--   formatters_by_ft = {
--     lua = { "stylua" },
--     -- css = { "prettier" },
--     -- html = { "prettier" },
--   },
--
--   format_on_save = {
--     -- These options will be passed to conform.format()
--     timeout_ms = 500,
--     lsp_fallback = true,
--   },
-- }
-- return options

return {
  "stevearc/conform.nvim",
  config = function()
    require("conform").setup {
      formatters_by_ft = {
        lua = { "stylua" },
        -- python = { "black" },
        rust = { "rustfmt" },
        javascript = { "prettier", stop_after_first = true },
        javascriptreact = { "prettier", stop_after_first = true },
        typescript = { "prettier", stop_after_first = true },
        typescriptreact = { "prettier", stop_after_first = true },
        -- go = { "gofumpt", "golines", "goimports-reviser" },
        c = { "clang_format" },
        cpp = { "clang_format" },
        html = { "prettier" },
        json = { "prettier" },
      },
      format_on_save = {
        timeout_ms = 500,
        lsp_format = "fallback",
      },
    }

    vim.api.nvim_create_autocmd("BufWritePre", {
      pattern = "*",
      callback = function(args)
        require("conform").format { bufnr = args.buf }
      end,
    })
  end,
}
