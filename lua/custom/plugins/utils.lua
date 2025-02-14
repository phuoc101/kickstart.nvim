return {
  {
    'ibhagwan/fzf-lua',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    opts = {},
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
    config = function()
      require('colorizer').setup()
    end,
  },
  {
    'tpope/vim-fugitive',
  },
}
