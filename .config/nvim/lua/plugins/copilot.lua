return {
    {
        "zbirenbaum/copilot.lua",
        enabled = true,
        cmd = "Copilot",
        build = ":Copilot auth",
        opts = function(_, opts)
            opts.suggestion = { enabled = true, auto_trigger = true }
            opts.panel = { enabled = true }
            opts.filetypes = {
                markdown = true,
                help = true,
            }
        end,
    },
}