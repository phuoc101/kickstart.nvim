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
  -- NOTE: jk to escape
  {
    'max397574/better-escape.nvim',
    config = function()
      require('better_escape').setup {
        timeout = vim.o.timeoutlen,
        default_mappings = true,
        mappings = {
          i = {
            j = {
              -- These can all also be functions
              k = '<Esc>',
              j = '<Esc>',
            },
          },
          c = {
            j = {
              k = '<Esc>',
              j = '<Esc>',
            },
          },
          t = {
            j = {
              k = '<C-\\><C-n>',
            },
          },
          v = {
            j = {
              k = '<Esc>',
            },
          },
          s = {
            j = {
              k = '<Esc>',
            },
          },
        },
      }
    end,
  },
}
