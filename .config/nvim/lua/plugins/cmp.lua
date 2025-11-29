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
                ["<Tab>"] = cmp.mapping(function(fallback)
                    if Copilot_Is_Visible() then
                        if not Copilot_Suggestion_Starts_With_Whitespace() then
                            local keys = vim.fn["copilot#Accept"]("<CR>")
                            if keys and keys ~= "" then
                                vim.api.nvim_feedkeys(keys, "n", false)
                                return
                            end
                        end
                        fallback()
                        return
                    end
                    if cmp.visible() then
                        cmp.select_next_item()
                        return
                    end
                    if luasnip.expand_or_jumpable() then
                        luasnip.expand_or_jump()
                        return
                    end
                    fallback()
                end, { "i", "s" }),
                ["<Esc>"] = cmp.mapping(function(fallback)
                    if cmp.visible() or Copilot_Is_Visible() then
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
