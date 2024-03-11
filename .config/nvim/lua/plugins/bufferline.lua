local colors = {
    red = "#f44747",
    grey = "#383a42",
    black = "#1e1e1e",
    blue = "#0a7aca",
}

return {
    "akinsho/bufferline.nvim",
    opts = {
        highlights = {
            background = {
                fg = colors.grey,
                bg = colors.black,
            },
            close_button = {
                fg = colors.red,
                bg = colors.black,
            },
            close_button_selected = {
                fg = colors.red,
                bg = colors.black,
            },
            buffer_selected = {
                fg = colors.blue,
                bg = colors.black,
                italic = false,
            },
        },
        options = {
            close_command = function(n)
                require("mini.bufremove").delete(n, false)
            end,
            right_mouse_command = function(n)
                require("mini.bufremove").delete(n, false)
            end,
            diagnostics = "nvim_lsp",
            always_show_bufferline = true,
            diagnostics_indicator = function(_, _, diag)
                local icons = { Error = " ", Warn = " ", Hint = " ", Info = " " }
                local ret = (diag.error and icons.Error .. diag.error .. " " or "")
                    .. (diag.warning and icons.Warn .. diag.warning or "")
                return vim.trim(ret)
            end,
            offsets = {
                {
                    filetype = "neo-tree",
                    text = "Neo-tree",
                    highlight = "Directory",
                    text_align = "left",
                },
            },
        },
    },
    config = function(_, opts)
        require("bufferline").setup(opts)
        vim.api.nvim_create_autocmd("BufAdd", {
            callback = function()
                vim.schedule(function()
                    pcall(nvim_bufferline)
                end)
            end,
        })
    end,
}
