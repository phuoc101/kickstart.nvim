return {
  {
    'L3MON4D3/LuaSnip',
    config = function()
      require('luasnip.loaders.from_vscode').load { paths = './lua/snips/cpp' }
      require('luasnip.loaders.from_vscode').load { paths = './lua/snips/python' }
      require('luasnip.loaders.from_vscode').load { paths = './lua/snips/launch' }
      require('luasnip.loaders.from_vscode').load { paths = './lua/snips/tex' }
      require('luasnip.loaders.from_vscode').load { paths = './lua/snips/shell' }
      require('luasnip.loaders.from_vscode').load { paths = './lua/snips/markdown' }
    end,
  },
}
