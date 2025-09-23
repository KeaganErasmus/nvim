-- You can add your own plugins here or in other files in this directory!
--  I promise not to create any merge conflicts in this directory :)
--
-- See the kickstart.nvim README for more information
return {
  { 'blazkowolf/gruber-darker.nvim' },
  { 'nvim-tree/nvim-web-devicons' },
  {
    'romgrk/barbar.nvim',
    dependencies = {
      -- 'lewis6991/gitsigns.nvim', -- OPTIONAL: for git status
      -- 'nvim-tree/nvim-web-devicons', -- OPTIONAL: for file icons
    },

    init = function()
      vim.g.barbar_auto_setup = false
    end,
    icons = {
      filetype = { enabled = false },
    },
    opts = {
      animation = true,

      -- insert_at_start = true,
    },
    version = '^1.0.0',
  },
  {
    'ThePrimeagen/harpoon',
    branch = 'harpoon2',
    dependencies = { 'nvim-lua/plenary.nvim' },
    config = function()
      require('harpoon').setup {}
    end,
  },
}
