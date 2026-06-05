local function gh(repo) return 'https://github.com/' .. repo end

-- [[ Snippet Engine ]]
-- NOTE: You can also specify plugin using a version range for its git tag.
--  See `:help vim.version.range()` for more info
---@module 'luasnip'
vim.pack.add { { src = gh 'L3MON4D3/LuaSnip', version = vim.version.range '2.*' } }
require('luasnip').setup {}
require('luasnip.loaders.from_vscode').load { paths = './lua/snips/cpp' }
require('luasnip.loaders.from_vscode').load { paths = './lua/snips/python' }
require('luasnip.loaders.from_vscode').load { paths = './lua/snips/launch' }
require('luasnip.loaders.from_vscode').load { paths = './lua/snips/tex' }
require('luasnip.loaders.from_vscode').load { paths = './lua/snips/shell' }
require('luasnip.loaders.from_vscode').load { paths = './lua/snips/markdown' }
-- `friendly-snippets` contains a variety of premade snippets.
--    See the README about individual language/framework/plugin snippets:
--    https://github.com/rafamadriz/friendly-snippets
--
vim.pack.add { gh 'rafamadriz/friendly-snippets' }
require('luasnip.loaders.from_vscode').lazy_load()

-- [[ Autocomplete Engine ]]
---@module 'blink.cmp'
vim.pack.add { { src = gh 'saghen/blink.cmp', version = vim.version.range '1.*' } }
require('blink.cmp').setup {
  keymap = {
    preset = 'super-tab',
    ['<C-j>'] = { 'select_next', 'fallback' },
    ['<C-k>'] = { 'select_prev', 'fallback' },
  },

  appearance = {
    nerd_font_variant = 'normal',
  },

  completion = {
    documentation = { auto_show = false, auto_show_delay_ms = 500 },

    trigger = {
      -- When true, will prefetch the completion items when entering insert mode
      prefetch_on_insert = false,
      -- When false, will not show the completion window automatically when in a snippet
      show_in_snippet = true,
      -- When true, will show the completion window after typing a character that matches the `keyword.regex`
      show_on_keyword = true,
      -- When true, will show the completion window after typing a trigger character
      show_on_trigger_character = true,
    },
  },

  sources = {
    default = { 'lsp', 'path', 'snippets', 'buffer' },
  },

  cmdline = {
    keymap = {
      -- recommended, as the default keymap will only show and select the next item
      ['<Tab>'] = { 'show', 'accept' },
      ['<C-k>'] = { 'select_prev', 'fallback' },
      ['<C-j>'] = { 'select_next', 'fallback' },
    },
    completion = { menu = { auto_show = true } },
  },

  snippets = { preset = 'luasnip' },

  -- Blink.cmp includes an optional, recommended rust fuzzy matcher,
  -- which automatically downloads a prebuilt binary when enabled.
  --
  -- By default, we use the Lua implementation instead, but you may enable
  -- the rust implementation via `'prefer_rust_with_warning'`
  --
  -- See `:help blink-cmp-config-fuzzy` for more information
  fuzzy = { implementation = 'lua' },

  -- Shows a signature help window while you type arguments for a function
  signature = { enabled = true },
  -- allows extending the providers array elsewhere in your config
  -- without having to redefine it
}
