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
          show_in_snippet = true,
          -- When true, will show the completion window after typing a character that matches the `keyword.regex`
          show_on_keyword = true,
          -- When true, will show the completion window after typing a trigger character
          show_on_trigger_character = true,
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
        preset = 'luasnip',
      },
      -- default list of enabled providers defined so that you can extend it
      -- elsewhere in your config, without redefining it, due to `opts_extend`
      sources = {
        default = { 'lsp', 'path', 'snippets', 'buffer' },
        -- optionally disable cmdline completions
        -- cmdline = function()
        --   local type = vim.fn.getcmdtype()
        --   -- Search forward and backward
        --   if type == '/' or type == '?' then
        --     return { 'buffer' }
        --   end
        --   -- Commands
        --   if type == ':' then
        --     return { 'cmdline' }
        --   end
        --   return {}
        -- end,
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

      -- experimental signature help support
      -- signature = { enabled = true }
    },
    -- allows extending the providers array elsewhere in your config
    -- without having to redefine it
    opts_extend = { 'sources.default' },
  },
}
-- vim: ts=2 sts=2 sw=2 et
