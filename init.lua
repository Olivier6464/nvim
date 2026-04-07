<<<<<<< HEAD
-- Désactive Netrw de force au démarrage
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- Supprime les commandes liées à Netrw s'il tente de se charger
vim.api.nvim_create_autocmd('VimEnter', {
  callback = function()
    vim.cmd('silent! command! -nargs=* -complete=dir Explore') -- Désactive :Explore
    vim.cmd('silent! autocmd! FileExplorer *') -- Supprime l'autocommande native
  end,
})
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '
require('config.options')
require('config.keymaps')
require('config.autocmds')
require('config.snippets')
local lazypath = vim.fn.stdpath('data') .. '/lazy/lazy.nvim'

-- Si le dossier n'existe pas, on clone le dépôt
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local out = vim.fn.system({
    'git',
    'clone',
    '--filter=blob:none',
    '--branch=stable',
    'https://github.com/folke/lazy.nvim.git',
    lazypath,
  })
  if vim.v.shell_error ~= 0 then
    vim.api.nvim_echo({
      { 'Erreur lors du clonage de lazy.nvim :\n', 'ErrorMsg' },
      { out, 'WarningMsg' },
      { '\nAppuyez sur une touche pour quitter...', 'None' },
    }, true, {})
    vim.fn.getchar()
    os.exit(1)
  end
end

-- On ajoute lazy au runtime path de Neovim
vim.opt.rtp:prepend(lazypath)

-- MAINTENANT on peut appeler lazy
-- On ajoute lazy au runtime path de Neovim
vim.opt.rtp:prepend(lazypath)

-- Configuration de Lazy
require('lazy').setup({
  spec = {
    -- 1. IMPÉRATIF : Charger les plugins de base de LazyVim en premier
    { 'LazyVim/LazyVim', import = 'lazyvim.plugins' },

    -- 2. OPTIONNEL : Charger les extras de LazyVim ici (ex: langages, outils)
    -- { import = "lazyvim.plugins.extras.lang.typescript" },
    -- { import = "lazyvim.plugins.extras.formatting.prettier" },

    -- 3. ENFIN : Charger vos propres modifications depuis le dossier /lua/plugins
    { import = 'plugins' },
  },
  defaults = {
    -- Cela permet à vos plugins perso de prendre le dessus sur ceux de LazyVim
    lazy = false,
    version = false,
  },
  install = { colorscheme = { 'tokyonight', 'habamax' } },
  checker = { enabled = true }, -- vérifie les mises à jour automatiquement
})
=======
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
>>>>>>> c2eabd9e60c67afe69410cb6e0cf826ebeae118a
