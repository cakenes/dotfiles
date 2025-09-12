return {
    "folke/persistence.nvim",
    enabled = false,
    event = "BufReadPre",
    opts = { options = vim.opt.sessionoptions:get() },
}
