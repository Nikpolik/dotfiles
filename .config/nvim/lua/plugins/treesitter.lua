return {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",
  opts = {
    ensure_installed = { "lua", "go", "typescript", "javascript", "kotlin" }
  }
}
