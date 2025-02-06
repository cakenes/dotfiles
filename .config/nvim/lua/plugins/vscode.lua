return {
    "Mofiqul/vscode.nvim",
    config = function()
        require("vscode").setup({
            italic_comments = true,
            disable_nvimtree_bg = true,
        })
        vim.cmd.colorscheme("vscode")

        local c = require("vscode.colors").get_colors()

        -- vim.api.nvim_set_hl(0, "@type", { fg = c.vscLightBlue, bg = "NONE" }) -- Global typing
        vim.api.nvim_set_hl(0, "DiagnosticInfo", { fg = c.vscLineNumber, bg = "NONE" })
        vim.api.nvim_set_hl(0, "DiagnosticHint", { fg = c.vscLineNumber, bg = "NONE" })
        vim.api.nvim_set_hl(0, "DiagnosticUnderLineInfo", { fg = c.vscLineNumber, bg = "NONE" })
        vim.api.nvim_set_hl(0, "DiagnosticUnderLineHint", { fg = c.vscLineNuumber, bg = "NONE" })
    end,
}
