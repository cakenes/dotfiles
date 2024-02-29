return {
  {
    "Mofiqul/vscode.nvim",
    lazy = false,
    name = "vscode",
    priority = 1000,
    config = function()
      vim.cmd.colorscheme "vscode"
    end
  }
}
