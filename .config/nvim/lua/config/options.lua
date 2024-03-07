vim.opt.number = true
vim.opt.mouse = "a"
vim.opt.showmode = false
vim.opt.clipboard = "unnamedplus"
vim.opt.breakindent = true
vim.opt.undofile = true
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.signcolumn = "yes"
vim.opt.updatetime = 250
vim.opt.timeoutlen = 0
vim.opt.splitright = true
vim.opt.splitbelow = true
vim.opt.list = true
vim.opt.listchars = { tab = "» ", trail = "·", nbsp = "␣" }
vim.opt.inccommand = "split"
vim.opt.cursorline = true
vim.opt.scrolloff = 15
vim.opt.hlsearch = true
vim.opt.relativenumber = true
vim.opt.number = true

-- Indentation
vim.opt.expandtab = true
vim.opt.smartindent = true
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4

vim.api.nvim_create_autocmd("VimEnter", {
    pattern = "*",
    group = vim.api.nvim_create_augroup("NeotreeOnOpen", { clear = true }),
    once = true,
    callback = function()
        if vim.fn.argc() == 0 then
            vim.cmd("Neotree git_status")
        end
    end,
})
