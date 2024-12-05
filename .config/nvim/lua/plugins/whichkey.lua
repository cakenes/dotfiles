return {
    "folke/which-key.nvim",
    event = "VimEnter",
    config = function()
        require("which-key").setup()
        require("which-key").add({
            {"<leader>a", group = "[A]vante" },
            {"<leader>b", group = "[B]uffer" },
            {"<leader>c", group = "[C]ode" },
            {"<leader>d", group = "[D]ebug" },
            {"<leader>e", group = "[E]xplorer" },
            {"<leader>f", group = "[F]ind" },
            {"<leader>g", group = "[G]oto" },
            {"<leader>s", group = "[S]plit" },
            {"<leader>t", group = "[T]est" },
        })
    end,
}
    