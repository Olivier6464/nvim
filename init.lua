vim.g.mapleader = " "
require("config.lazy")

require("config.options")
require("config.autocmds")
require("config.keymaps")
require("config.snippets")
-- vim.cmd("colorscheme vision")
-- text under line
 vim.diagnostic.config({
    virtual_text = false,
    virtual_lines = true,
})
local diagnostics_active = true




