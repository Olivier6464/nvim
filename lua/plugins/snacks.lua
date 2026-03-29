return {
  'folke/snacks.nvim',
  priority = 1000,
  lazy = false,
  opts = {
    dashboard = {
      enabled = true,
      -- Cette option permet au dashboard de savoir s'il doit s'afficher
      -- On lui dit de ne pas s'ouvrir si des arguments (comme un dossier) sont passés
      example = false,
      sections = {
        { section = 'header' },
        { section = 'keys', gap = 0, padding = 0 },
        { section = 'startup' },
      },
      preset = {
        header = [[
  ____     _       ___  __     __  ___     _____    _____  
 / __ \   | |     |_ _| \ \   / / |_ _|   |  ___|  |  __ \ 
| |  | |  | |      | |   \ \ / /   | |    | |__    | |__) |
| |  | |  | |      | |    \ v /    | |    |  __|   |  _  / 
| |__| |  | |__   _| |_    \ /    _| |_   | |___   | | \ \ 
 \____/   |____|  |___|     v     |___|   |_____|  |_|  \_\
]],
        keys = {
          { icon = ' ', key = 'f', desc = 'Find File', action = ":lua Snacks.dashboard.pick('files')" },
          { icon = ' ', key = 'n', desc = 'New File', action = ':ene | startinsert' },
          { icon = ' ', key = 'g', desc = 'Find Text', action = ":lua Snacks.dashboard.pick('live_grep')" },
          { icon = ' ', key = 'r', desc = 'Recent Files', action = ":lua Snacks.dashboard.pick('oldfiles')" },
          { icon = ' ', key = 'c', desc = 'Config', action = ":lua Snacks.dashboard.pick('files', {cwd = vim.fn.stdpath('config')})" },
          { icon = ' ', key = 's', desc = 'Restore Session', section = 'session' },
          { icon = '󰒲 ', key = 'L', desc = 'Lazy', action = ':Lazy', enabled = package.loaded.lazy ~= nil },
          { icon = ' ', key = 'q', desc = 'Quit', action = ':qa' },
        },
      },
    },
    explorer = {
      enabled = true,
      replace_netrw = true,
    },
    picker = { enabled = true },
    statuscolumn = { enabled = true },
    words = { enabled = false },
    notifier = { enabled = false },
    scroll = { enabled = true },
    scope = { enabled = true },
    bufdelete = { enabled = true },
  },
  keys = {
    {
      '<leader>e',
      function()
        Snacks.explorer()
      end,
      desc = 'File Explorer',
    },
    {
      '<leader><space>',
      function()
        Snacks.picker.files()
      end,
      desc = 'Trouver Fichiers',
    },
  },
  init = function()
    -- On ne garde que la partie cosmétique ici
    vim.api.nvim_create_autocmd('User', {
      pattern = 'VeryLazy',
      callback = function()
        vim.api.nvim_set_hl(0, 'SnacksPickerBorder', { fg = '#89b4fa' })
        vim.api.nvim_set_hl(0, 'SnacksPickerTitle', { fg = '#fab387', bold = true })
      end,
    })
  end,
}
