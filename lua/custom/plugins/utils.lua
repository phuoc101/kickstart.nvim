local function gh(repo) return 'https://github.com/' .. repo end

-- fzf-lua
vim.pack.add { gh 'ibhagwan/fzf-lua' }

-- Eyeliner
vim.pack.add { gh 'jinh0/eyeliner.nvim' }
require('eyeliner').setup {
  highlight_on_key = true,
  dim = true,
}

-- Leap
vim.pack.add { 'https://codeberg.org/andyg/leap.nvim' }
require('leap').setup {
  safe_labels = 'sut/SFNLHMUGTZ?',
  labels = 'sjklhodweimbuyvrgtaqpcxz/SFNJKLHODWEIMBUYVRGTAQPCXZ?',
}
vim.keymap.set({ 'n', 'x', 'o' }, '<leader>s', '<Plug>(leap)', { desc = 'Leap' })

-- trouble
vim.pack.add { gh 'folke/trouble.nvim' }
require('trouble').setup {}

-- jk to escape
vim.pack.add { gh 'max397574/better-escape.nvim' }
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
