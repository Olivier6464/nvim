return {
  'HiPhish/rainbow-delimiters.nvim',
  config = function()
    require('rainbow-delimiters.setup').setup({
      rainbow = {
        enable = true,
        -- list of languages you want to disable the plugin for
        disable = { 'jsx', 'cpp' },
        -- Which query to use for finding delimiters
        -- Highlight the entire buffer all at once
        strategy = {
          [''] = 'rainbow-delimiters.strategy.global',
          commonlisp = 'rainbow-delimiters.strategy.local',
        },
        query = {
          [''] = 'rainbow-delimiters',
          latex = 'rainbow-blocks',
        },
        highlight = {
          'RainbowDelimiterRed',
          'RainbowDelimiterYellow',
          'RainbowDelimiterBlue',
          'RainbowDelimiterOrange',
          'RainbowDelimiterGreen',
          'RainbowDelimiterViolet',
          'RainbowDelimiterCyan',
        },
        blacklist = { 'c', 'cpp' },
      },
    })
  end,
}
