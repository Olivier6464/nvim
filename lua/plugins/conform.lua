  -- Optionnel : Pour un formatage automatique (conform.nvim est simple et efficace)
 return {
    "stevearc/conform.nvim",
    opts = {
      formatters_by_ft = {
        typst = { "tinymist" },  -- Utilise tinymist pour formater les fichiers Typst
      },
      format_on_save = {
        timeout_ms = 500,
        lsp_fallback = true,  -- Tombe back sur LSP si le formateur externe échoue
      },
    },
  },
