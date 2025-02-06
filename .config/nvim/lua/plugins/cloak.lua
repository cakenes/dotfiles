return {
    "laytan/cloak.nvim",
    enabled = true,
    opts = function(_, opts)
        opts.cloak_character = "*"
        opts.highlight_group = "Comment"
        opts.patterns = {
            {
                file_pattern = {
                    ".env*",
                    "wrangler.toml",
                    ".dev.vars",
                },
                cloak_pattern = "=.+",
            },
        }
    end,
}

