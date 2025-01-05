return {

  "https://git.sr.ht/~whynothugo/lsp_lines.nvim",
  config = function()
    require("lsp_lines").setup()

    -- Enable lsp_lines by default
    vim.diagnostic.config({
      virtual_text = false, -- Disable virtual text (default LSP inline errors)
      signs = false,        -- Disable gutter signs
      underline = false,    -- Disable underlining
      virtual_lines = true, -- Enable lsp_lines by default
      wrap = true
    })

    -- Toggle command for manual control if needed
    vim.keymap.set("n", "<leader>lt", function()
      require("lsp_lines").toggle()
    end, { desc = "Toggle LSP Lines" })
  end,
}
