return {
	{
		"Mofiqul/adwaita.nvim",
		lazy = false,
		priority = 1000,

		-- configure and set on startup
		config = function()
			vim.g.adwaita_darker = true -- for darker version
			vim.g.adwaita_disable_cursorline = true -- to disable cursorline
			vim.g.adwaita_transparent = false -- makes the background transparent
			vim.cmd("colorscheme adwaita")
		end,
	},
	{
		"ray-x/aurora",
		init = function()
			vim.g.aurora_italic = 1
			vim.g.aurora_transparent = 1
			vim.g.aurora_bold = 1
		end,
		config = function()
			vim.cmd.colorscheme("aurora")
			-- override defaults
			vim.api.nvim_set_hl(0, "@number", { fg = "#e933e3" })
		end,
	},
	{ "Shatur/neovim-ayu" },
	{
		"uloco/bluloco.nvim",
		lazy = false,
		priority = 1000,
		dependencies = { "rktjmp/lush.nvim" },
		config = function()
			-- your optional config goes here, see below.
		end,
	},
	{ "catppuccin/nvim", name = "catppuccin", priority = 1000 },
	{ "GlennLeo/cobalt2", name = "cobalt2", priority = 1000 },
	{
		"kuznetsss/meadow.nvim",
		priority = 1000,
		config = true,
	},
	{ "Mofiqul/dracula.nvim" },
	{
		"eldritch-theme/eldritch.nvim",
		lazy = false,
		priority = 1000,
		opts = {},
	},
	{
		"embark-theme/vim",
		lazy = false,
		priority = 1000,
		name = "embark",
		config = function()
			vim.cmd.colorscheme("embark")
		end,
	},
	{
		"e-q/okcolors.nvim",
		name = "okcolors",
		config = function()
			require("okcolors").setup({
				variant = "smooth", -- "smooth" or "sharp", defaults to "smooth"
			})
		end,
	},
	{
		"neanias/everforest-nvim",
		version = false,
		lazy = false,
		priority = 1000, -- make sure to load this before all the other start plugins
		-- Optional; default configuration will be used if setup isn't called.
		config = function()
			require("everforest").setup({
				-- Your config here
			})
		end,
	},
	{ "projekt0n/github-nvim-theme", name = "github-theme" },
	{ "sainnhe/gruvbox-material" },
	{ "ellisonleao/gruvbox.nvim" },
	{ "EdenEast/nightfox.nvim" },
	{ "miikanissi/modus-themes.nvim", priority = 1000 },
	{ "bluz71/vim-moonfly-colors", name = "moonfly", lazy = false, priority = 1000 },
	{
		"Tsuzat/NeoSolarized.nvim",
		lazy = false, -- make sure we load this during startup if it is your main colorscheme
		priority = 1000, -- make sure to load this before all the other start plugins
	},
	{ "bluz71/vim-nightfly-colors", name = "nightfly", lazy = false, priority = 1000 },
	{
		"shaunsingh/nord.nvim",
		lazy = false, -- make sure we load this during startup if it is your main colorscheme
		priority = 1000, -- make sure to load this before all the other start plugins
		config = function()
			-- Example config in lua
			vim.g.nord_contrast = true -- Make sidebars and popup menus like nvim-tree and telescope have a different background
			vim.g.nord_borders = false -- Enable the border between verticaly split windows visable
			vim.g.nord_disable_background = true -- Disable the setting of background color so that NeoVim can use your terminal background
			vim.g.set_cursorline_transparent = false -- Set the cursorline transparent/visible
			vim.g.nord_italic = false -- enables/disables italics
			vim.g.nord_enable_sidebar_background = false -- Re-enables the background of the sidebar if you disabled the background of everything
			vim.g.nord_uniform_diff_background = true -- enables/disables colorful backgrounds when used in diff mode
			vim.g.nord_bold = false -- enables/disables bold

			-- Load the colorscheme
			require("nord").set()

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
				vim.cmd([[colorscheme nord]])
				-- set_menu_border_transparency()
			end

			vim.keymap.set("n", "<leader>bg", toggle_transparency, { noremap = true, silent = true })
		end,
	},
	{ "rose-pine/neovim", name = "rose-pine" },
	{
		"sainnhe/sonokai",
		priority = 1000,
		config = function()
			vim.g.sonokai_transparent_background = "1"
			vim.g.sonokai_enable_italic = "1"
			vim.g.sonokai_style = "andromeda"
			vim.cmd.colorscheme("sonokai")
		end,
	},
	{
		"tiagovla/tokyodark.nvim",
		opts = {
			-- custom options here
		},
		config = function(_, opts)
			require("tokyodark").setup(opts) -- calling setup is optional
			vim.cmd([[colorscheme tokyodark]])
		end,
	},
	{
		"folke/tokyonight.nvim",
		lazy = false,
		priority = 1000,
		opts = {},
	},
	{ "mkarmona/materialbox" },
	{ "liuchengxu/space-vim-dark" },
	{ "shrik3/vision.nvim" },
	{ "tpope/vim-vividchalk" },
	{ "askfiy/visual_studio_code" },
	{ "adisen99/apprentice.nvim", dependencies = { "rktjmp/lush.nvim" } },
	{
		"craftzdog/solarized-osaka.nvim",
		branch = "osaka",
		opts = function()
			return {
				transparent = false,
			}
		end,
	},
	{
		"mtendekuyokwa19/stoics.nvim",
	},
	{
		"ribru17/bamboo.nvim",
		lazy = false,
		priority = 1000,
		config = function()
			require("bamboo").setup({
				-- optional configuration here
			})
			require("bamboo").load()
		end,
	},
	{
		"webhooked/kanso.nvim",
		lazy = false,
		priority = 1000,
	},
	-- Using Lazy
	{ "e-q/okcolors.nvim", name = "okcolors" },
	{
		"navarasu/onedark.nvim",
		priority = 1000, -- make sure to load this before all the other start plugins
		config = function()
			require("onedark").setup({
				style = "deep",
			})
			require("onedark").load()
		end,
	},
	{
		"kungfusheep/mfd.nvim",
		lazy = false,
		priority = 1000,
		config = function()
			vim.cmd("colorscheme mfd-stealth")

			vim.opt.guicursor = {
				"n:block-CursorNormal",
				"v:block-CursorVisual",
				"i:block-CursorInsert",
				"r-cr:block-CursorReplace",
				"c:block-CursorCommand",
			}

			require("mfd").enable_cursor_sync()
		end,
	},
	{
		"LazyVim/LazyVim",
		opts = {
			colorscheme = "wisteria",
		},
	},
	{
		"masisz/wisteria.nvim",
		name = "wisteria",
		opts = {
			transparent = true,
			overrides = function(colors)
				return {}
			end,
		},
	},
{'Iron-E/nvim-highlite',
    config = function(_, opts)
      -- OPTIONAL: setup the plugin. See "Configuration" for information
      require('highlite').setup {generator = {plugins = {vim = false}, syntax = false}}

      -- or one of the alternate colorschemes (see the "Built-in Colorschemes" section)
      vim.api.nvim_command 'colorscheme highlite'
    end,
    lazy = false,
    priority = math.huge,
    version = '^4.0.0',
  },
	{
    "jpwol/thorn.nvim",
    lazy = false,
    priority = 1000,
    opts = {}
},
{
    "gmr458/vscode_modern_theme.nvim",
    lazy = false,
    priority = 1000,
    config = function()
        require("vscode_modern").setup({
            cursorline = true,
            transparent_background = false,
            nvim_tree_darker = true,
        })
        vim.cmd.colorscheme("vscode_modern")
    end,
    },
	{
		"nvim-lualine/lualine.nvim",
		opts = {
			theme = "wisteria",
		},
	},
	{
    "jackplus-xyz/binary.nvim",
    opts = {
        -- Add your configuration here
    },
},
{
  "thesimonho/kanagawa-paper.nvim",
  lazy = false,
  priority = 1000,
  opts = {},
},
{
  "ricardoraposo/nightwolf.nvim",
  lazy = false,
  priority = 1000,
  opts = {},
},
{
  "jwbaldwin/oscura.nvim",
  lazy = false,
  priority = 1000,
  opts = {
    -- configuration options (see below)
  },
},
{
  "idr4n/github-monochrome.nvim",
  lazy = false,
  priority = 1000,
  opts = {},
},
{
    "scottmckendry/cyberdream.nvim",
    lazy = false,
    priority = 1000,
},
{
    "samharju/synthweave.nvim",
},
-- run :colorscheme synthweave or synthweave-transparent when feeling like it
{ 'perpetuatheme/nvim', as = 'perpetua' },
{
    "ViViDboarder/wombat.nvim",
    dependencies = { { "rktjmp/lush.nvim" } },
    opts = {
        -- You can optionally specify the name of the ansi colors you wish to use
        -- This defaults to nil and will use the default ansi colors for the theme
        ansi_colors_name = nil,
    },
},
{
  "dgrco/monolith.nvim",
  lazy = false,
  priority = 1000,
  config = function()
    vim.cmd.colorscheme("monolith")
  end,
},
{ "oxfist/night-owl.nvim",
  lazy = false, -- make sure we load this during startup if it is your main colorscheme
  priority = 1000, -- make sure to load this before all the other start plugins
  config = function()
    -- load the colorscheme here
    require("night-owl").setup()
    vim.cmd.colorscheme("night-owl")
  end,
},
{
  "cpea2506/one_monokai.nvim",
},
{ "y9san9/y9nika.nvim",
    lazy = false,
    priority = 1000,
  config = function()
    -- load the colorscheme here
    require("y9nika.core").apply {
    background = "#0e1415",
    foreground = "#dddddd",
    primary = "#71ade7",
    secondary = "#95cb82",
    muted = "#aaaaaa",
    marker = "#dfdf8e",
}
  end,
},
{
  "Ferouk/bearded-nvim",
  name = "bearded",
  priority = 1000,
  build = function()
    -- Generate helptags so :h bearded-theme works
    local doc = vim.fs.joinpath(vim.fn.stdpath("data"), "lazy", "bearded", "doc")
    pcall(vim.cmd, "helptags " .. doc)
  end,
  config = function()
    require("bearded").setup({
      flavor = "arc", -- any flavor slug
    })
    vim.cmd.colorscheme("bearded")
  end,
},
{"jalvesaq/southernlights"},
{ 'kepano/flexoki-neovim', as = 'flexoki' },
{ "lunarvim/darkplus.nvim" },
}
