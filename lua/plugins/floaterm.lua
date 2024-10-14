return {
  'voldikss/vim-floaterm',
  config = function()
    -- Trop lent
    -- local function is_windows()
    --   local os_name = vim.loop.os_uname().sysname
    --   return os_name == 'Windows_NT'
    -- end
    -- if is_windows() then
    --   vim.g.floaterm_shell = 'pwsh'
    -- end
    vim.api.nvim_set_keymap('n', '<leader>ps', ':FloatermNew<CR>', { noremap = true, silent = true })
  end,
}

-- control \ control n pour se remettre en mode normal
