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
      require('trouble').setup {}
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
  {
    'jiaoshijie/undotree',
    dependencies = 'nvim-lua/plenary.nvim',
    config = function()
      local undotree = require 'undotree'
      undotree.setup {
        float_diff = false, -- using float window previews diff, set this `true` will disable layout option
        layout = 'left_bottom', -- "left_bottom", "left_left_bottom"
        position = 'left', -- "right", "bottom"
        ignore_filetype = { 'undotree', 'undotreeDiff', 'qf', 'TelescopePrompt', 'spectre_panel', 'tsplayground' },
        window = {
          winblend = k0,
        },
      }
      vim.keymap.set('n', '<leader>u', "<cmd>lua require('undotree').toggle()<cr>", { desc = 'Undotree' })
    end,
  },
  {
    'filipdutescu/renamer.nvim',
    branch = 'master',
    requires = { { 'nvim-lua/plenary.nvim' } },
  },
}
