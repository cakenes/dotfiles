local colors = {
    red = "#f44747",
    grey = "#383a42",
    black = "#1e1e1e",
    light_blue = "#5cb6f8",
    orange = "#ffaf00",
    blue = "#0a7aca",
}

local function process_sections(sections)
    for name, section in pairs(sections) do
        local left = name:sub(9, 10) < "x"
        for pos = 1, name ~= "lualine_z" and #section or #section - 1 do
            table.insert(section, pos * 2, { color = { fg = colors.black, bg = colors.black } })
        end
        for id, comp in ipairs(section) do
            if type(comp) ~= "table" then
                comp = { comp }
                section[id] = comp
            end
            comp.separator = left and { right = "" } or { left = "" }
        end
    end
    return sections
end

local function search_result()
    if vim.v.hlsearch == 0 then
        return ""
    end
    local last_search = vim.fn.getreg("/")
    if not last_search or last_search == "" then
        return ""
    end
    local searchcount = vim.fn.searchcount({ maxcount = 9999 })
    return last_search .. "(" .. searchcount.current .. "/" .. searchcount.total .. ")"
end

local function modified()
    if vim.bo.modified then
        return "+"
    elseif vim.bo.modifiable == false or vim.bo.readonly == true then
        return "-"
    end
    return ""
end

return {
    "nvim-lualine/lualine.nvim",
    dependencies = {
        "echasnovski/mini.bufremove",
        version = false,
    },
    init = function()
        vim.g.lualine_laststatus = vim.o.laststatus
        if vim.fn.argc(-1) > 0 then
            vim.o.statusline = " "
        else
            vim.o.laststatus = 0
        end
    end,
    opts = function()
        local lualine_require = require("lualine_require")
        lualine_require.require = require
        vim.o.laststatus = vim.g.lualine_laststatus
        return {
            options = {
                theme = {
                    normal = {
                        a = { fg = colors.blue, bg = colors.grey },
                        b = { fg = colors.blue, bg = colors.black },
                        c = { fg = colors.grey, bg = colors.black },
                        z = { fg = colors.blue, bg = colors.grey },
                    },
                    insert = { a = { fg = colors.black, bg = colors.light_blue } },
                    visual = { a = { fg = colors.grey, bg = colors.orange } },
                    replace = { a = { fg = colors.grey, bg = colors.blue } },
                },
            },
            sections = process_sections({
                lualine_a = { "mode" },
                lualine_b = {
                    "branch",
                    "diff",
                    {
                        "diagnostics",
                        source = { "nvim" },
                        sections = { "error" },
                        diagnostics_color = { error = { bg = colors.black, fg = colors.red } },
                    },
                    {
                        "diagnostics",
                        source = { "nvim" },
                        sections = { "warn" },
                        diagnostics_color = { warn = { bg = colors.black, fg = colors.orange } },
                    },
                    { "filename", file_status = false, path = 1 },
                    { modified, color = { bg = colors.black, fg = colors.red } },
                    {
                        "%w",
                        cond = function()
                            return vim.wo.previewwindow
                        end,
                    },
                    {
                        "%r",
                        cond = function()
                            return vim.bo.readonly
                        end,
                    },
                    {
                        "%q",
                        cond = function()
                            return vim.bo.buftype == "quickfix"
                        end,
                    },
                },
                lualine_c = {},
                lualine_x = {},
                lualine_y = { search_result, "filetype" },
                lualine_z = { "%l:%c", "%p%%/%L" },
            }),
            inactive_sections = {
                lualine_c = { "%f %y %m" },
                lualine_x = {},
            },
        }
    end,
}
