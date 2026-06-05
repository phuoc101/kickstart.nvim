-- TeX
vim.pack.add { 'https://github.com/lervag/vimtex' }

vim.g.vimtex_view_method = 'sioyek'

vim.api.nvim_create_autocmd('FileType', {
  pattern = { 'tex', 'bib' },
  callback = function()
    -- VimTeX handles its own internal lazy-loading if globals are set,
    -- but ensuring it's ready for these filetypes:
    vim.cmd 'packadd! vimtex'
  end,
})

vim.api.nvim_create_autocmd('FileType', {
  pattern = { 'tex', 'bib' },
  desc = 'Texlab keybindings',
  callback = function()
    vim.keymap.set('n', '<localleader>ll', ':VimtexCompile<CR>', { desc = 'Build LaTeX File' })
    vim.keymap.set('n', '<localleader>lv', ':VimtexView<CR>', { desc = 'Forward Search LaTeX File' })
    require('which-key').add {
      '<localleader>l',
      group = '[L]atex',
    }
  end,
})
