return {
    {
        "nvim-telescope/telescope.nvim",
        event = "VimEnter",
        dependencies = {
       'nvim-telescope/telescope-ui-select.nvim',
            "nvim-telescope/telescope-live-grep-args.nvim",
            "nvim-telescope/telescope-fzf-native.nvim",
        },
        opts = function(_, opts)
            opts.defaults = {
                layout_strategy = "horizontal",
                layout_config = { prompt_position = "top" },
                sorting_strategy = "ascending",
                winblend = 0,
            }
            opts.config = function()
                require("telescope.builtin").find_files({ cwd = require("lazy.core.config").options.root })
                require("telescope").load_extension("fzf")
                require("telescope").load_extension("live_grep_args")
            end
        end,
    },
}
