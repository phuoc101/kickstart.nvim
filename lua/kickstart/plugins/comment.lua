return {
  {
    'nvim-mini/mini.comment',
    version = '*',

    config = function()
      require('mini.comment').setup {
        options = {
          ignore_blank_line = false,
          start_of_line = false,
          pad_comment_parts = true,
        },
        mappings = {
          comment = '<leader>/',
          comment_line = '<leader>/',
          comment_visual = '<leader>/',
          textobject = '<leader>/',
        },
      }
    end,
  },
}
