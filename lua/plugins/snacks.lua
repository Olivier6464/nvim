return {
  'folke/snacks.nvim',
  priority = 1000, -- On lui donne une priorité maximale
  lazy = false,
  opts = {
    --     dashboard = {
    --       enabled = true,
    --       -- Cette option permet au dashboard de savoir s'il doit s'afficher
    --       -- On lui dit de ne pas s'ouvrir si des arguments (comme un dossier) sont passés
    --       example = false,
    --       sections = {
    --         { section = 'header' },
    --         { section = 'keys', gap = 0, padding = 0 },
    --         { section = 'startup' },
    --       },
    --       preset = {
    --         header = [[
    --   ____     _       ___  __     __  ___     _____    _____
    --  / __ \   | |     |_ _| \ \   / / |_ _|   |  ___|  |  __ \
    -- | |  | |  | |      | |   \ \ / /   | |    | |__    | |__) |
    -- | |  | |  | |      | |    \ v /    | |    |  __|   |  _  /
    -- | |__| |  | |__   _| |_    \ /    _| |_   | |___   | | \ \
    --  \____/   |____|  |___|     v     |___|   |_____|  |_|  \_\
    -- ]],
    --         keys = {
    --           { icon = ' ', key = 'f', desc = 'Find File', action = ":lua Snacks.dashboard.pick('files')" },
    --           { icon = ' ', key = 'n', desc = 'New File', action = ':ene | startinsert' },
    --           { icon = ' ', key = 'g', desc = 'Find Text', action = ":lua Snacks.dashboard.pick('live_grep')" },
    --           { icon = ' ', key = 'r', desc = 'Recent Files', action = ":lua Snacks.dashboard.pick('oldfiles')" },
    --           { icon = ' ', key = 'c', desc = 'Config', action = ":lua Snacks.dashboard.pick('files', {cwd = vim.fn.stdpath('config')})" },
    --           { icon = ' ', key = 's', desc = 'Restore Session', section = 'session' },
    --           { icon = '󰒲 ', key = 'L', desc = 'Lazy', action = ':Lazy', enabled = package.loaded.lazy ~= nil },
    --           { icon = ' ', key = 'q', desc = 'Quit', action = ':qa' },
    --         },
    --       },
    --     },
    statuscolumn = { enabled = true },
    words = { enabled = false },
    notifier = { enabled = false },
    scroll = { enabled = true },
    scope = { enabled = true },
    bufdelete = { enabled = true },
    explorer = {
      enabled = true, -- On réactive le module
      replace_netrw = true, -- Optionnel : pour que :Ex ouvre Snacks
    },
    picker = {
      sources = {
        explorer = { enabled = true }, -- On réactive la source pour le picker
      },
    },
  },
  keys = {
    {
      '<leader>e',
      function()
        -- On appelle l'explorer de Snacks avec l'option toggle
        Snacks.explorer({
          replace_netrw = true, -- Remplace l'explorateur par défaut
          toggle = true, -- Si déjà ouvert, il se ferme au lieu d'en ouvrir un autre
        })
      end,
      desc = 'Explorer Snacks',
    },
    -- {
    --   '<leader>e',
    --   function()
    --     -- On utilise directement la fonction explorer de Snacks
    --     -- Par défaut, Snacks.explorer() ouvre le sélecteur de fichiers
    --     -- Si tu veux l'explorateur de style "Sidebar", utilise :
    --     Snacks.explorer({
    --       -- Cette option force la fermeture si déjà ouvert (comportement toggle)
    --       toggle = true,
    --       -- Optionnel : force le nettoyage de netrw automatiquement
    --       replace_netrw = true,
    --     })
    --   end,
    --   desc = 'Explorer Snacks (Toggle)',
    -- },
    -- {
    --   '<leader>e',
    --   function()
    --     -- On ferme netrw si on est dessus
    --     if vim.bo.filetype == 'netrw' then
    --       vim.cmd('bwipeout')
    --     end
    --
    --     -- Snacks.explorer() agit généralement comme un sélecteur/explorateur unique
    --     -- Si tu veux éviter les ouvertures multiples, utilise cette syntaxe :
    --     Snacks.explorer.reveal()
    --   end,
    --   desc = 'Fichiers du projet',
    -- },
    {
      '<leader>fg',
      function()
        Snacks.picker.files()
      end,
      desc = 'Trouver Fichiers',
    },
    {
      '<leader>fb',
      function()
        Snacks.picker.buffers()
      end,
      desc = 'Buffers',
    },

    -- 2. "Buffer Only" : Ferme tous les buffers sauf celui qui est ouvert
    {
      '<leader>bo',
      function()
        Snacks.bufdelete.other()
      end,
      desc = 'Delete Other Buffers',
    },

    -- Bonus : fermer le buffer actuel proprement sans casser ton layout de fenêtres
    {
      '<leader>bd',
      function()
        Snacks.bufdelete()
      end,
      desc = 'Delete Buffer',
    },
    {
      '<leader>fc',
      function()
        Snacks.picker.files({ cwd = vim.fn.stdpath('config') })
      end,
      desc = 'Find Config Files',
    },

    -- 4. Personnalisation des Couleurs

    -- BONUS : Si tu veux rechercher un mot dans TOUT le projet (Grep)
    {
      '<leader>fw',
      function()
        Snacks.picker.grep()
      end,
      desc = 'Find Word in Project',
    },

    -- BONUS : Pour reprendre la dernière recherche si tu as fermé la fenêtre trop vite
    {
      '<leader>fo',
      function()
        Snacks.picker.resume()
      end,
      desc = 'find oldfiles',
    },

    -- Navigation LSP : Aller à la définition (Goto Definition)
    {
      '<leader>gd',
      function()
        Snacks.picker.lsp_definitions()
      end,
      desc = 'Aller Définition',
    },

    -- Navigation LSP : Aller aux références (souvent utile avec la définition)
    {
      '<leader>gr',
      function()
        Snacks.picker.lsp_references()
      end,
      desc = 'Aller Réferences',
      nowait = true,
    },

    -- Recherche de symboles (alternative à "find line" mais plus intelligent)
    {
      '<leader>gs',
      function()
        Snacks.picker.lsp_symbols()
      end,
      desc = 'Aller Symbols',
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
  },
}
