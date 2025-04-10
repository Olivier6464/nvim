return {
    "folke/noice.nvim",
    requires = {
        "MunifTanjim/nui.nvim",
        "rcarriga/nvim-notify",
        "nvim-treesitter/nvim-treesitter",
    },
    config = function()
        require("noice").setup({
            routes = {
                filter = {
                    event = "msg_show",
                    kind = "",
                    find = "written",
                },
                opts = { skip = true },
            },
            views = {
                cmdline_popup = {
                    position = {
                        row = 5,
                        col = "50%",
                    },
                    size = {
                        width = 60,
                        height = "auto",
                    },
                },
                hover = {
                    border = { style = "rounded" },
                    size = { max_width = 80 },
                },
                popupmenu = {
                    relative = "editor",
                    position = {
                        row = 8,
                        col = "50%",
                    },
                    size = {
                        width = 60,
                        height = 10,
                    },
                    border = {
                        style = "rounded",
                        padding = { 3, 2 },
                    },
                    win_options = {
                        winhighlight = { Normal = "Normal", FloatBorder = "DiagnosticInfo" },
                    },
                    presets = {
                        bottom_search = true, -- use a classic bottom cmdline for search
                        command_palette = true, -- position the cmdline and popupmenu together
                        long_message_to_split = true, -- long messages will be sent to a split
                        inc_rename = false, -- enables an input dialog for inc-rename.nvim
                        lsp_doc_border = true, -- add a border to hover docs and signature help
                    },
                },
            },
        })
    end,
}
