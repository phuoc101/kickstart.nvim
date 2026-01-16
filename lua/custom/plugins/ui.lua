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
        '                                         ',
        '           I use Neovim (BTW)           ',
      }
      dashboard.section.buttons.val = {
        dashboard.button('f', ' ' .. ' Find file', ':FzfLua files<CR>'),
        dashboard.button('n', ' ' .. ' New file', ':ene <BAR> startinsert <CR>'),
        dashboard.button('r', ' ' .. ' Recent files', ':Telescope oldfiles <CR>'),
        dashboard.button('t', ' ' .. ' Find text', ':FzfLua grep<CR>'),
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
    config = function()
      local bufferline = require 'bufferline'
      bufferline.setup {
        options = {
          style_preset = bufferline.style_preset.minimal,
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
    end,
  },
  -- NOTE: Status line
  {
    'nvim-lualine/lualine.nvim',
    event = 'BufEnter',
    opts = function()
      local theme_colors = require 'lualine.themes.nordfox'
      theme_colors.visual.a.bg = '#c678dd'
      theme_colors.normal.c.bg = '#2e3440'

      local function get_lsp()
        local msg = ''
        local buf_ft = vim.api.nvim_buf_get_option(0, 'filetype')
        local clients = vim.lsp.get_clients()
        if next(clients) == nil then
          return msg
        end
        for _, client in ipairs(clients) do
          local filetypes = client.config.filetypes
          if filetypes and vim.fn.index(filetypes, buf_ft) ~= -1 then
            return ' ' .. client.name
          end
        end
        return msg
      end

      local function get_formatter()
        -- Check if 'conform' is available
        local status, conform = pcall(require, 'conform')
        if not status then
          return 'Conform not installed'
        end

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

        if not vim.tbl_isempty(lsp_clients) then
          return '󰷈 LSP Formatter'
        end

        return ''
      end

      return {
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
      local neoscroll = require 'neoscroll'
      local keymap = {
        -- Use the "sine" easing function
        ['<C-u>'] = function()
          neoscroll.ctrl_u { duration = 250, easing = 'sine' }
        end,
        ['<C-d>'] = function()
          neoscroll.ctrl_d { duration = 250, easing = 'sine' }
        end,
        -- Use the "circular" easing function
        ['<C-b>'] = function()
          neoscroll.ctrl_b { duration = 450, easing = 'circular' }
        end,
        ['<C-f>'] = function()
          neoscroll.ctrl_f { duration = 450, easing = 'circular' }
        end,
        -- When no value is passed the `easing` option supplied in `setup()` is used
        ['<C-y>'] = function()
          neoscroll.scroll(-0.1, { move_cursor = false, duration = 100 })
        end,
        ['<C-e>'] = function()
          neoscroll.scroll(0.1, { move_cursor = false, duration = 100 })
        end,
      }
      local modes = { 'n', 'v', 'x' }
      for key, func in pairs(keymap) do
        vim.keymap.set(modes, key, func)
      end
    end,
  },
  {
    'folke/snacks.nvim',
    priority = 1000,
    lazy = false,
    ---@type snacks.Config
    opts = {
      -- your configuration comes here
      -- or leave it empty to use the default settings
      -- refer to the configuration section below
      input = {
        enabled = true,
        backdrop = false,
        position = 'float',
        border = true,
        title_pos = 'center',
        height = 1,
        width = 60,
        relative = 'editor',
        noautocmd = true,
        row = 2,
        wo = {
          winhighlight = 'NormalFloat:SnacksInputNormal,FloatBorder:SnacksInputBorder,FloatTitle:SnacksInputTitle',
          cursorline = false,
        },
        bo = {
          filetype = 'snacks_input',
          buftype = 'prompt',
        },
        b = {
          completion = false, -- disable blink completions in input
        },
        keys = {
          n_esc = { '<esc>', { 'cmp_close', 'cancel' }, mode = 'n', expr = true },
          i_esc = { '<esc>', { 'cmp_close', 'stopinsert' }, mode = 'i', expr = true },
          i_cr = { '<cr>', { 'cmp_accept', 'confirm' }, mode = { 'i', 'n' }, expr = true },
          i_tab = { '<tab>', { 'cmp_select_next', 'cmp' }, mode = 'i', expr = true },
          i_ctrl_w = { '<c-w>', '<c-s-w>', mode = 'i', expr = true },
          i_up = { '<up>', { 'hist_up' }, mode = { 'i', 'n' } },
          i_down = { '<down>', { 'hist_down' }, mode = { 'i', 'n' } },
          q = 'cancel',
        },
      },
    },
  },
}
