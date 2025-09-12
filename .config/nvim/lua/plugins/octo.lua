return {
    "pwntester/octo.nvim",
    dependencies = {
        { "nvim-lua/plenary.nvim" },
        { "nvim-telescope/telescope.nvim" },
        { "kyazdani42/nvim-web-devicons" },
    },
    config = function(_, opts)
        require("octo").setup(opts)
    end,
    opts = {},
}
