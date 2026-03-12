return {
  "folke/snacks.nvim",
  priority = 1001,
  lazy = false,
  ---@type snacks.Config
  opts = {
    -- 1. Configuration de notes
    notifier = {
      enabled = true,
      timeout = 3000,
    },
    -- quickfile = { enabled = true },
    statuscolumn = { enabled = true },
    styles = {
      notification = {
        wo = { wrap = true },
      },
    },
    -- 2. Configuration du Picker (Taille et Comportement)
    picker = {
      enabled = true,
      layout = {
        preset = "default",
        width = 0.8,
        height = 0.8,
      },
      win = {
        input = {
          keys = {
            ["<Esc>"] = { "close", mode = { "n", "i" } },
          },
          backdrop = 80, 
        },
      },
    },
    -- 3. Activation des modules nécessaires
    explorer = { enabled = true },
    words = { enabled = true },
    scroll = { enabled = true },
    scope = { enabled = true },
    bufdelete = { enabled = true }, -- Nécessaire pour fermer les buffers proprement
  },
  
  -- 4. Raccourcis Clavier (Keymaps)
  keys = {
    -- EXPLORATEUR
    { "<leader>e", function() Snacks.explorer() end, desc = "File Explorer" },
    
    -- BUFFERS (Nouveautés)
    { "<leader>fb", function() Snacks.picker.buffers() end, desc = "Choisir un Buffer" },
    { "<leader>bo", function() Snacks.bufdelete.other() end, desc = "Fermer les autres Buffers (Only)" },

    -- NAVIGATION & RECHERCHE
    { "<leader><space>", function() Snacks.picker.files() end, desc = "Trouver Fichiers" },
    { "<leader>ss", function() Snacks.picker.lsp_symbols() end, desc = "Aller à une Fonction/Symbole" },
    { "<leader>sl", function() Snacks.picker.lines() end, desc = "Chercher une Ligne" },
    { "<leader>fc", function() Snacks.picker.files({ cwd = vim.fn.stdpath("config") }) end, desc = "Config Neovim" },
  },

  -- 5. Personnalisation des Couleurs
  init = function()
    vim.api.nvim_create_autocmd("User", {
      pattern = "VeryLazy",
      callback = function()
        vim.api.nvim_set_hl(1, "SnacksPickerBorder", { fg = "#89b4fa" })
        vim.api.nvim_set_hl(1, "SnacksPickerTitle", { fg = "#fab387", bold = true })
      end,
    })
  end,
}


