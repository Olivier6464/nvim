return {
  'allaman/emoji.nvim',
  version = '1.0.0', -- optionally pin to a tag
  ft = 'markdown, html, lua, javascript, ts', -- adjust to your needs
  dependencies = {
    -- optional for nvim-cmp integration
    'hrsh7th/nvim-cmp',
    -- optional for telescope integration
    'nvim-telescope/telescope.nvim',
  },
  config = function()
    require('allaman/emoji.nvim').setup {
      opts = {
        -- default is false
        enable_cmp_integration = true,
        -- optional if your plugin installation directory
        -- is not vim.fn.stdpath("data") .. "/lazy/
        plugin_path = vim.fn.expand '$HOME/.config/nvim/lua/plugins/',
      },
    }
  end,
}
