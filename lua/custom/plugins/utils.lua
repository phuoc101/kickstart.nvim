return {
  {
    'junegunn/fzf',
    event = 'VeryLazy',
    build = ' fzf#install() ',
    config = function()
      vim.keymap.set('n', '<leader>sf', ':Files<CR>', { desc = '[S]earch [F]iles' })
      vim.keymap.set('n', '<leader>sg', ':Rg<CR>', { desc = '[S]earch by [G]rep' })
    end,
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
