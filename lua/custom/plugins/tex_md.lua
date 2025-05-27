return {
  -- NOTE: Texlab configuration
  {
    'lervag/vimtex',
    ft = { 'tex', 'bib' },
    lazy = false, -- we don't want to lazy load VimTeX
    -- tag = "v2.15", -- uncomment to pin to a specific release
    init = function()
      -- VimTeX configuration goes here, e.g.
      vim.g.vimtex_view_method = 'sioyek'
    end,
  },
  {
    'iamcco/markdown-preview.nvim',
    ft = 'markdown',
    build = function()
      vim.fn['mkdp#util#install']()
    end,
  },
}
