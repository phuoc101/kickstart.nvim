-- build
vim.api.nvim_create_autocmd('PackChanged', {
  callback = function(ev)
    local name = ev.data.spec.name
    local kind = ev.data.kind
    if kind ~= 'install' and kind ~= 'update' then return end
    if name == 'markdown-preview.nvim' then
      if not ev.data.active then vim.cmd.packadd(name) end
      vim.fn['mkdp#util#install']()
      return
    end
  end,
})

vim.pack.add { 'https://github.com/iamcco/markdown-preview.nvim' }

-- config
vim.g.mkdp_auto_close = 1

vim.api.nvim_create_autocmd('FileType', {
  pattern = { 'markdown' },
  desc = 'Markdown keybindings',
  callback = function()
    vim.keymap.set('n', '<localleader>mp', ':MarkdownPreview<CR>', { desc = 'Preview Markdown File' })
    require('which-key').add {
      '<localleader>m',
      group = '[M]arkdown',
    }
  end,
})
