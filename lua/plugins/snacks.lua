return {
  "folke/snacks.nvim",
  priority = 1000,
  lazy = false,
  ---@type snacks.Config
  opts = {
    -- 1. Configuration du Picker (Taille et Comportement)
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
          backdrop = 60, 
        },
      },
    },
    -- 2. Activation des modules nécessaires
    explorer = { enabled = true },
    words = { enabled = true },
    notifier = { enabled = false },
    scroll = { enabled = true },
    scope = { enabled = true },
    bufdelete = { enabled = true }, -- Nécessaire pour fermer les buffers proprement
    exclude = {"node_modules", ".git", ".cache", "dist"}
  },
  
  -- 3. Raccourcis Clavier (Keymaps)
  keys = {
    -- EXPLORATEUR
    { "<leader>e", function() Snacks.explorer() end, desc = "File Explorer" },
    
    -- BUFFERS (Nouveautés)
    { "<leader>fb", function() Snacks.picker.buffers() end, desc = "Choisir un Buffer" },
    { "<leader>bo", function() Snacks.bufdelete.other() end, desc = "Fermer les autres Buffers (Only)" },

    -- NAVIGATION & RECHERCHE
    --
    { "<leader><space>", function() Snacks.picker.files() end, desc = "Trouver Fichiers" },
    { "<leader>fs", function() Snacks.picker.lsp_symbols() end, desc = "Aller à une Fonction/Symbole" },
    { "<leader>fl", function() Snacks.picker.lines() end, desc = "Chercher une Ligne" },
    { "<leader>fc", function() Snacks.picker.files({ cwd = vim.fn.stdpath("config") }) end, desc = "Config Neovim" },
  },

  -- 4. Personnalisation des Couleurs
  init = function()
    vim.api.nvim_create_autocmd("User", {
      pattern = "VeryLazy",
      callback = function()
        vim.api.nvim_set_hl(0, "SnacksPickerBorder", { fg = "#89b4fa" })
        vim.api.nvim_set_hl(0, "SnacksPickerTitle", { fg = "#fab387", bold = true })
      end,
    })
  end,
}



