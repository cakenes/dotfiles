local set = vim.keymap.set

set("n", "<C-Left>", "<C-w>h", { desc = "Go to left window", remap = true })
set("n", "<C-Down>", "<C-w>j", { desc = "Go to lower window", remap = true })
set("n", "<C-Up>", "<C-w>k", { desc = "Go to upper window", remap = true })
set("n", "<C-Right>", "<C-w>l", { desc = "Go to right window", remap = true })

set("n", "<C-k>", "<cmd>resize +2<cr>", { desc = "Increase window height" })
set("n", "<C-j>", "<cmd>resize -2<cr>", { desc = "Decrease window height" })
set("n", "<C-h>", "<cmd>vertical resize -2<cr>", { desc = "Decrease window width" })
set("n", "<C-l>", "<cmd>vertical resize +2<cr>", { desc = "Increase window width" })

set("n", "<C-Tab>", "<cmd>bprevious<cr>", { desc = "Prev buffer" })
set("n", "<Tab>", "<cmd>bnext<cr>", { desc = "Next buffer" })
set("n", "<C-Esc>", "<cmd>bdelete<cr>", { desc = "Delete buffer" })

set("n", "<leader>tt", "<cmd>TroubleToggle<cr>", { desc = "Trouble toggle" })
set("n", "<leader>tr", "<cmd>TroubleToggle lsp_references<cr>", { desc = "Trouble references" })
set("n", "<leader>td", "<cmd>TroubleToggle lsp_definitions<cr>", { desc = "Trouble definitions" })
set("n", "<leader>ti", "<cmd>TroubleToggle lsp_implementations<cr>", { desc = "Trouble implementations" })
set("n", "<leader>td", "<cmd>TroubleToggle lsp_diagnostics<cr>", { desc = "Trouble diagnostics" })
