return {
  'folke/snacks.nvim',
  priority = 1000,
  lazy = false,
  opts = {
    dashboard = {
      width = 60,
      row = nil, -- dashboard position. nil for center
      col = nil, -- dashboard position. nil for center
      pane_gap = 4, -- empty columns between vertical panes
      autokeys = '1234567890abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ', -- autokey sequence
      -- These settings are used by some built-in sections
      preset = {
        -- Defaults to a picker that supports `fzf-lua`, `telescope.nvim` and `mini.pick`
        ---@type fun(cmd:string, opts:table)|nil
        pick = nil,
        -- Used by the `keys` section to show keymaps.
        -- Set your custom keymaps here.
        -- When using a function, the `items` argument are the default keymaps.
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
        -- Used by the `header` section
        header = [[
  ____     _       ___  __     __  ___    _____   _____  
 / __ \   | |     |_ _| \ \   / / |_ _|  |  ___| |  __ \ 
| |  | |  | |      | |   \ \ / /   | |   | |__   | |__) |
| |  | |  | |      | |    \ v /    | |   |  __|  |  _  / 
| |__| |  | |__   _| |_    \ /    _| |_  | |___  | | \ \ 
 \____/   |____|  |___|     v     |___|  |_____| |_|  \_\
]],
      },
      formats = {
        icon = function(item)
          if item.file and item.icon == 'file' or item.icon == 'directory' then
            return Snacks.dashboard.icon(item.file, item.icon)
          end
          return { item.icon, width = 2, hl = 'icon' }
        end,
        footer = { '%s', align = 'center' },
        header = { '%s', align = 'center' },
        file = function(item, ctx)
          local fname = vim.fn.fnamemodify(item.file, ':~')
          fname = ctx.width and #fname > ctx.width and vim.fn.pathshorten(fname) or fname
          if #fname > ctx.width then
            local dir = vim.fn.fnamemodify(fname, ':h')
            local file = vim.fn.fnamemodify(fname, ':t')
            if dir and file then
              file = file:sub(-(ctx.width - #dir - 2))
              fname = dir .. '/…' .. file
            end
          end
          local dir, file = fname:match('^(.*)/(.+)$')
          return dir and { { dir .. '/', hl = 'dir' }, { file, hl = 'file' } } or { { fname, hl = 'file' } }
        end,
      },
      sections = {
        { section = 'header' },
        { section = 'keys', gap = 0, padding = 0 },
        { section = 'startup' },
      },
    },
    -- 1. Configuration du Picker (Taille et Comportement)
    picker = {
      enabled = true,
      layout = {
        preset = 'default',
        width = 0.8,
        height = 0.8,
      },
      win = {
        input = {
          keys = {
            ['<Esc>'] = { 'close', mode = { 'n', 'i' } },
          },
          backdrop = 60,
        },
      },
    },
    -- 2. Activation des modules nécessaires
    explorer = { enabled = true },
    words = { enabled = false },
    notifier = { enabled = false },
    scroll = { enabled = true },
    scope = { enabled = true },
    bufdelete = { enabled = true }, -- Nécessaire pour fermer les buffers proprement
    exclude = { 'node_modules', '.git', '.cache', 'dist' },
  },

  -- 3. Raccourcis Clavier (Keymaps)
  keys = {
    -- EXPLORATEUR
    {
      '<leader>e',
      function()
        Snacks.explorer()
      end,
      desc = 'File Explorer',
    },

    -- BUFFERS (Nouveautés)
    {
      '<leader>fb',
      function()
        Snacks.picker.buffers()
      end,
      desc = 'Choisir un Buffer',
    },
    {
      '<leader>bo',
      function()
        Snacks.bufdelete.other()
      end,
      desc = 'Fermer les autres Buffers (Only)',
    },

    -- NAVIGATION & RECHERCHE
    --
    {
      '<leader><space>',
      function()
        Snacks.picker.files()
      end,
      desc = 'Trouver Fichiers',
    },
    {
      '<leader>fs',
      function()
        Snacks.picker.lsp_symbols()
      end,
      desc = 'Aller à une Fonction/Symbole',
    },
    {
      '<leader>fl',
      function()
        Snacks.picker.lines()
      end,
      desc = 'Chercher une Ligne',
    },
    {
      '<leader>fc',
      function()
        Snacks.picker.files({ cwd = vim.fn.stdpath('config') })
      end,
      desc = 'Config Neovim',
    },
  },

  -- 4. Personnalisation des Couleurs
  init = function()
    vim.api.nvim_create_autocmd('User', {
      pattern = 'VeryLazy',
      callback = function()
        vim.api.nvim_set_hl(0, 'SnacksPickerBorder', { fg = '#89b4fa' })
        vim.api.nvim_set_hl(0, 'SnacksPickerTitle', { fg = '#fab387', bold = true })
      end,
    })
  end,
}
