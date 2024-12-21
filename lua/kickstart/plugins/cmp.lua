return {
  {
    'saghen/blink.cmp',
    dependencies = {
      -- Snippet Engine & its associated nvim-cmp source
      {
        'L3MON4D3/LuaSnip',
        version = 'v2.*',
      },
      'saadparwaiz1/cmp_luasnip',
      'hrsh7th/cmp-nvim-lsp',
      'hrsh7th/cmp-path',
      'onsails/lspkind.nvim',
    },
    -- use a release tag to download pre-built binaries
    version = 'v0.*',

    ---@module 'blink.cmp'
    ---@type blink.cmp.Config
    opts = {
      keymap = {
        preset = 'super-tab',
        ['<C-j>'] = { 'select_next', 'fallback' },
        ['<C-k>'] = { 'select_prev', 'fallback' },
      },

      completion = {
        trigger = {
          -- When true, will prefetch the completion items when entering insert mode
          prefetch_on_insert = false,
          -- When false, will not show the completion window automatically when in a snippet
          show_in_snippet = false,
          -- When true, will show the completion window after typing a character that matches the `keyword.regex`
          show_on_keyword = true,
          -- When true, will show the completion window after typing a trigger character
          show_on_trigger_character = true,
          -- LSPs can indicate when to show the completion window via trigger characters
          -- however, some LSPs (i.e. tsserver) return characters that would essentially
          -- always show the window. We block these by default.
          show_on_blocked_trigger_characters = function()
            if vim.api.nvim_get_mode().mode == 'c' then
              return {}
            end
            return { ' ', '\n', '\t' }
          end,

          -- When both this and show_on_trigger_character are true, will show the completion window
          -- when the cursor comes after a trigger character after accepting an item
          show_on_accept_on_trigger_character = true,

          -- When both this and show_on_trigger_character are true, will show the completion window
          -- when the cursor comes after a trigger character when entering insert mode
          show_on_insert_on_trigger_character = true,

          -- List of trigger characters (on top of `show_on_blocked_trigger_characters`) that won't trigger
          -- the completion window when the cursor comes after a trigger character when
          -- entering insert mode/accepting an item
          show_on_x_blocked_trigger_characters = { "'", '"', '(' },
          -- or a function, similar to show_on_blocked_trigger_character
        },
      },

      appearance = {
        -- Sets the fallback highlight groups to nvim-cmp's highlight groups
        -- Useful for when your theme doesn't support blink.cmp
        -- will be removed in a future release
        use_nvim_cmp_as_default = true,
        -- Set to 'mono' for 'Nerd Font Mono' or 'normal' for 'Nerd Font'
        -- Adjusts spacing to ensure icons are aligned
        nerd_font_variant = 'normal',
      },

      snippets = {
        expand = function(snippet)
          require('luasnip').lsp_expand(snippet)
        end,
        active = function(filter)
          if filter and filter.direction then
            return require('luasnip').jumpable(filter.direction)
          end
          return require('luasnip').in_snippet()
        end,
        jump = function(direction)
          require('luasnip').jump(direction)
        end,
      },
      -- default list of enabled providers defined so that you can extend it
      -- elsewhere in your config, without redefining it, due to `opts_extend`
      sources = {
        default = { 'lsp', 'path', 'luasnip', 'buffer' },
        -- optionally disable cmdline completions
        cmdline = function()
          local type = vim.fn.getcmdtype()
          -- Search forward and backward
          if type == '/' or type == '?' then
            return { 'buffer' }
          end
          -- Commands
          if type == ':' then
            return { 'cmdline' }
          end
          return {}
        end,
      },

      -- experimental signature help support
      -- signature = { enabled = true }
    },
    -- allows extending the providers array elsewhere in your config
    -- without having to redefine it
    opts_extend = { 'sources.default' },
  },
}
-- vim: ts=2 sts=2 sw=2 et
