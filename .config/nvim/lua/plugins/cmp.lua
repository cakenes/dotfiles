return {
    "hrsh7th/nvim-cmp",
    event = "InsertEnter",
    dependencies = {
        {
            "L3MON4D3/LuaSnip",
            build = (function()
                if vim.fn.has("win32") == 1 or vim.fn.executable("make") == 0 then
                    return
                end
                return "make install_jsregexp"
            end)(),
        },
        "saadparwaiz1/cmp_luasnip",
        "hrsh7th/cmp-nvim-lsp",
        "hrsh7th/cmp-path",
        "rafamadriz/friendly-snippets",
    },
    config = function()
        local cmp = require("cmp")
        local luasnip = require("luasnip")
        luasnip.config.setup({})

        local function is_copilot_visible()
            local namespaces = vim.api.nvim_get_namespaces()
            local id = namespaces["github-copilot"]
            if id then
                local marks = vim.api.nvim_buf_get_extmarks(0, id, 0, -1, {})
                for _, mark in ipairs(marks) do
                    local _, _, details = unpack(mark)
                    if details then
                        return true
                    end
                end
            end
            return false
        end

        ---@diagnostic disable-next-line: redundant-parameter
        cmp.setup({
            snippet = {
                expand = function(args)
                    luasnip.lsp_expand(args.body)
                end,
            },
            window = {
                completion = cmp.config.window.bordered(),
                documentation = cmp.config.window.bordered(),
            },
            experimental = { ghost_text = false },
            completion = { completeopt = "menu,menuone,noinsert", scrollbar = false },
            mapping = cmp.mapping.preset.insert({
                ["<CR>"] = cmp.mapping.confirm({ select = true }),
                ["<Left>"] = cmp.mapping(function(fallback)
                    cmp.close()
                    fallback()
                end, { "i", "s" }),
                ["<Right>"] = cmp.mapping(function(fallback)
                    cmp.close()
                    fallback()
                end, { "i", "s" }),
                ["<Esc>"] = cmp.mapping(function(fallback)
                    if cmp.visible() or is_copilot_visible() then
                        vim.cmd("call copilot#Dismiss()")
                        cmp.close()
                    else
                        fallback()
                    end
                end, { "i", "s" }),
            }),
            sources = {
                { name = "nvim_lsp" },
                { name = "luasnip" },
                { name = "path" },
            },
        })
    end,
}
