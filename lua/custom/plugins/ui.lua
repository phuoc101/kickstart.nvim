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

return {
  -- NOTE: Dashboard
  {
    'goolord/alpha-nvim',
    event = 'VimEnter',
    opts = function()
      local dashboard = require 'alpha.themes.dashboard'
      dashboard.section.header.val = {
        '⢠⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀',
        '⠀⢣⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⠎',
        '⠀⠈⢷⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⡴⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣠⠋⠀',
        '⠀⠀⠘⣷⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢠⣧⣾⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣴⠃⠀⠀',
        '⠀⠀⠀⠸⣿⡄⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⣴⣾⣿⢟⣦⡀⠀⠀⠀⢀⠀⠀⠀⠀⠀⠀⠀⠀⢀⡾⠁⠀⠀⠀',
        '⠀⠀⠀⠀⢹⣿⣄⠀⠀⠀⠀⣶⠀⠀⣼⢰⣿⣿⡟⣵⡿⣿⣷⣄⠀⠀⢸⠃⠀⢀⠆⠀⠀⠀⣰⡟⠁⠀⠀⠀⠀',
        '⠀⠀⠀⠀⠀⢻⣿⣆⠀⠀⠀⣿⡄⣸⣿⣼⣿⡟⣼⠁⡉⠙⣿⣿⡆⣀⣼⠀⠀⡾⠀⠀⢀⣼⡟⠀⠀⠀⠀⠀⠀',
        '⠀⠀⠀⠀⠀⠈⢿⣿⣆⣀⠀⠿⣷⣿⣿⣿⣿⣿⣿⣿⣿⠛⠿⣿⣿⣿⡏⢸⡆⢃⣀⣠⣾⠏⠀⠀⠀⠀⠀⠀⠀',
        '⠀⠀⠀⠀⠀⠀⠘⣿⣿⣷⣤⣄⡀⠉⠹⢿⣎⣿⣿⣿⣿⠀⠀⠈⡿⠃⢡⣼⣿⣿⠿⠛⠉ ⠀⠀⠀⠀⠀⠀⠀',
        '⠀⠀⠀⠀⠀⠀⠀⠘⠻⢿⣿⣿⣿⣳⣮⣜⣿⣿⣿⣿⣿⠀⠀⢠⡇⠀⣿⠛⡛⠀⠀⠀⠀⠀ ⠀⠀⠀⠀⠀⠀',
        '⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢈⡿⢿⣇⣿⣿⣿⣿⣿⣿⣿⠀⠀⢸⠁⠀⠏⢐⣁⣤⡶⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀',
        '⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢿⡄⣹⣿⣿⣿⣿⣿⣿⣿⠀⠀⣼⠀⢀⣶⡿⠻⡿⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀',
        '⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠘⣿⡋⠀⠻⣯⣙⢿⣿⣿⠀⠀⡧⣀⣿⣿⣿⡦⠃⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀',
        '⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠸⣿⡄⡀⠘⣯⣿⢮⣻⣀⢾⡙⢻⣿⣿⡿⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀',
        '⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠸⣿⣻⢳⣿⢏⣾⣟⣓⢘⣿⡾⢫⢰⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀',
        '⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠘⠿⣼⠿⣿⣿⣇⠀⠘⠁⢇⡛⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀',
        '⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⠃⠈⠹⣿⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀',
        '⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠙⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀',
        '            I use Neovim (BTW)           ',
      }
      dashboard.section.buttons.val = {
        dashboard.button('f', ' ' .. ' Find file', ':Files<CR>'),
        dashboard.button('n', ' ' .. ' New file', ':ene <BAR> startinsert <CR>'),
        dashboard.button('r', ' ' .. ' Recent files', ':Telescope oldfiles <CR>'),
        dashboard.button('t', ' ' .. ' Find text', ':Rg<CR>'),
        dashboard.button('l', '󰒲 ' .. ' Lazy', ':Lazy<CR>'),
        dashboard.button('q', ' ' .. ' Quit', ':qa<CR>'),
      }
      for _, button in ipairs(dashboard.section.buttons.val) do
        button.opts.hl = 'AlphaButtons'
        button.opts.hl_shortcut = 'AlphaShortcut'
      end
      dashboard.section.header.opts.hl = 'AlphaHeader'
      dashboard.section.buttons.opts.hl = 'AlphaButtons'
      dashboard.section.footer.opts.hl = 'AlphaFooter'
      dashboard.opts.layout[1].val = 8
      return dashboard
    end,

    config = function(_, dashboard)
      require('alpha').setup(dashboard.opts)
    end,
  },
  -- NOTE: Bufferline
  {
    'akinsho/bufferline.nvim',
    version = '*',
    dependencies = 'nvim-tree/nvim-web-devicons',
    opts = {
      options = {
        diagnostics = 'nvim_lsp',
        always_show_bufferline = true,
        indicator = {
          icon = '▎', -- this should be omitted if indicator style is not 'icon'
          style = 'icon',
        },
        separator_style = 'thin',
        diagnostics_indicator = function(_, _, diag)
          local ret = (diag.error and icons.diagnostics.error .. diag.error .. ' ' or '') .. (diag.warning and icons.diagnostics.warn .. diag.warning or '')
          return vim.trim(ret)
        end,
        offsets = {
          {
            filetype = 'NvimTree',
            text = 'NvimTree',
            highlight = 'Directory',
            text_align = 'left',
          },
        },
      },
    },
  },
  -- NOTE: Status line
  {
    'nvim-lualine/lualine.nvim',
    event = 'BufEnter',
    opts = function()
      local theme_colors = require 'lualine.themes.carbonfox'
      theme_colors.visual.a.bg = '#c678dd'

      local function get_lsp()
        local msg = 'No Active Lsp'
        local buf_ft = vim.api.nvim_buf_get_option(0, 'filetype')
        local clients = vim.lsp.get_active_clients()
        if next(clients) == nil then
          return msg
        end
        for _, client in ipairs(clients) do
          local filetypes = client.config.filetypes
          if filetypes and vim.fn.index(filetypes, buf_ft) ~= -1 then
            return client.name
          end
        end
        return msg
      end

      return {
        options = {
          theme = 'auto',
          globalstatus = true,
          disabled_filetypes = { statusline = { 'dashboard', 'lazy', 'alpha' } },
          component_separators = { left = '', right = '' },
          section_separators = { left = '', right = '' },
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
              separator = { left = '', right = '' },
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
                return { fg = mode_color[vim.fn.mode()], bg = '#282828', gui = 'bold' }
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
              separator = { right = '' },
            },
            -- {
            --   require("noice").api.status.mode.get,
            --   cond = require("noice").api.status.mode.has,
            --   color = { fg = "#ff9e64" },
            -- },
          },
          lualine_c = {
            -- Lsp server name .
          },
          lualine_x = {
            -- stylua: ignore
            {
              "diagnostics",
              symbols = {
                error = icons.diagnostics.error,
                warn = icons.diagnostics.warn,
                info = icons.diagnostics.info,
                hint = icons.diagnostics.hint,
              },
            },
            {
              'diff',
              symbols = {
                added = icons.git.added,
                modified = icons.git.modified,
                removed = icons.git.removed,
              },
            },
            { 'branch' },
          },
          lualine_y = {
            { 'progress', separator = ' ', padding = { left = 1, right = 0 } },
            { 'location', padding = { left = 0, right = 1 } },
            { 'searchcount', color = { fg = '#ff9e64' } },
          },
          lualine_z = {
            {
              get_lsp,
              icon = ' LSP:',
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
              separator = { left = '', right = '' },
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
                return { fg = mode_color[vim.fn.mode()], bg = '#282828', gui = 'bold' }
              end,
            },
          },
        },
        extensions = { 'neo-tree' },
      }
    end,
  },
  -- NOTE: Smooth scrolling

  {
    'karb94/neoscroll.nvim',
    config = function()
      require('neoscroll').setup {
        -- All these keys will be mapped to their corresponding default scrolling animation
        mappings = { '<C-u>', '<C-d>', '<C-b>', '<C-f>' },
        hide_cursor = true, -- Hide cursor while scrolling
        stop_eof = true, -- Stop at <EOF> when scrolling downwards
        respect_scrolloff = false, -- Stop scrolling when the cursor reaches the scrolloff margin of the file
        cursor_scrolls_alone = true, -- The cursor will keep on scrolling even if the window cannot scroll further
        easing_function = nil, -- Default easing function
        pre_hook = nil, -- Function to run before the scrolling animation starts
        post_hook = nil, -- Function to run after the scrolling animation ends
        performance_mode = false, -- Disable "Performance Mode" on all buffers.
      }
      local t = {}
      -- Syntax: t[keys] = {function, {function arguments}}
      t['<C-b>'] = { 'scroll', { '-vim.wo.scroll', 'true', '50' } }
      t['<C-f>'] = { 'scroll', { 'vim.wo.scroll', 'true', '50' } }
      t['<C-u>'] = { 'scroll', { '-vim.api.nvim_win_get_height(0)', 'true', '50' } }
      t['<C-d>'] = { 'scroll', { 'vim.api.nvim_win_get_height(0)', 'true', '50' } }

      require('neoscroll.config').set_mappings(t)
    end,
  },
}
