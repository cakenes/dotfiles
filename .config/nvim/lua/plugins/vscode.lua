return {
    "Mofiqul/vscode.nvim",
    config = function()
        require("vscode").setup({
            italic_comments = true,
            disable_nvimtree_bg = true,
        })
        vim.cmd.colorscheme("vscode")

        vim.api.nvim_set_hl(0, "RainbowDelimiterRed", { fg = "#D16969" })
        vim.api.nvim_set_hl(0, "RainbowDelimiterYellow", { fg = "#D7BA7D" })
        vim.api.nvim_set_hl(0, "RainbowDelimiterBlue", { fg = "#569CD6" })
        vim.api.nvim_set_hl(0, "RainbowDelimiterOrange", { fg = "#CE9178" })
        vim.api.nvim_set_hl(0, "RainbowDelimiterGreen", { fg = "#6A9955" })
        vim.api.nvim_set_hl(0, "RainbowDelimiterViolet", { fg = "#C586C0" })
        vim.api.nvim_set_hl(0, "RainbowDelimiterCyan", { fg = "#4EC9B0" })

        local c = require("vscode.colors").get_colors()

        vim.api.nvim_set_hl(0, "DiagnosticInfo", { fg = c.vscLineNumber, bg = "NONE" })
        vim.api.nvim_set_hl(0, "DiagnosticHint", { fg = c.vscLineNumber, bg = "NONE" })
        vim.api.nvim_set_hl(0, "DiagnosticUnderLineInfo", { fg = c.vscLineNumber, bg = "NONE" })
        vim.api.nvim_set_hl(0, "DiagnosticUnderLineHint", { fg = c.vscLineNumber, bg = "NONE" })
        vim.api.nvim_set_hl(0, "NeoTreeCursorLine", { bg = c.vscDarkBlue })

        vim.api.nvim_set_hl(0, "GitSignsAddLn", { bg = "#222522" })
        vim.api.nvim_set_hl(0, "GitSignsChangeLn", { bg = "#22221F" })
        vim.api.nvim_set_hl(0, "GitSignsDeleteLn", { bg = "#221F1F" })

        vim.api.nvim_set_hl(0, "NeoTreeFileNameOpened", { fg = c.vscBlue, bg = "NONE", bold = true })
    end,
}
