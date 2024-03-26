return {
    "folke/which-key.nvim",
    event = "VimEnter",
    config = function()
        require("which-key").setup()
        require("which-key").register({
            ["<leader>b"] = { name = "[B]uffer", _ = "which_key_ignore" },
            ["<leader>c"] = { name = "[C]ode", _ = "which_key_ignore" },
            ["<leader>d"] = { name = "[D]ebug", _ = "which_key_ignore" },
            ["<leader>e"] = { name = "[E]xplorer", _ = "which_key_ignore" },
            ["<leader>f"] = { name = "[F]ind", _ = "which_key_ignore" },
            ["<leader>g"] = { name = "[G]oto", _ = "which_key_ignore" },
            ["<leader>s"] = { name = "[S]plit", _ = "which_key_ignore" },
            ["<leader>t"] = { name = "[T]est", _ = "which_key_ignore" },
        })
    end,
}
