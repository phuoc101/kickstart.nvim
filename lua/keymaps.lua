do
  vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>')

  -- Diagnostic Config & Keymaps
  vim.diagnostic.config {
    update_in_insert = false,
    severity_sort = true,
    float = { border = 'rounded', source = 'if_many' },
    underline = { severity = { min = vim.diagnostic.severity.WARN } },

    -- Can switch between these as you prefer
    virtual_text = true, -- Text shows up at the end of the line
    virtual_lines = false, -- Text shows up underneath the line, with virtual lines

    -- Auto open the float, so you can easily read the errors when jumping with `[d` and `]d`
    jump = {
      on_jump = function(_, bufnr)
        vim.diagnostic.open_float {
          bufnr = bufnr,
          scope = 'cursor',
          focus = false,
        }
      end,
    },
  }

  vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostic [Q]uickfix list' })

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
end
