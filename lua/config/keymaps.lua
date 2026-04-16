-- Keymaps for better default experience

-- Set leader key
--:ivim.g.mapleader = ""
vim.g.maplocalleader = ' '

-- For conciseness
local opts = { noremap = true, silent = true }

-- Disable the spacebar key's default behavior in Normal and Visual modes
vim.keymap.set({ 'n', 'v' }, '<Space>', '<Nop>', { silent = true })

-- Allow moving the cursor through wrapped lines with j, k
vim.keymap.set('n', 'k', "v:count == 1 ? 'gk' : 'k'", { expr = true, silent = true })
vim.keymap.set('n', 'j', "v:count == 1 ? 'gj' : 'j'", { expr = true, silent = true })

-- clear highlights
vim.keymap.set('n', '<Esc>', ':noh<CR>', {})

-- save file
vim.keymap.set('n', '<C-s>', ':w<CR>', {})

-- select all
vim.keymap.set('n', '<C-a>', 'gg<S-v>G', {})

-- save file without auto-formatting
vim.keymap.set('n', '<leader>sn', '<cmd>noautocmd w <CR>', {})

-- quit file
vim.keymap.set('n', '<C-q>', '<cmd> q <CR>', {})

-- delete single character without copying into register
vim.keymap.set('n', 'x', '"_x', {})

-- Vertical scroll and center
vim.keymap.set('n', '<C-d>', '<C-d>zz', {})
vim.keymap.set('n', '<C-u>', '<C-u>zz', {})

-- Find and center
vim.keymap.set('n', 'n', 'nzzzv')
vim.keymap.set('n', 'N', 'Nzzzv')

-- Resize with arrows
vim.keymap.set('n', '<Up>', ':resize -1<CR>', opts)
vim.keymap.set('n', '<Down>', ':resize +3<CR>', opts)
vim.keymap.set('n', '<Left>', ':vertical resize -1<CR>', opts)
vim.keymap.set('n', '<Right>', ':vertical resize +3<CR>', opts)

-- Navigate buffers
vim.keymap.set('n', '<Right>', ':bnext<CR>', opts)
vim.keymap.set('n', '<Left>', ':bprevious<CR>', opts)

-- increment/decrement numbers
vim.keymap.set('n', '<leader>+', '<C-a>', opts) -- increment
vim.keymap.set('n', '<leader>-', '<C-x>', opts) -- decrement

-- window management
vim.keymap.set('n', '<leader>v', '<C-w>v', opts) -- split window vertically
vim.keymap.set('n', '<leader>h', '<C-w>s', opts) -- split window horizontally
vim.keymap.set('n', '<leader>se', '<C-w>=', opts) -- make split windows equal width & height
vim.keymap.set('n', '<leader>xs', ':close<CR>', opts) -- close current split window

-- Navigate between splits
vim.keymap.set('n', '<C-k>', ':wincmd k<CR>', opts)
vim.keymap.set('n', '<C-j>', ':wincmd j<CR>', opts)
vim.keymap.set('n', '<C-h>', ':wincmd h<CR>', opts)
vim.keymap.set('n', '<C-l>', ':wincmd l<CR>', opts)

-- tabs
-- vim.keymap.set('n', '<leader>to', ':tabnew<CR>', opts) -- open new tab
-- vim.keymap.set('n', '<leader>tx', ':tabclose<CR>', opts) -- close current tab
-- vim.keymap.set('n', '<leader>tn', ':tabn<CR>', opts) --  go to next tab
-- vim.keymap.set('n', '<leader>tp', ':tabp<CR>', opts) --  go to previous tab

-- vim.keymap.set('n', '<leader>x', ':Bdelete!<CR>', opts) -- close buffer
-- vim.keymap.set('n', '<leader>b', '<cmd> enew <CR>', opts) -- new buffer
-- Appel explicite de Snacks.explorer

-- vim.keymap.set('n', '<leader>e', function()
--   Snacks.explorer.open()
-- end, { desc = 'Explorer Snacks' })
-- toggle line wrapping
vim.keymap.set('n', '<leader>lw', '<cmd>set wrap!<CR>', opts)

-- Press jk fast to exit insert mode
vim.keymap.set('i', 'jk', '<ESC>', opts)
vim.keymap.set('i', 'kj', '<ESC>', opts)

-- Stay in indent mode
vim.keymap.set('v', '<', '<gv', opts)
vim.keymap.set('v', '>', '>gv', opts)

-- Move text up and down
vim.keymap.set('v', 'K', ":m '<-2<CR>gv=gv", opts)
vim.keymap.set('v', 'J', ":m '>+2<CR>gv=gv", opts)
-- Keep last yanked when pasting
vim.keymap.set('v', 'p', '"_dP', opts)

-- Replace word under cursor
-- vim.keymap.set('n', '<leader>j', '*``cgn', opts)

-- Explicitly yank to system clipboard (highlighted and entire row)
vim.keymap.set({ 'n', 'v' }, '<leader>y', [["+y]])
vim.keymap.set('n', '<leader>Y', [["+Y]])

-- vim.keymap.set('n', '<leader>do', function()
--   diagnostics_active = not diagnostics_active
--
--   if diagnostics_active then
--     vim.diagnostic.enable(1)
--   else
--     vim.diagnostic.disable(1)
--   end
-- end)

-- Diagnostic keymaps
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, { desc = 'Go to previous diagnostic message' })
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, { desc = 'Go to next diagnostic message' })
vim.keymap.set('n', '<leader>d', vim.diagnostic.open_float, { desc = 'Open floating diagnostic message' })
vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostics list' })

-- Save and load session
vim.keymap.set('n', '<leader>ss', ':mksession! .session.vim<CR>', { noremap = true, silent = false })
vim.keymap.set('n', '<leader>sl', ':source .session.vim<CR>', { noremap = true, silent = false })
vim.keymap.set('n', '<leader>fq', vim.lsp.buf.format, { desc = 'format file' })

vim.keymap.set('n', '<F6>', ':CMakeGenerate<cr>', {})
vim.keymap.set('n', '<F8>', ':CMakeBuild<cr>', {})
vim.keymap.set('n', '<F10>', ':CMakeClose<cr>', {})
vim.keymap.set('n', '<F9>', ':CMakeClean<cr>', {})

-- Normal mode → commenter/décommenter ligne
vim.keymap.set('n', '<C-/>', 'gcc', { remap = true, silent = true })

-- Visual mode → commenter/décommenter sélection
vim.keymap.set('v', '<C-/>', 'gc', { remap = true, silent = true })

-- Fallback (certains terminaux envoient Ctrl+/ comme Ctrl+_)
vim.keymap.set('n', '<C-_>', 'gcc', { remap = true, silent = true })
vim.keymap.set('v', '<C-_>', 'gc', { remap = true, silent = true })

-- ===============================
-- Zig : build & run F4 + terminal windows
-- ===============================

local function zig_build_and_run()
  if vim.bo.filetype ~= 'zig' then
    print('Pas un fichier Zig !')
    return
  end

  vim.cmd('write')

  -- Commande complète Windows
  local cmd = 'zig build  && .\\zig-out\\bin\\Zig.exe'
  -- local cmd = 'zig run .\\src\\main.zig'
  -- Ouvre un split en bas et lance directement la commande
  vim.cmd('botright split')
  vim.cmd('terminal cmd /k"' .. cmd .. '"')

  -- Passe en mode insertion automatiquement
  vim.cmd('startinsert')
end

vim.keymap.set('n', '<F4>', zig_build_and_run, { silent = true })

-- Ctrl+q pour fermer terminal
vim.keymap.set('t', '<C-c>', [[<C-\><C-n>:close<CR>]], { silent = true })

-- ===============================
-- Zig : build & run F6 + terminal linux
-- ===============================
--
-- local function zig_run()
--   local ft = vim.bo.filetype
--   if ft ~= 'zig' then
--     print('Pas un fichier Zig !')
--     return
--   end
--   vim.cmd('write')
--   vim.cmd('split | terminal zig run ' .. vim.fn.expand('%'))
-- end
--
-- vim.api.nvim_set_keymap('n', '<F5>', '', {
--   noremap = true,
--   silent = true,
--   callback = zig_run,
-- })
--
-- vim.api.nvim_set_keymap('t', '<C-q>', '<C-\\><C-n>:close<CR>', { noremap = true, silent = true })
--

-- ===============================
-- Zig : build & run F4 + terminal windows
-- ===============================

local function zig_build_and_run()
  if vim.bo.filetype ~= 'zig' then
    print('Pas un fichier Zig !')
    return
  end

  vim.cmd('write')

  -- Commande complète Windows
  local cmd = 'zig build && .\\zig-out\\bin\\Zig.exe'

  -- Ouvre un split en bas et lance directement la commande
  vim.cmd('botright split')
  vim.cmd('terminal cmd /k"' .. cmd .. '"')

  -- Passe en mode insertion automatiquement
  vim.cmd('startinsert')
end

vim.keymap.set('n', '<F4>', zig_build_and_run, { silent = true })
