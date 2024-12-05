return {
    "CopilotC-Nvim/CopilotChat.nvim",
    dependencies = {
        { "github/copilot.vim" },
        { "nvim-lua/plenary.nvim", branch = "master" },
    },
    build = "make tiktoken",
    opts = {
        window = {
            layout = "vertical",
        },
    },
    config = function(_, opts)
        local chat = require("CopilotChat")
        local select = require("CopilotChat.select")

        chat.setup(opts)

        vim.api.nvim_create_user_command("CopilotChatBuffer", function(args)
            chat.ask(args.args, { selection = select.visual or select.buffer or {} })
        end, { nargs = "*", range = true })

        vim.api.nvim_create_user_command("CopilotChatAllBuffer", function(args)
            chat.ask(args.args, { context = { "buffers" } })
        end, { nargs = "*", range = true })
    end,
}
