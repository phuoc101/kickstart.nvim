-- [[ Basic Keymaps ]]
--  See `:help vim.keymap.set()`

-- Set highlight on search, but clear on pressing <Esc> in normal mode
vim.opt.hlsearch = true
-- NORMAL mode mappings
-- Unhighlight search results
vim.keymap.set({ 'n' }, '<Esc>', '<cmd>nohlsearch<CR>')
-- Diagnostic keymaps
vim.keymap.set({ 'n' }, '[d', vim.diagnostic.goto_prev, { desc = 'Go to previous [D]iagnostic message' })
vim.keymap.set({ 'n' }, ']d', vim.diagnostic.goto_next, { desc = 'Go to next [D]iagnostic message' })
-- Resize window with arrows
vim.keymap.set({ 'n' }, '<C-Up>', ':resize -2<CR>', { desc = 'Resize -2 up' })
vim.keymap.set({ 'n' }, '<C-Down>', ':resize +2<CR>', { desc = 'Resize -2 down' })
vim.keymap.set({ 'n' }, '<C-Left>', ':vertical resize -2<CR>', { desc = 'Resize -2 left' })
vim.keymap.set({ 'n' }, '<C-Right>', ':vertical resize +2<CR>', { desc = 'Resize -2 right' })
-- Keybinds to make split navigation easier.
-- Use CTRL+<hjkl> to switch between windows
vim.keymap.set({ 'n' }, '<C-h>', '<C-w><C-h>', { desc = 'Move focus to the left window' })
vim.keymap.set({ 'n' }, '<C-l>', '<C-w><C-l>', { desc = 'Move focus to the right window' })
vim.keymap.set({ 'n' }, '<C-j>', '<C-w><C-j>', { desc = 'Move focus to the lower window' })
vim.keymap.set({ 'n' }, '<C-k>', '<C-w><C-k>', { desc = 'Move focus to the upper window' })
-- Move cursor to end/beginning
vim.keymap.set({ 'n', 'v' }, 'E', '$', { desc = 'Move cursor to end of line' })
vim.keymap.set({ 'n', 'v' }, 'B', '^', { desc = 'Move cursor to beginning of line' })
-- Buffer control
vim.keymap.set({ 'n' }, '<leader>bp', '<cmd>BufferLineTogglePin<cr>', { desc = 'Toggle [B]uffer [P]in' })
vim.keymap.set({ 'n' }, '<leader>bP', '<cmd>BufferLineGroupClose ungrouped<cr>', { desc = 'Delete non-[P]inned [B]uffers' })
vim.keymap.set({ 'n' }, '<leader>bd', '<cmd>bdelete!<cr>', { desc = '[B]uffer [D]elete' })
vim.keymap.set({ 'n' }, 'L', '<cmd>bnext<cr>', { desc = 'Next buffer' })
vim.keymap.set({ 'n' }, 'H', '<cmd>bprevious<cr>', { desc = 'Previous buffer' })
-- Rename symbol
vim.keymap.set({ 'n' }, '<F2>', '<cmd>lua vim.lsp.buf.rename()<cr>', { desc = 'Rename symbol' })
-- .keymap.setToggle diagnostic
vim.keymap.set({ 'n' }, '<leader><leader>', function()
  if not vim.diagnostic.config().virtual_text then
    vim.diagnostic.config { virtual_text = true }
  else
    vim.diagnostic.config { virtual_text = false }
  end
end, { desc = 'Toggle diagnostic' })

-- INSERT mode mappings
vim.keymap.set({ 'i' }, '<C-h>', '<left>', { desc = 'Move left' })
vim.keymap.set({ 'i' }, '<C-j>', '<down>', { desc = 'Move down' })
vim.keymap.set({ 'i' }, '<C-k>', '<up>', { desc = 'Move up' })
vim.keymap.set({ 'i' }, '<C-l>', '<right>', { desc = 'Move right' })

-- VISUAL mode mappings
vim.keymap.set({ 'v' }, 'p', 'P', { desc = 'sane paste option' })
-- Visual line indentation
vim.keymap.set({ 'v' }, '>', '>gv', { desc = 'Indent right in visual mode' })
vim.keymap.set({ 'v' }, '<', '<gv', { desc = 'Indent left in visual mode' })
-- Navigation
vim.keymap.set({ 'v' }, 'j', 'gj', { desc = 'Move down' })
vim.keymap.set({ 'v' }, 'k', 'gk', { desc = 'Move up' })

-- NOTE: This won't work in all terminal emulators/tmux/etc. Try your own mapping
-- or just use <C-\><C-n> to exit terminal mode
vim.keymap.set('t', '<Esc><Esc>', '<C-\\><C-n>', { desc = 'Exit terminal mode' })

-- [[ Basic Autocommands ]]
--  See `:help lua-guide-autocommands`

-- Highlight when yanking (copying) text
--  Try it with `yap` in normal mode
--  See `:help vim.highlight.on_yank()`
vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'Highlight when yanking (copying) text',
  group = vim.api.nvim_create_augroup('kickstart-highlight-yank', { clear = true }),
  callback = function()
    vim.highlight.on_yank()
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
