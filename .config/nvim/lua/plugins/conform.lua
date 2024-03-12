return {
    "stevearc/conform.nvim",
    opts = {
        notify_on_error = false,
        format_on_save = {
            timeout_ms = 500,
            lsp_fallback = true,
        },
        formatters_by_ft = {
            javascript = { "prettier" },
            javascriptreact = { "prettier" },
            typescript = { "prettier" },
            typescriptreact = { "prettier" },
            html = { "prettier" },
            css = { "prettier" },
            scss = { "prettier" },
            json = { "prettier" },
            lua = { "stylua" },
            sh = { "shfmt" },
        },
    },
}
