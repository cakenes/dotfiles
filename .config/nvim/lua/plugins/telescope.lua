return {
    {
        "nvim-telescope/telescope.nvim",
        keys = {
            {
                "<leader>fp",
                desc = "Find Plugin File",
            },
        },
        dependencies = {
            {
                "nvim-telescope/telescope-live-grep-args.nvim",
                "nvim-telescope/telescope-fzf-native.nvim",
            },
        },
        opts = {
            defaults = {
                layout_strategy = "horizontal",
                layout_config = { prompt_position = "top" },
                sorting_strategy = "ascending",
                winblend = 0,
            },
        },
        config = function()
            require("telescope").load_extension("fzf")
            require("telescope.builtin").find_files({ cwd = require("lazy.core.config").options.root })
            require("telescope").load_extension("live_grep_args")
        end,
    },
}
