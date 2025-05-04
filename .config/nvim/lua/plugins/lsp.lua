return {
  {
    "williamboman/mason.nvim",
    opts = {
      registries = {
        "github:mason-org/mason-registry",
      },
    }
  },
  {
    "williamboman/mason-lspconfig.nvim",
    opts = {
      ensure_installed = { "lua_ls", "stylua", "eslint_d", "prettierd", "rust_analyzer" }
    },
  },
  {
    'stevearc/conform.nvim',
    opts = {
      format_on_save = {
        -- These options will be passed to conform.format()
        timeout_ms = 500,
        lsp_format = "fallback",
      },
    },
  },
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      'saghen/blink.cmp',
      {
        "folke/lazydev.nvim",
        opts = {
          library = {
            { path = "${3rd}/luv/library", words = { "vim%.uv" } },
          },
        },
        ft = "lua"
      },
    },
    config = function()
      local capabilities = require('blink.cmp').get_lsp_capabilities()
      local lspconfig = require("lspconfig")

      lspconfig.lua_ls.setup { capabilities = capabilities }
      lspconfig.rust_analyzer.setup { capabilities = capabilities }
    end,
  }
}
