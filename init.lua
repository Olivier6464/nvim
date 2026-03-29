vim.g.mapleader = ' '
require('config.lazy')

require('config.options')
require('config.autocmds')
require('config.keymaps')
require('config.snippets')
-- vim.cmd("colorscheme vision")
-- text under line
--  vim.diagnostic.config({
--     virtual_text = false,
--     virtual_lines = true,
-- })
-- local diagnostics_active = true

vim.diagnostic.config({
  virtual_text = false, -- On désactive le texte à droite
  -- Utiliser une table pour virtual_lines permet de mieux contrôler le rendu
  virtual_lines = {
    only_current_line = true, -- FORTEMENT RECOMMANDÉ pour la performance
    highlight = 'DiagnosticVirtualLines',
  },
  update_in_insert = false, -- NE PAS mettre à true (cause d'énormes lenteurs)
  severity_sort = true,
})
