vim.pack.add { 'https://github.com/goolord/alpha-nvim' }

local alpha = require 'alpha'
local dashboard = require 'alpha.themes.dashboard'

local function nvim_version()
  local version = vim.version()
  local nvim_version_info = 'v' .. version.major .. '.' .. version.minor .. '.' .. version.patch

  return nvim_version_info
end

local logo = {
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
  '             neovim ' .. nvim_version(),
}

dashboard.section.header.val = logo
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
dashboard.opts.layout[1].val = 5

alpha.setup(dashboard.opts)
