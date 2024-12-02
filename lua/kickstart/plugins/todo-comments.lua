-- Highlight todo, notes, etc in comments
-- TODO: test
return {
  {
    'folke/todo-comments.nvim',
    event = 'VimEnter',
    dependencies = { 'nvim-lua/plenary.nvim' },
    opts = {
      signs = true,
      keywords = {
        TODO = { icon = ' ', color = '#5BF0E8' },
      },
    },
  },
}
-- vim: ts=2 sts=2 sw=2 et
