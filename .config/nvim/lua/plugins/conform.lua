return {
    "stevearc/conform.nvim",
    opts = {
        notify_on_error = false,
        format_on_save = {
            timeout_ms = 1000,
            lsp_fallback = true,
        },
        formatters_by_ft = {
            svelte = { "prettierd", "prettier" },
            javascript = { "biome" },
            javascriptreact = { "biome" },
            typescript = { "biome" },
            typescriptreact = { "biome" },
            html = { "prettierd", "prettier" },
            css = { "prettierd", "prettier" },
            scss = { "prettierd", "prettier" },
            json = { "prettierd", "prettier" },
            lua = { "stylua" },
            sh = { "shfmt" },
        },
    },
}
