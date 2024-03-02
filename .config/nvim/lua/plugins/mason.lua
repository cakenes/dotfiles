return {
    {
        "williamboman/mason.nvim",
        opts = function(_, opts)
            opts.ensure_installed = {
                "bash-language-server",
                "stylua",
                "shellcheck",
                "shfmt",
                "flake8",
            }
        end,
    },
}
