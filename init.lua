require 'core.options' -- Load general options
require 'core.keymaps' -- Load general keymaps
require 'core.snippets' -- Custom code snippets

-- Install package manager
local lazypath = vim.fn.stdpath 'data' .. '/lazy/lazy.nvim'
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system {
    'git',
    'clone',
    '--filter=blob:none',
    'https://github.com/folke/lazy.nvim.git',
    '--branch=stable', -- latest stable release
    lazypath,
  }
end
vim.opt.rtp:prepend(lazypath)

-- Import color theme based on environment variable NVIM_THEME

-- Setup plugin
require('lazy').setup({
  require 'plugins.telescope',
  require 'plugins.treesitter',
  require 'plugins.notify',
  require 'plugins.lsp',
  require 'plugins.autocompletion',
  require 'plugins.none-ls',
  require 'plugins.lualine',
  require 'plugins.floaterm',
  require 'plugins.bufferline',
  require 'plugins.neo-tree',
  require 'plugins.alpha',
  require 'plugins.indent-blankline',
  require 'plugins.lazygit',
  require 'plugins.comment',
  require 'plugins.debug',
  require 'plugins.gitsigns',
  require 'plugins.database',
  require 'plugins.misc',
  require 'plugins.harpoon',
  require 'plugins.emoji',
  require 'plugins.noice',
  require 'plugins.colorbuddy',
  require 'plugins.nord',
  require 'plugins.vision',
  require 'plugins.catppuccin',
  require 'plugins.kanagawa',
  require 'plugins.onedark',
  require 'plugins.eldritch',
  require 'plugins.tokyodark',
  require 'plugins.aurora',
  require 'plugins.adwaita',
  require 'plugins.ayu',
  require 'plugins.vividchalk',
  require 'plugins.flow',
  require 'plugins.vscode',
  require 'plugins.gruvbox',
  require 'plugins.tokyonight',
  require 'plugins.neosolarised',
  require 'plugins.bluloco',
  require 'plugins.dracula',
  require 'plugins.everforest',
  require 'plugins.rose-pine',
  require 'plugins.github-theme',
  require 'plugins.moon-fly-color',
  require 'plugins.modus-themes',
  require 'plugins.cobalt2',
  require 'plugins.sonokai',
  require 'plugins.gruvbox-material',
  require 'plugins.themery',
}, {
  ui = {
    -- If you have a Nerd Font, set icons to an empty table which will use the
    -- default lazy.nvim defined Nerd Font icons otherwise define a unicode icons table
    icons = vim.g.have_nerd_font and {} or {
      cmd = '⌘',
      config = '🛠',
      event = '📅',
      ft = '📂',
      init = '⚙',
      keys = '🗝',
      plugin = '🔌',
      runtime = '💻',
      require = '🌙',
      source = '📄',
      start = '🚀',
      task = '📌',
      lazy = '💤 ',
    },
  },
})

-- Function to check if a file exists
local function file_exists(file)
  local f = io.open(file, 'r')
  if f then
    f:close()
    return true
  else
    return false
  end
end

-- Path to the session file
local session_file = '.session.vim'

-- Check if the session file exists in the current directory
if file_exists(session_file) then
  -- Source the session file
  vim.cmd('source ' .. '.session.vim')
end

-- The line beneath this is called `modeline`. See `:help modeline`
-- vim: ts=2 sts=2 sw=2 et