return {
    "nvim-lualine/lualine.nvim",
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
          theme = "auto",
          globalstatus = true,
          disabled_filetypes = { statusline = { "dashboard", "alpha", "starter" } },
          section_separators = { left = '', right = '' },
        },
        sections = {
          lualine_a = { "mode" },
          lualine_b = { "branch" },
  
          lualine_c = {
            {
              "diagnostics",
              symbols = {
                    error = " ",
                    warn = " ",
                    info = " ",
                    hint = " ",
              },
            },
            { "filetype", icon_only = true, separator = "", padding = { left = 1, right = 0 } },
          },
          lualine_x = {
            -- stylua: ignore
            {
              function() return require("noice").api.status.command.get() end,
              cond = function() return package.loaded["noice"] and require("noice").api.status.command.has() end,

            },
            -- stylua: ignore
            {
              function() return require("noice").api.status.mode.get() end,
              cond = function() return package.loaded["noice"] and require("noice").api.status.mode.has() end,

            },
            -- stylua: ignore
            {
              function() return "  " .. require("dap").status() end,
              cond = function () return package.loaded["dap"] and require("dap").status() ~= "" end,

            },
            {
              require("lazy.status").updates,
              cond = require("lazy.status").has_updates,

            },
            {
              "diff",
              symbols = {
                    added    = " ",
                    modified = " ",
                    removed  = " ",
              },
              source = function()
                local gitsigns = vim.b.gitsigns_status_dict
                if gitsigns then
                  return {
                    added = gitsigns.added,
                    modified = gitsigns.changed,
                    removed = gitsigns.removed,
                  }
                end
              end,
            },
          },
          lualine_y = {
            { "progress", separator = " ", padding = { left = 1, right = 0 } },
            { "location", padding = { left = 0, right = 1 } },
          },
          lualine_z = {
            function()
              return " " .. os.date("%R")
            end,
          },
        },
      }
    end,
  }


  
--   require('lualine').setup {
--     options = {
--       theme = theme,
--       component_separators = '',
--       section_separators = { left = '', right = '' },
--     },
--     sections = process_sections {
--       lualine_a = { 'mode' },
--       lualine_b = {
--         'branch',
--         'diff',
--         {
--           'diagnostics',
--           source = { 'nvim' },
--           sections = { 'error' },
--           diagnostics_color = { error = { bg = colors.red, fg = colors.white } },
--         },
--         {
--           'diagnostics',
--           source = { 'nvim' },
--           sections = { 'warn' },
--           diagnostics_color = { warn = { bg = colors.orange, fg = colors.white } },
--         },
--         { 'filename', file_status = false, path = 1 },
--         { modified, color = { bg = colors.red } },
--         {
--           '%w',
--           cond = function()
--             return vim.wo.previewwindow
--           end,
--         },
--         {
--           '%r',
--           cond = function()
--             return vim.bo.readonly
--           end,
--         },
--         {
--           '%q',
--           cond = function()
--             return vim.bo.buftype == 'quickfix'
--           end,
--         },
--       },
--       lualine_c = {},
--       lualine_x = {},
--       lualine_y = { search_result, 'filetype' },
--       lualine_z = { '%l:%c', '%p%%/%L' },
--     },
--     inactive_sections = {
--       lualine_c = { '%f %y %m' },
--       lualine_x = {},
--     },
--   }
-- }