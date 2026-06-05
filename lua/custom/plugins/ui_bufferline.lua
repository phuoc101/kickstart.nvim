-- bufferline
vim.pack.add { 'https://github.com/akinsho/bufferline.nvim' }
require('bufferline').setup {
  options = {
    style_preset = require('bufferline').style_preset.minimal,
    themable = true,
    numbers = 'ordinal',
    offsets = {
      {
        filetype = 'NvimTree',
        text = 'NvimTree',
        highlight = 'Directory',
        text_align = 'left',
      },
      diagnostics = 'nvim_lsp',
      always_show_bufferline = true,
      indicator = {
        icon = '▎', -- this should be omitted if indicator style is not 'icon'
        style = 'icon',
      },
      separator_style = 'thick',
      diagnostics_indicator = function(_, _, diag)
        local ret = (diag.error and icons.diagnostics.error .. diag.error .. ' ' or '') .. (diag.warning and icons.diagnostics.warn .. diag.warning or '')
        return vim.trim(ret)
      end,
    },
  },
}
-- Buffer control
vim.keymap.set({ 'n' }, '<leader>bp', '<cmd>BufferLineTogglePin<cr>', { desc = 'Toggle [B]uffer [P]in' })
vim.keymap.set({ 'n' }, '<leader>bP', '<cmd>BufferLineGroupClose ungrouped<cr>', { desc = 'Delete non-[P]inned [B]uffers' })
vim.keymap.set({ 'n' }, '<leader>bd', '<cmd>bdelete!<cr>', { desc = '[B]uffer [D]elete' })
vim.keymap.set({ 'n' }, 'L', '<cmd>bnext<cr>', { desc = 'Next buffer' })
vim.keymap.set({ 'n' }, 'H', '<cmd>bprevious<cr>', { desc = 'Previous buffer' })
