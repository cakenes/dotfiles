return {
    {
        "nvim-neo-tree/neo-tree.nvim",
        lazy = false,

        opts = function(_, opts)
            opts.filesystem = {
                filtered_items = {
                    visible = true,
                },
            }
        end,
    },
}
