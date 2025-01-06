return {
  "https://git.sr.ht/~whynothugo/lsp_lines.nvim",
  lazy = false,
  config = function()
    -- Initialize lsp_lines
    require("lsp_lines").setup()

    -- Configure diagnostics globally
    vim.diagnostic.config({
      virtual_text = false,
      signs = false,
      underline = true,
      virtual_lines = true
    })

    -- Optional: Ensure compatibility with Lazy loading
    vim.api.nvim_create_autocmd("LspAttach", {
      callback = function()
        vim.diagnostic.config({
          virtual_lines = true,
          virtual_text = false,
        })
      end,
    })
  end,
}

