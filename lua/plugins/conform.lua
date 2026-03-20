-- Optionnel : Pour un formatage automatique (conform.nvim est simple et efficace)
return {
  "stevearc/conform.nvim",
  event = { "BufWritePre" },
  cmd = { "ConformInfo" },
  opts = {
    -- 1. Définition des formateurs par langage
    formatters_by_ft = {
      lua = { "stylua" },
      -- Pour le Web, on essaie d'abord prettierd (plus rapide), sinon prettier
      javascript = { "prettierd", "prettier", stop_after_first = true },
      typescript = { "prettierd", "prettier", stop_after_first = true },
      html = { "prettier" },
      css = { "prettier" },
      typst = { 'tinymist' }, -- Utilise tinymist pour formater les fichiers Typst
      -- Zig possède son propre outil de formatage intégré
      zig = { "zigfmt" },
      -- TypeSpec (fichiers .tsp)
      -- typespec = { "tsp-format" },
    },

    -- 2. Configuration du formatage à la sauvegarde (optionnel mais recommandé)
    -- Si tu préfères garder uniquement ton Ctrl-S manuel, tu peux commenter cette partie
    format_on_save = {
      lsp_fallback = true,
      async = false,
      timeout_ms = 500,
    },

    -- 3. Notification en cas d'erreur
    notify_on_error = true,
  },
}
