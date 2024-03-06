return {
    'akinsho/bufferline.nvim',
    opts = {
        options = {
            close_command = function(n)
                require('mini.bufremove').delete(n, false)
            end,
            right_mouse_command = function(n)
                require('mini.bufremove').delete(n, false)
            end,
            diagnostics = 'nvim_lsp',
            always_show_bufferline = false,
            diagnostics_indicator = function(_, _, diag)
                local icons = {Error = ' ', Warn = ' ', Hint = ' ', Info = ' ' }
                local ret = (diag.error and icons.Error .. diag.error .. ' ' or '') .. (diag.warning and icons.Warn .. diag.warning or '')
                return vim.trim(ret)
            end,
            offsets = {
                {
                    filetype = 'neo-tree',
                    text = 'Neo-tree',
                    highlight = 'Directory',
                    text_align = 'left',
                },
            },
        },
    },
    config = function(_, opts)
        require('bufferline').setup(opts)
        vim.api.nvim_create_autocmd('BufAdd', {
            callback = function()
                vim.schedule(function()
                    pcall(nvim_bufferline)
                end)
            end,
        })
    end,
}
