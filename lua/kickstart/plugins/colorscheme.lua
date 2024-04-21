return {
  -- You can easily change to a different colorscheme.
  -- Change the name of the colorscheme plugin below, and then
  -- change the command in the config to whatever the name of that colorscheme is.
  --
  -- If you want to see what colorschemes are already installed, you can use `:Telescope colorscheme`.

  { 'folke/tokyonight.nvim' },
  {
    'EdenEast/nightfox.nvim',
    lazy = true,
    config = function()
      -- local colors = require("nightfox.lib.color")
      -- local carbonfox = require("nightfox.palette").load("carbonfox").generate_spec(0)
      local carbon_palette = require('nightfox.palette').load 'carbonfox'
      local dayfox_palette = require('nightfox.palette').load 'dayfox'
      local Color = require 'nightfox.lib.color'

      require('nightfox').setup {
        options = {
          styles = {
            comments = 'italic',
            conditionals = 'italic',
            constants = 'bold',
            functions = 'bold',
            keywords = 'bold, italic',
            numbers = 'NONE',
            operators = 'NONE',
            strings = 'NONE',
            types = 'italic',
            variables = 'NONE',
          },
          inverse = {
            -- Inverse highlight for different types
            match_paren = false,
            visual = false,
            search = false,
          },
        },
        groups = {
          carbonfox = {
            CursorLine = { bg = Color.from_hex(carbon_palette.bg3) },
            Visual = {
              bg = Color.from_hex(carbon_palette.fg3),
              fg = Color.from_hex(carbon_palette.bg0),
              style = 'bold',
            },
            VertSplit = { fg = Color.from_hex(carbon_palette.fg3) },
            MatchParen = { style = 'underline,bold' },
          },
          dayfox = {
            CursorLine = { bg = Color.from_hex(dayfox_palette.bg0) },
            Visual = {
              bg = Color.from_hex(dayfox_palette.bg3),
              fg = Color.from_hex(dayfox_palette.fg0),
              style = 'bold',
            },
            VertSplit = { fg = Color.from_hex(dayfox_palette.fg3) },
            MatchParen = { style = 'underline,bold' },
          },
        },
      }
    end,
    priority = 1000, -- Make sure to load this before all the other start plugins.
    init = function()
      -- Load the colorscheme here.
      vim.cmd.colorscheme 'carbonfox'
    end,
  },
}
-- vim: ts=2 sts=2 sw=2 et
