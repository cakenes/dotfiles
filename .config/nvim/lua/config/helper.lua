function Copilot_chat(command)
    local input = vim.fn.input("Copilot Chat: ")
    if input ~= "" then
        vim.cmd(command .. " " .. input)
    end
end

function Copilot_Is_Visible()
    local ns = vim.api.nvim_get_namespaces()["github-copilot"]
    if not ns then
        return false
    end
    local line0 = vim.fn.line(".") - 1
    local marks = vim.api.nvim_buf_get_extmarks(0, ns, { line0, 0 }, { line0, -1 }, { details = true })
    return #marks > 0
end

function Copilot_Suggestion_Text()
    local ns = vim.api.nvim_get_namespaces()["github-copilot"]
    if not ns then
        return nil
    end
    local line0 = vim.fn.line(".") - 1
    local marks = vim.api.nvim_buf_get_extmarks(0, ns, { line0, 0 }, { line0, -1 }, { details = true })
    if #marks == 0 then
        return nil
    end
    local _, _, _, details = unpack(marks[1])
    if not details or not details.virt_text then
        return nil
    end
    local s = ""
    for _, chunk in ipairs(details.virt_text) do
        s = s .. (chunk[1] or "")
    end
    return s ~= "" and s or nil
end

function Copilot_Suggestion_Starts_With_Whitespace()
    local s = Copilot_Suggestion_Text()
    if not s then
        return false
    end
    local first = s:sub(1, 1)
    return first == " " or first == "\t"
end

function Grep_cached_files()
    local builtin = require("telescope.builtin")
    local files = vim.fn.systemlist("git ls-files --cached")

    if #files == 0 then
        vim.notify("No cached files found in Git", vim.log.levels.WARN)
        return
    end

    builtin.grep_string({ search_dirs = files })
end

function Is_Neotree_Open()
    for _, win in ipairs(vim.api.nvim_list_wins()) do
        local bufname = vim.api.nvim_buf_get_name(vim.api.nvim_win_get_buf(win))
        if bufname:match("neo%-tree") then
            return true
        end
    end
    return false
end

function Dual_neotree()
    if Is_Neotree_Open() then
        vim.cmd("Neotree close")
        return
    else
        vim.cmd("Neotree close")
        vim.cmd("Neotree show git_status left")
        vim.cmd("belowright split | Neotree show filesystem")
    end
end
