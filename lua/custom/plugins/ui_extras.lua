local function gh(repo) return 'https://github.com/' .. repo end

vim.pack.add { gh 'NMAC427/guess-indent.nvim' }
require('guess-indent').setup {}

if vim.g.have_nerd_font then vim.pack.add { gh 'nvim-tree/nvim-web-devicons' } end

-- Highlight todo, notes, etc in comments
vim.pack.add { gh 'folke/todo-comments.nvim' }
require('todo-comments').setup { signs = false }

-- scrolling
vim.pack.add { gh 'karb94/neoscroll.nvim' }
require('neoscroll').setup {
  -- All these keys will be mapped to their corresponding default scrolling animation
  mappings = { '<C-u>', '<C-d>', '<C-b>', '<C-f>' },
  hide_cursor = true, -- Hide cursor while scrolling
  stop_eof = true, -- Stop at <EOF> when scrolling downwards
  respect_scrolloff = false, -- Stop scrolling when the cursor reaches the scrolloff margin of the file
  cursor_scrolls_alone = true, -- The cursor will keep on scrolling even if the window cannot scroll further
  easing_function = nil, -- Default easing function
  pre_hook = nil, -- Function to run before the scrolling animation starts
  post_hook = nil, -- Function to run after the scrolling animation ends
  performance_mode = false, -- Disable "Performance Mode" on all buffers.
}
local neoscroll = require 'neoscroll'
local keymap = {
  -- Use the "sine" easing function
  ['<C-u>'] = function() neoscroll.ctrl_u { duration = 250, easing = 'sine' } end,
  ['<C-d>'] = function() neoscroll.ctrl_d { duration = 250, easing = 'sine' } end,
  -- Use the "circular" easing function
  ['<C-b>'] = function() neoscroll.ctrl_b { duration = 450, easing = 'circular' } end,
  ['<C-f>'] = function() neoscroll.ctrl_f { duration = 450, easing = 'circular' } end,
  -- When no value is passed the `easing` option supplied in `setup()` is used
  ['<C-y>'] = function() neoscroll.scroll(-0.1, { move_cursor = false, duration = 100 }) end,
  ['<C-e>'] = function() neoscroll.scroll(0.1, { move_cursor = false, duration = 100 }) end,
}
local modes = { 'n', 'v', 'x' }
for key, func in pairs(keymap) do
  vim.keymap.set(modes, key, func)
end

-- snacks
vim.pack.add { gh 'folke/snacks.nvim' }
require('snacks').setup {
  opts = {
    input = {
      enabled = true,
      backdrop = false,
      position = 'float',
      border = true,
      title_pos = 'center',
      height = 1,
      width = 60,
      relative = 'editor',
      noautocmd = true,
      row = 2,
      wo = {
        winhighlight = 'NormalFloat:SnacksInputNormal,FloatBorder:SnacksInputBorder,FloatTitle:SnacksInputTitle',
        cursorline = false,
      },
      bo = {
        filetype = 'snacks_input',
        buftype = 'prompt',
      },
      b = {
        completion = false, -- disable blink completions in input
      },
      keys = {
        n_esc = { '<esc>', { 'cmp_close', 'cancel' }, mode = 'n', expr = true },
        i_esc = { '<esc>', { 'cmp_close', 'stopinsert' }, mode = 'i', expr = true },
        i_cr = { '<cr>', { 'cmp_accept', 'confirm' }, mode = { 'i', 'n' }, expr = true },
        i_tab = { '<tab>', { 'cmp_select_next', 'cmp' }, mode = 'i', expr = true },
        i_ctrl_w = { '<c-w>', '<c-s-w>', mode = 'i', expr = true },
        i_up = { '<up>', { 'hist_up' }, mode = { 'i', 'n' } },
        i_down = { '<down>', { 'hist_down' }, mode = { 'i', 'n' } },
        q = 'cancel',
      },
    },
  },
}

-- colorizer
vim.pack.add { gh 'catgoose/nvim-colorizer.lua' }
require('colorizer').setup {}
