return {
  {    'nvim-treesitter/nvim-treesitter',
    build = ':TSUpdate',
    config = function()
      require('nvim-treesitter.configs').setup({
        ensure_installed = { 'bash', 'c', 'html', "css", "go", "javascript", "json", 'lua', 'markdown', "markdown_inline", 'vim', "regex", "tsx", "typescript", 'vim', "yaml" },
        auto_install = true,
        highlight = { enable = true },
        indent = { enable = true },
      })
   end,
  },
}
