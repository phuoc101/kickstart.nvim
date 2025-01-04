return {
  {
    'nvim-pack/nvim-spectre',
    config = function()
      vim.keymap.set('n', '<leader>S', '<cmd>lua require("spectre").toggle()<CR>', {
        desc = 'Toggle Spectre',
      })
      vim.keymap.set('n', '<leader>sw', '<cmd>lua require("spectre").open_visual({select_word=true})<CR>', {
        desc = 'Search current word',
      })
      vim.keymap.set('v', '<leader>sw', '<esc><cmd>lua require("spectre").open_visual()<CR>', {
        desc = 'Search current word',
      })
      vim.keymap.set('n', '<leader>sp', '<cmd>lua require("spectre").open_file_search({select_word=true})<CR>', {
        desc = 'Search on current file',
      })
    end,
  },
  {
    'ibhagwan/fzf-lua',
    -- optional for icon support
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    -- or if using mini.icons/mini.nvim
    -- dependencies = { "echasnovski/mini.icons" },
    opts = {},
  },
  {
    'junegunn/fzf.vim',
    event = 'VeryLazy',
  },
  {
    'danymat/neogen',
    ft = { 'python', 'c', 'cpp' },
    dependencies = 'nvim-treesitter/nvim-treesitter',
    config = function()
      require('neogen').setup {
        snippet_engine = 'luasnip',
        languages = {
          python = {
            template = {
              annotation_convention = 'google_docstrings',
            },
          },
        },
      }
    end,
  },
  {
    'norcalli/nvim-colorizer.lua',
    -- event = 'VeryLazy',
    config = function()
      require('colorizer').setup()
    end,
  },
  {
    'tpope/vim-fugitive',
    event = 'VeryLazy',
  },
}
