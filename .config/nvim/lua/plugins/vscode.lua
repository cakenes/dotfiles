return {
    {
        "Mofiqul/vscode.nvim",
        config = function()
            require("vscode").setup({
                italic_comments = true,
                disable_nvimtree_bg = true,
            })
            vim.cmd.colorscheme("vscode")
        end,
    },
}