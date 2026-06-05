local icons = {
  symbol = '',
  diagnostics = {
    error = ' ',
    warn = ' ',
    info = ' ',
    hint = ' ',
  },
  git = {
    added = ' ',
    modified = ' ',
    removed = ' ',
  },
  system = {
    unix = 'UNIX ', -- e712
    dos = 'WIN ', -- e70f
    mac = 'MAC ', -- e711
  },
  file = {
    modified = ' ●', -- Text to show when the buffer is modified
    directory = '', -- Text to show when the buffer is a directory
    alternate_file = '', -- Text to show to identify the alternate file
    readonly = '', -- Text to show when the file is non-modifiable or readonly.
    unnamed = '[No Name]', -- Text to show for unnamed buffers.
    newfile = '[New]', -- Text to show for newly created file before first write
  },
}

-- statusline
vim.pack.add { 'https://github.com/nvim-lualine/lualine.nvim' }
local theme_colors = require 'lualine.themes.nordfox'
theme_colors.visual.a.bg = '#c678dd'
theme_colors.normal.c.bg = '#2e3440'
local function get_lsp()
  local msg = ''
  local buf_ft = vim.api.nvim_get_option_value(0, 'filetype')
  local clients = vim.lsp.get_clients()
  if next(clients) == nil then return msg end
  for _, client in ipairs(clients) do
    local filetypes = client.config.filetypes
    if filetypes and vim.fn.index(filetypes, buf_ft) ~= -1 then return ' ' .. client.name end
  end
  return msg
end

local function get_formatter()
  -- Check if 'conform' is available
  local status, conform = pcall(require, 'conform')
  if not status then return 'Conform not installed' end

  local lsp_format = require 'conform.lsp_format'

  -- Get formatters for the current buffer
  local formatters = conform.list_formatters_for_buffer()
  if formatters and #formatters > 0 then
    local formatterNames = {}

    for _, formatter in ipairs(formatters) do
      table.insert(formatterNames, formatter)
    end

    return '󰷈 ' .. table.concat(formatterNames, ' ')
  end

  -- Check if there's an LSP formatter
  local bufnr = vim.api.nvim_get_current_buf()
  local lsp_clients = lsp_format.get_format_clients { bufnr = bufnr }

  if not vim.tbl_isempty(lsp_clients) then return '󰷈 LSP Formatter' end

  return ''
end

require('lualine').setup {

  options = {
    theme = theme_colors,
    globalstatus = true,
    disabled_filetypes = { statusline = { 'dashboard', 'lazy', 'alpha' } },
    component_separators = { left = '', right = '' },
    section_separators = { left = '', right = '' },
  },
  sections = {
    lualine_a = {
      {
        function()
          local curr_mode = {
            n = 'N',
            i = 'I',
            v = 'V',
            [''] = 'VB',
            V = 'VL',
            c = 'C',
          }
          return icons.symbol .. ' ' .. curr_mode[vim.fn.mode()]
        end,
        padding = { left = 1, right = 1 },
        separator = { left = '', right = '' },
        color = function()
          -- auto change color according to neovims mode
          local mode_color = {
            n = theme_colors.normal.a.bg,
            i = theme_colors.insert.a.bg,
            v = theme_colors.visual.a.bg,
            [''] = theme_colors.visual.a.bg,
            V = theme_colors.visual.a.bg,
            c = theme_colors.command.a.bg,
          }
          return { fg = mode_color[vim.fn.mode()], bg = theme_colors.normal.c.bg, gui = 'bold' }
        end,
      },
    },
    lualine_b = {
      {
        'filetype',
        colored = true, -- Displays filetype icon in color if set to true
        icon_only = true, -- Display only an icon for filetype
        icon = { align = 'right' }, -- Display filetype icon on the right hand side
        separator = '',
        padding = { left = 1, right = 0 },
        color = { bg = theme_colors.normal.c.bg },
      },
      {
        'filename',
        file_status = true, -- Displays file status (readonly status, modified status)
        newfile_status = false, -- Display new file status (new file means no write after created)
        path = 1, -- 0: Just the filename
        -- 1: Relative path
        -- 2: Absolute path
        -- 3: Absolute path, with tilde as the home directory
        -- 4: Filename and parent dir, with tilde as the home directory

        shorting_target = 40, -- Shortens path to leave 40 spaces in the window
        -- for other components. (terrible name, any suggestions?)
        symbols = {
          modified = icons.file.modified, -- Text to show when the buffer is modified
          directory = icons.file.directory, -- Text to show when the buffer is a directory
          alternate_file = icons.file.alternate_file, -- Text to show to identify the alternate file
          readonly = icons.file.readonly, -- Text to show when the file is non-modifiable or readonly.
          unnamed = icons.file.unnamed, -- Text to show for unnamed buffers.
          newfile = icons.file.newfile, -- Text to show for newly created file before first write
        },
        color = { bg = theme_colors.normal.c.bg },
      },
    },
    lualine_c = {},
    lualine_x = {
      {
        'diagnostics',
        symbols = {
          error = icons.diagnostics.error,
          warn = icons.diagnostics.warn,
          info = icons.diagnostics.info,
          hint = icons.diagnostics.hint,
        },
        color = { bg = theme_colors.normal.c.bg },
      },
      {
        'diff',
        symbols = {
          added = icons.git.added,
          modified = icons.git.modified,
          removed = icons.git.removed,
        },
        color = { bg = theme_colors.normal.c.bg },
      },
      { 'branch', color = { bg = theme_colors.normal.c.bg } },
    },
    lualine_y = {
      { 'progress', separator = ' ', padding = { left = 1, right = 0 }, color = { bg = theme_colors.normal.c.bg } },
      { 'location', padding = { left = 0, right = 1 }, color = { bg = theme_colors.normal.c.bg } },
      { 'searchcount', color = { fg = '#ff9e64', bg = theme_colors.normal.c.bg } },
    },
    lualine_z = {
      {
        get_lsp,
        color = { bg = theme_colors.normal.c.bg, fg = '#b48ead', gui = 'bold' },
      },
      {
        get_formatter,
        color = { bg = theme_colors.normal.c.bg, fg = '#b48ead', gui = 'bold' },
      },
      {
        'fileformat',
        symbols = {
          unix = icons.system.unix, -- e712
          dos = icons.system.dos, -- e70f
          mac = icons.system.mac, -- e711
        },
        fmt = string.upper,
        icons_enabled = true,
        separator = { left = '', right = '' },
        color = function()
          -- auto change color according to neovims mode
          local mode_color = {
            n = theme_colors.normal.a.bg,
            i = theme_colors.insert.a.bg,
            v = theme_colors.visual.a.bg,
            [''] = theme_colors.visual.a.bg,
            V = theme_colors.visual.a.bg,
            c = theme_colors.command.a.bg,
          }
          return { fg = mode_color[vim.fn.mode()], bg = theme_colors.normal.c.bg, gui = 'bold' }
        end,
      },
    },
  },
  extensions = { 'neo-tree' },
}
