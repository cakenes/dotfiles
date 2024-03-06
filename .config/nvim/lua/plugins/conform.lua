return {
    "stevearc/conform.nvim",
    lazy = true,
    opts = {
        notify_on_error = false,
        format_on_save = {
            timeout_ms = 500,
            lsp_fallback = true,
        },
        formatters_by_ft = {
        --     lua = { 'stylua' },
        },
    },
}
