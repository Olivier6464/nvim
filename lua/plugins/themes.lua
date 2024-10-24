return {
  {
    'Mofiqul/adwaita.nvim',
    lazy = false,
    priority = 1000,

    -- configure and set on startup
    config = function()
      vim.g.adwaita_darker = true             -- for darker version
      vim.g.adwaita_disable_cursorline = true -- to disable cursorline
      vim.g.adwaita_transparent = false       -- makes the background transparent
      vim.cmd 'colorscheme adwaita'
    end,
  },
  {
    'ray-x/aurora',
    init = function()
      vim.g.aurora_italic = 1
      vim.g.aurora_transparent = 1
      vim.g.aurora_bold = 1
    end,
    config = function()
      vim.cmd.colorscheme 'aurora'
      -- override defaults
      vim.api.nvim_set_hl(0, '@number', { fg = '#e933e3' })
    end,
  },
  { 'Shatur/neovim-ayu' },
  {
    'uloco/bluloco.nvim',
    lazy = false,
    priority = 1000,
    dependencies = { 'rktjmp/lush.nvim' },
    config = function()
      -- your optional config goes here, see below.
    end,
  },
  { 'catppuccin/nvim',  name = 'catppuccin', priority = 1000 },
  {
    'lalitmee/cobalt2.nvim',
    dependencies = { 'tjdevries/colorbuddy.nvim', tag = 'v1.0.0' },
  },
  { 'tjdevries/colorbuddy.nvim' },
  { 'Mofiqul/dracula.nvim' },
  {
    'eldritch-theme/eldritch.nvim',
    lazy = false,
    priority = 1000,
    opts = {},
  },
  {
    'neanias/everforest-nvim',
    version = false,
    lazy = false,
    priority = 1000, -- make sure to load this before all the other start plugins
    -- Optional; default configuration will be used if setup isn't called.
    config = function()
      require('everforest').setup {
        -- Your config here
      }
    end,
  },
  { 'projekt0n/github-nvim-theme',  name = 'github-theme' },
  { 'sainnhe/gruvbox-material' },
  { 'ellisonleao/gruvbox.nvim' },
  { 'rebelot/kanagawa.nvim' },
  { 'miikanissi/modus-themes.nvim', priority = 1000 },
  { 'bluz71/vim-moonfly-colors',    name = 'moonfly',     lazy = false, priority = 1000 },
  {
    'Tsuzat/NeoSolarized.nvim',
    lazy = false,    -- make sure we load this during startup if it is your main colorscheme
    priority = 1000, -- make sure to load this before all the other start plugins
  },
  { 'bluz71/vim-nightfly-colors', name = 'nightfly', lazy = false, priority = 1000 },
  {
    'shaunsingh/nord.nvim',
    lazy = false,    -- make sure we load this during startup if it is your main colorscheme
    priority = 1000, -- make sure to load this before all the other start plugins
    config = function()
      -- Example config in lua
      vim.g.nord_contrast = true                   -- Make sidebars and popup menus like nvim-tree and telescope have a different background
      vim.g.nord_borders = false                   -- Enable the border between verticaly split windows visable
      vim.g.nord_disable_background = true         -- Disable the setting of background color so that NeoVim can use your terminal background
      vim.g.set_cursorline_transparent = false     -- Set the cursorline transparent/visible
      vim.g.nord_italic = false                    -- enables/disables italics
      vim.g.nord_enable_sidebar_background = false -- Re-enables the background of the sidebar if you disabled the background of everything
      vim.g.nord_uniform_diff_background = true    -- enables/disables colorful backgrounds when used in diff mode
      vim.g.nord_bold = false                      -- enables/disables bold

      -- Load the colorscheme
      require('nord').set()

      -- Function to set menu borders to transparent
      -- local set_menu_border_transparency = function()
      --   vim.api.nvim_set_hl(0, 'NormalFloat', { bg = 'NONE', fg = 'NONE' })
      --   vim.api.nvim_set_hl(0, 'FloatBorder', { bg = 'NONE', fg = 'NONE' })
      -- end

      -- Execute the function once after loading the colorscheme
      -- set_menu_border_transparency()

      local bg_transparent = true

      -- Toggle background transparency
      local toggle_transparency = function()
        bg_transparent = not bg_transparent
        vim.g.nord_disable_background = bg_transparent
        vim.cmd [[colorscheme nord]]
        -- set_menu_border_transparency()
      end

      vim.keymap.set('n', '<leader>bg', toggle_transparency, { noremap = true, silent = true })
    end,
  },
  {
    'navarasu/onedark.nvim',
    commit = 'dd640f6',
    priority = 1000,
    config = function()
      -- vim.cmd.colorscheme 'onedark'

      local config = {
        -- Main options --
        style = 'dark',               -- Default theme style. Choose between 'dark', 'darker', 'cool', 'deep', 'warm', 'warmer' and 'light'
        transparent = true,           -- Show/hide background
        term_colors = true,           -- Change terminal color as per the selected theme style
        ending_tildes = false,        -- Show the end-of-buffer tildes. By default they are hidden
        cmp_itemkind_reverse = false, -- reverse item kind highlights in cmp menu

        -- toggle theme style ---
        toggle_style_key = '<leader>th',                                                     -- keybind to toggle theme style. Leave it nil to disable it, or set it to a string, for example "<leader>ts"
        toggle_style_list = { 'dark', 'darker', 'cool', 'deep', 'warm', 'warmer', 'light' }, -- List of styles to toggle between

        -- Change code style ---
        -- Options are italic, bold, underline, none
        -- You can configure multiple style with comma separated, For e.g., keywords = 'italic,bold'
        code_style = {
          comments = 'italic',
          keywords = 'none',
          functions = 'none',
          strings = 'none',
          variables = 'none',
        },

        -- Lualine options --
        lualine = {
          transparent = false, -- lualine center bar transparency
        },

        -- Custom Highlights --
        colors = {
          -- purple = '#56b6c2',
        },               -- Override default colors
        highlights = {}, -- Override highlight groups

        -- Plugins Config --
        diagnostics = {
          darker = true,     -- darker colors for diagnostic
          undercurl = true,  -- use undercurl instead of underline for diagnostics
          background = true, -- use background color for virtual text
        },
      }

      local onedark = require 'onedark'
      onedark.setup(config)
      onedark.load()

      -- Make the background of diagnostics messages transparent
      local set_diagnostics_bg_transparency = function()
        vim.cmd [[highlight DiagnosticVirtualTextError guibg=none]]
        vim.cmd [[highlight DiagnosticVirtualTextWarn guibg=none]]
        vim.cmd [[highlight DiagnosticVirtualTextInfo guibg=none]]
        vim.cmd [[highlight DiagnosticVirtualTextHint guibg=none]]
      end
      set_diagnostics_bg_transparency()

      -- Toggle background transparency
      local toggle_transparency = function()
        config.transparent = not config.transparent
        onedark.setup(config)
        onedark.load()
        set_diagnostics_bg_transparency()
      end

      vim.keymap.set('n', '<leader>bg', toggle_transparency, { noremap = true, silent = true })
    end,
  },

  -- OneDark colors
  --	black = "#181a1f",
  --	bg0 = "#282c34",
  --	bg1 = "#31353f",
  --	bg2 = "#393f4a",
  --	bg3 = "#3b3f4c",
  --	bg_d = "#21252b",
  --	bg_blue = "#73b8f1",
  --	bg_yellow = "#ebd09c",
  --	fg = "#abb2bf",
  --	purple = "#c678dd",
  --	green = "#98c379",
  --	orange = "#d19a66",
  --	blue = "#61afef",
  --	yellow = "#e5c07b",
  --	cyan = "#56b6c2",
  --	red = "#e86671",
  --	grey = "#5c6370",
  --	light_grey = "#848b98",
  --	dark_cyan = "#2b6f77",
  --	dark_red = "#993939",
  --	dark_yellow = "#93691d",
  --	dark_purple = "#8a3fa0",
  --	diff_add = "#31392b",
  --	diff_delete = "#382b2c",
  --	diff_change = "#1c3448",
  --	diff_text = "#2c5372",

  { 'rose-pine/neovim',           name = 'rose-pine' },
  {
    'sainnhe/sonokai',
    priority = 1000,
    config = function()
      vim.g.sonokai_transparent_background = '1'
      vim.g.sonokai_enable_italic = '1'
      vim.g.sonokai_style = 'andromeda'
      vim.cmd.colorscheme 'sonokai'
    end,
  },
  {
    'tiagovla/tokyodark.nvim',
    opts = {
      -- custom options here
    },
    config = function(_, opts)
      require('tokyodark').setup(opts) -- calling setup is optional
      vim.cmd [[colorscheme tokyodark]]
    end,
  },
  {
    'folke/tokyonight.nvim',
    lazy = false,
    priority = 1000,
    opts = {},
  },
  { 'shrik3/vision.nvim' },
  { 'tpope/vim-vividchalk' },
  { 'askfiy/visual_studio_code' },
}
