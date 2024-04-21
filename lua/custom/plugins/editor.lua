return {
  -- NOTE: Surrounding
  {
    'kylechui/nvim-surround',
    version = '*', -- Use for stability; omit to use `main` branch for the latest features
    config = function()
      -- Use default configurations
      require('nvim-surround').setup()
    end,
  },
  -- NOTE: Movements
  {
    'jinh0/eyeliner.nvim',
    config = function()
      require('eyeliner').setup {
        highlight_on_key = true,
        dim = true,
      }
    end,
  },
  {
    'phaazon/hop.nvim',
    branch = 'v2', -- optional but strongly recommended
    config = function()
      local hop = require 'hop'
      -- you can configure Hop the way you like here; see :h hop-config
      hop.setup { keys = 'etovxqpdygfblzhckisuran' }

      vim.keymap.set({ 'n', 'v' }, 's', '<cmd>HopChar1<CR>', { remap = true })
    end,
  },
  -- NOTE: Diagnostic
  {
    'folke/trouble.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    opts = { use_diagnostic_signs = true },
    config = function()
      require('trouble').setup {
        -- your configuration comes here
        -- or leave it empty to use the default settings
        -- refer to the configuration section below
      }
    end,
  },
}
