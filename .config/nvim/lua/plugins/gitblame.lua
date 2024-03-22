return {
    {
        "f-person/git-blame.nvim",
        opts = function(_, opts)
            opts.delay = 0
            vim.g.gitblame_highlight_group = "NonText"
        end,
    },
}
