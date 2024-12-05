-- Common
vim.keymap.set("n", "<leader>L", "<cmd>Lazy<cr>", { desc = "Open lazy" })
vim.keymap.set("n", "<leader>T", "<cmd>terminal<cr>", { desc = "Open terminal" })
vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>")
vim.keymap.set("t", "<Esc><Esc>", "<C-\\><C-n>", { desc = "Exit terminal mode" })
vim.keymap.set({ "i", "x", "n", "s" }, "<C-s>", "<cmd>w<cr><esc>", { desc = "Save file" })
vim.keymap.set("n", "gd", "<cmd>Telescope lsp_definitions<cr>", { desc = "Code definition" })
vim.keymap.set({ "x", "n", "s" }, "<PageDown>", "20j", { desc = "Window: Go up", remap = true })
vim.keymap.set({ "x", "n", "s" }, "<PageUp>", "20k", { desc = "Window: Go up", remap = true })
vim.keymap.set({ "i", "x", "n" }, "<A-Up>", "<cmd>m -2<cr>", { desc = "Move line up" })
vim.keymap.set({ "i", "x", "n" }, "<A-Down>", "<cmd>m +1<cr>", { desc = "Move line down" })
vim.keymap.set("n", "<cr>", "o<Esc>", { desc = "Insert new line below" })
vim.keymap.set("n", "<S-cr>", "O<Esc>", { desc = "Insert new line above" })
vim.keymap.set({ "n", "i", "v", "s", "t" }, "~", "<Esc>", { desc = "Map tilde to Esc in all modes" })

-- Buffer
vim.keymap.set("n", "<leader>bb", "<cmd>Telescope buffers sort_mru=true sort_lastused=true<cr>",{ desc = "Buffer: List" })
vim.keymap.set("n", "<leader>bd", "<cmd>bdelete<cr>", { desc = "Buffer: Delete" })
vim.keymap.set("n", "<leader>bo", "<cmd>BufferLineCloseOthers<cr>", { desc = "Buffer: Delete other" })
vim.keymap.set("n", "<leader>br", "<cmd>BufferLineCloseRight<cr>", { desc = "Buffer: Delete to the right" })
vim.keymap.set("n", "<leader>bl", "<cmd>BufferLineCloseLeft<cr>", { desc = "Buffer: Delete to the left" })
vim.keymap.set("n", "<leader>bf", "<cmd>bdelete!<cr>", { desc = "Buffer: Force delete" })
vim.keymap.set("n", "<leader>bp", "<cmd>BufferLineTogglePin<cr>", { desc = "Buffer: Toggle pin" })
vim.keymap.set("n", "<leader>ba", "<cmd>bufdo bdelete<cr>", { desc = "Buffer: Delete all saved" })
vim.keymap.set("n", "<leader>bA", "<cmd>bufdo bdelete!<cr>", { desc = "Buffer: Force delete all" })
vim.keymap.set("n", "[b", "<cmd>BufferLineCyclePrev<cr>", { desc = "Buffer: Prev" })
vim.keymap.set("n", "]b", "<cmd>BufferLineCycleNext<cr>", { desc = "Buffer: Next" })
vim.keymap.set("n", "<C-Tab>", "<cmd>bprevious<cr>", { desc = "Buffer: Prev" })
vim.keymap.set("n", "<Tab>", "<cmd>bnext<cr>", { desc = "Buffer: Next" })
vim.keymap.set("n", "<C-Esc>", "<cmd>bdelete<cr>", { desc = "Buffer: Delete" })

-- Code
vim.keymap.set("n", "<leader>cb", function() copilot_chat("CopilotChatBuffer") end, { desc = "Code: Copilot - Current buffer" })
vim.keymap.set({"n", "v"}, "<leader>cc", function() copilot_chat("CopilotChatAllBuffer") end, { desc = "Code: Copilot - All buffers" })
vim.keymap.set("n", "<leader>cr", "<cmd>lua vim.lsp.buf.rename()<CR>", { desc = "Code: Rename" })
vim.keymap.set("n", "<leader>ca", "<cmd>lua vim.lsp.buf.code_action()<CR>", { desc = "Code: Action" })
vim.keymap.set("n", "<leader>cf", "<cmd>lua vim.lsp.buf.format()<CR>", { desc = "Code: Format" })
vim.keymap.set("n", "<leader>cd", "<cmd>Telescope lsp_definitions<cr>", { desc = "Code: Definition" })
vim.keymap.set("n", "<leader>ci", "<cmd>Telescope lsp_implementations<cr>", { desc = "Code: Implementation" })

-- Debug
vim.keymap.set("n", "<leader>ds", "<cmd>DapContinue<cr>", { desc = "Debug: Start/Continue" })
vim.keymap.set("n", "<leader>di", "<cmd>DapStepInto<cr>", { desc = "Debug: Step into" })
vim.keymap.set("n", "<leader>dO", "<cmd>DapStepOver<cr>", { desc = "Debug: Step over" })
vim.keymap.set("n", "<leader>do", "<cmd>DapStepOut<cr>", { desc = "Debug: Step out" })
vim.keymap.set("n", "<leader>db", "<cmd>DapToggleBreakpoint<cr>", { desc = "Debug: Toggle breakpoint" })

-- Goto
vim.keymap.set("n", "<leader>gd", "<cmd>Telescope lsp_definitions<cr>", { desc = "Goto: Definitions" })
vim.keymap.set("n", "<leader>gD", "<cmd>Telescope lsp_definitions<cr>", { desc = "Goto: Definitions" })
vim.keymap.set("n", "<leader>gr", "<cmd>Telescope lsp_references<cr>", { desc = "Goto: References" })
vim.keymap.set("n", "<leader>gi", "<cmd>Telescope lsp_implementations<cr>", { desc = "Goto: Implementations" })
vim.keymap.set("n", "<leader>gt", "<cmd>Telescope lsp_type_definitions<cr>", { desc = "Goto: References" })
vim.keymap.set("n", "<leader>gs", "<cmd>Telescope lsp_document_symbols<cr>", { desc = "Goto: Symbols" })

-- Explorer
vim.keymap.set("n", "<leader>ee", "<cmd>Neotree toggle<cr>", { desc = "Explorer: Toggle" })
vim.keymap.set("n", "<leader>eg", "<cmd>Neotree git_status<cr>", { desc = "Explorer: Git status" })
vim.keymap.set("n", "<leader>eb", "<cmd>Neotree buffers<cr>", { desc = "Explorer: Buffers" })
vim.keymap.set("n", "<leader>ef", "<cmd>Neotree float<cr>", { desc = "Explorer: Float" })

-- Find
vim.keymap.set("n", "<leader><space>", "<cmd>Telescope git_files<cr>", { desc = "Find: Git" })
vim.keymap.set("n", "<leader>fg", "<cmd>Telescope live_grep<cr>", { desc = "Find: Grep" })
vim.keymap.set("n", "<leader>fr", "<cmd>Telescope oldfiles<cr>", { desc = "Find: Recent" })
vim.keymap.set("n", "<leader>ff", "<cmd>Telescope find_files<cr>", { desc = "Find: Files" })
vim.keymap.set("n", "<leader>fa", "<cmd>Telescope find_files follow=true no_ignore=true hidden=true<cr>", { desc = "Find: All" })
vim.keymap.set("n", "<leader>fb", "<cmd>Telescope git_commits<cr>", { desc = "Find: Git commit" })
vim.keymap.set("n", "<leader>fc", "<cmd>Telescope git_bcommits<cr>", { desc = "Find: Git commit (current file)" })
vim.keymap.set("n", "<leader>fs", "<cmd>Telescope git_stash<cr>", { desc = "Find: Git stash" })

-- Split
vim.keymap.set("n", "<leader>sh", "<cmd>split<cr>", { desc = "Split: Horizontal" })
vim.keymap.set("n", "<leader>sv", "<cmd>vsplit<cr>", { desc = "Split: Vertical" })

-- Test
vim.keymap.set("n", "<leader>tr", "<cmd>Neotest run<cr>", { desc = "Neotest: Run nearest" })
vim.keymap.set("n", "<leader>tl", "<cmd>Neotest run last<cr>", { desc = "Neotest: Run last" })
vim.keymap.set("n", "<leader>tf", "<cmd>Neotest run file<cr>", { desc = "Neotest: Run file" })
vim.keymap.set("n", "<leader>tt", "<cmd>TroubleToggle<cr>", { desc = "Trouble: Toggle" })
vim.keymap.set("n", "<leader>tR", "<cmd>TroubleToggle lsp_references<cr>", { desc = "Trouble: References" })
vim.keymap.set("n", "<leader>td", "<cmd>TroubleToggle lsp_definitions<cr>", { desc = "Trouble: Definitions" })
vim.keymap.set("n", "<leader>ti", "<cmd>TroubleToggle lsp_implementations<cr>", { desc = "Trouble: Implementations" })
vim.keymap.set("n", "<leader>tD", "<cmd>TroubleToggle lsp_diagnostics<cr>", { desc = "Trouble: Diagnostics" })
vim.keymap.set("n", "<leader>tL", "<cmd>TroubleToggle loclist<cr>", { desc = "Trouble: Location list" })
vim.keymap.set("n", "<leader>tq", "<cmd>TroubleToggle quickfix<cr>", { desc = "Trouble: Quickfix list" })

-- Window
vim.keymap.set("n", "<C-Left>", "<C-w>h", { desc = "Window: Go left", remap = true })
vim.keymap.set("n", "<C-Down>", "<C-w>j", { desc = "Window: Go down", remap = true })
vim.keymap.set("n", "<C-Up>", "<C-w>k", { desc = "Window: Go up", remap = true })
vim.keymap.set("n", "<C-Right>", "<C-w>l", { desc = "Window: Go right", remap = true })
vim.keymap.set("n", "<D-Left>", "<C-w>h", { desc = "Window: Go left", remap = true }) -- For Mac
vim.keymap.set("n", "<D-Down>", "<C-w>j", { desc = "Window: Go down", remap = true }) -- For Mac
vim.keymap.set("n", "<D-Up>", "<C-w>k", { desc = "Window: Go up", remap = true }) -- For Mac
vim.keymap.set("n", "<D-Right>", "<C-w>l", { desc = "Window: Go right", remap = true }) -- For Mac
vim.keymap.set("n", "<C-k>", "<cmd>resize +2<cr>", { desc = "Window: Increase height" })
vim.keymap.set("n", "<C-j>", "<cmd>resize -2<cr>", { desc = "Window: Decrease height" })
vim.keymap.set("n", "<C-h>", "<cmd>vertical resize -2<cr>", { desc = "Window: Decrease width" })
vim.keymap.set("n", "<C-l>", "<cmd>vertical resize +2<cr>", { desc = "Window: Increase width" })

