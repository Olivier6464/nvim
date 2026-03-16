require("core.autocmd")
require("core.keymaps")
require("core.options")
require("core.snippets")
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable",
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)

vim.g.lazyvim_check_order = false
-- Setupplugin
require("lazy").setup({
	require("plugins.nvim-treesitter"),
	require("plugins.lualine"),
	require("plugins.indent-blankline"),
	require("plugins.autocompletion"),
	require("plugins.comment"),
	require("plugins.conform"),
	require("plugins.debug"),
	require("plugins.database"),
	require("plugins.misc"),
	require("plugins.tabout"),
	-- require("plugins.luasnip"),
	require("plugins.render-markdown"),
	require("plugins.surround"),
	require("plugins.lsp"),
	require("plugins.telescope"),
	require("plugins.themes"),
	require("plugins.themery"),
	require("plugins.typst-preview"),
	require("plugins.cmake"),
	require("plugins.neo-tree"),
	require("plugins.zen"),
	ui = {
		-- If you have a Nerd Font, set icons to an empty table which will use the
		-- default lazy.nvim defined Nerd Font icons otherwise define a unicode icons table
		icons = vim.g.have_nerd_font and {} or {
			cmd = "⌘",
			config = "🛠",
			event = "📅",
			ft = "📂",
			init = "⚙",
			keys = "🗝",
			plugin = "🔌",
			runtime = "💻",
			require = "🌙",
			source = "📄",
			start = "🚀",
			task = "📌",
			lazy = "💤 ",
		},
	},
})

-- Function to check if a file exists
local function file_exists(file)
	local f = io.open(file, "r")
	if f then
		f:close()
		return true
	else
		return false
	end
end

local session_file = ".session.vim"

if file_exists(session_file) then
	-- Source the session file
	vim.cmd("source " .. session_file)
end

vim.cmd("colorscheme vision")
