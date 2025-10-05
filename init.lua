require('core.options') -- Load general options
require('core.keymaps') -- Load general keymaps
require('core.snippets') -- Custom code snippets

-- Install package manager
local lazypath = vim.fn.stdpath('data') .. '/lazy/lazy.nvim'
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    'git',
    'clone',
    '--filter=blob:none',
    'https://github.com/folke/lazy.nvim.git',
    '--branch=stable', -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

-- Import color theme based on environment variable NVIM_THEME

-- Setup plugin
require('lazy').setup({
  require('plugins.telescope'),
  require('plugins.treesitter'),
  require('plugins.notify'),
  require('plugins.lsp'),
  require('plugins.autocompletion'),
  require('plugins.none-ls'),
  require('plugins.lualine'),
  require('plugins.bufferline'),
  require('plugins.neo-tree'),
  require('plugins.golang'),
  require('plugins.alpha'),
  require('plugins.indent-blankline'),
  require('plugins.lazygit'),
  require('plugins.comment'),
  require('plugins.debug'),
  -- require('plugins.gitsigns'),
  require('plugins.database'),
  require('plugins.misc'),
  require('plugins.overseer'),
  require('plugins.tabout'),
  require('plugins.noice'),
  require('plugins.render-markdown'),
  require('plugins.surround'),
  require('plugins.themes'),
  require('plugins.themery'),
  require('plugins.typst-preview'),
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

local session_file = '.session.vim'

if file_exists(session_file) then
  -- Source the session file
  vim.cmd('source ' .. session_file)
end

-- The line beneath this is called `modeline`. See `:help modeline`
-- vim: ts=2 sts=2 sw=2 et

-- return {
--     "chomosuke/typst-preview.nvim",
--     ft = "typst",
--     version = "1.*",
--     build = function() require "typst-preview".update() end,
--   },
-- require("lspconfig").typos_lsp.setup{},
-- require("lspconfig").setup{
--   single_file_support = true,
--   settings = {
--     exportPdf = "onSave",
--   },

vim.api.nvim_set_hl(0, 'visual', { bg = '#90EE90', fg = '#000000', bold = true })
-- vim.api.nvim_set_hl(0, 'TodoHigh', { bg = '#FF0000', fg = '#FFFFFF' bold = true })
-- vim.api.nvim_set_hl(0, 'TodoMed', { bg = '#FFFF00', fg = '#000000' })
-- vim.api.nvim_set_hl(0, 'TodoLow', { bg = '#0000FF', fg = '#FFFFFF' })
--
-- vim.api.nvim_create_autocmd({ BufRead, BufNewFile }, {
--   pattern = "*",
--   callback = function()
--     vim.fn.matchadd('TodoHigh', 'TODO:')
--     vim.fn.matchadd('TodoMed', 'FIXME:')
--     vim.fn.matchadd('TodoLow', 'NOTE:')
--   end
-- })
--
-- -- TODO:
-- -- FIXME:
-- -- NOTE:
