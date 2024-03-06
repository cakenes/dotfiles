local function process_sections(sections)
    for name, section in pairs(sections) do
        local left = name:sub(9, 10) < 'x'
        for pos = 1, name ~= 'lualine_z' and #section or #section - 1 do
            table.insert(section, pos * 2, { empty, color = { fg = '#f3f3f3', bg = '#f3f3f3' } })
        end
        for id, comp in ipairs(section) do
            if type(comp) ~= 'table' then
                comp = { comp }
                section[id] = comp
            end
            comp.separator = left and { right = '' } or { left = '' }
        end
    end
    return sections
end

local function search_result()
    if vim.v.hlsearch == 0 then
        return ''
    end
    local last_search = vim.fn.getreg '/'
    if not last_search or last_search == '' then
        return ''
    end
    local searchcount = vim.fn.searchcount { maxcount = 9999 }
    return last_search .. '(' .. searchcount.current .. '/' .. searchcount.total .. ')'
end

local function modified()
    if vim.bo.modified then
        return '+'
    elseif vim.bo.modifiable == false or vim.bo.readonly == true then
        return '-'
    end
    return ''
end

return {
    'nvim-lualine/lualine.nvim',
    init = function()
        vim.g.lualine_laststatus = vim.o.laststatus
        if vim.fn.argc(-1) > 0 then
            vim.o.statusline = ' '
        else
            vim.o.laststatus = 0
        end
    end,
    opts = function()
        local lualine_require = require 'lualine_require'
        lualine_require.require = require
        vim.o.laststatus = vim.g.lualine_laststatus
        return {
            options = {
                theme = {
                    normal = {
                        a = { fg = '#f3f3f3', bg = '#383a42' },
                        b = { fg = '#f3f3f3', bg = '#a0a1a7' },
                        c = { fg = '#383a42', bg = '#f3f3f3' },
                        z = { fg = '#f3f3f3', bg = '#383a42' },
                    },
                    insert = { a = { fg = '#383a42', bg = '#83a598' } },
                    visual = { a = { fg = '#383a42', bg = '#fe8019' } },
                    replace = { a = { fg = '#383a42', bg = '#8ec07c' } },
                },
            },
            {
                component_separators = '',
                section_separators = { left = '', right = '' },
            },
            sections = process_sections {
                lualine_a = { 'mode' },
                lualine_b = {
                    'branch',
                    'diff',
                    {
                        'diagnostics',
                        source = { 'nvim' },
                        sections = { 'error' },
                        diagnostics_color = { error = { bg = '#ca1243', fg = '#f3f3f3' } },
                    },
                    {
                        'diagnostics',
                        source = { 'nvim' },
                        sections = { 'warn' },
                        diagnostics_color = { warn = { bg = '#fe8019', fg = '#f3f3f3' } },
                    },
                    { 'filename', file_status = false, path = 1 },
                    { modified, color = { bg = '#ca1243' } },
                    {
                        '%w',
                        cond = function()
                            return vim.wo.previewwindow
                        end,
                    },
                    {
                        '%r',
                        cond = function()
                            return vim.bo.readonly
                        end,
                    },
                    {
                        '%q',
                        cond = function()
                            return vim.bo.buftype == 'quickfix'
                        end,
                    },
                },
                lualine_c = {},
                lualine_x = {},
                lualine_y = { search_result, 'filetype' },
                lualine_z = { '%l:%c', '%p%%/%L' },
            },
            inactive_sections = {
                lualine_c = { '%f %y %m' },
                lualine_x = {},
            },
        }
    end,
}

