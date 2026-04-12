return {
  'nvim-lualine/lualine.nvim',
  event = 'VeryLazy',
  dependencies = { { 'nvim-tree/nvim-web-devicons', lazy = true } },
  config = function()
    -- Fonction pour récupérer le nom du serveur de langage (LSP) actif
    local function lsp_client()
      local msg = 'No LSP'
      local buf_ft = vim.api.nvim_buf_get_option(0, 'filetype')
      local clients = vim.lsp.get_clients()
      if next(clients) == nil then
        return msg
      end
      for _, client in ipairs(clients) do
        local filetypes = client.config.filetypes
        if filetypes and vim.fn.index(filetypes, buf_ft) ~= -1 then
          return client.name
        end
      end
      return msg
    end

    require('lualine').setup({
      options = {
        icons_enabled = true,
        theme = 'nightwolf-black',
        component_separators = { left = '', right = '' },
        section_separators = { left = '', right = '' },
        globalstatus = true, -- Recommandé pour avoir une seule barre en bas
      },
      sections = {
        lualine_a = { 'mode' },
        -- lualine_b = { 'branch', 'diff', 'diagnostics' },
        lualine_b = {},
        lualine_c = { { 'filename', path = 1 } }, -- path = 1 affiche le chemin relatif
        lualine_x = {
          { lsp_client, icon = ' ', color = { fg = '#ffffff', gui = 'bold' } },
          { 'filetype' }, -- On garde le type (ex: lua, python) mais pas l'OS/encodage
        },
        lualine_y = { 'progress' },
        lualine_z = {
          { 'datetime', style = '%Hh %M' }, -- Affichage de l'heure
          'location',
        },
      },
    })
  end,
}
