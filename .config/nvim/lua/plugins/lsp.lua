return {
  {
    "williamboman/mason.nvim",
    opts = {
      registries = {
        "github:mason-org/mason-registry",
      },
    }
  },
  "williamboman/mason-lspconfig.nvim",
  {
    "WhoIsSethDaniel/mason-tool-installer.nvim",
    opts = {
      ensure_installed = {
        "lua_ls", "rust_analyzer", "prettierd", "eslint_d", "misspell",
        "gopls", "typescript-language-server", "pyright", "black",
        "tailwindcss",
      }
    }
  },
  {
    'stevearc/conform.nvim',
    opts = {
      format_on_save = {
        timeout_ms = 1000,
        lsp_format = "fallback",
      },
      formatters = {
        black = {
          prepend_args = { '--fast' },
        }
      },
      formatters_by_ft = {
        javascript = { "prettierd" },
        typescript = { "prettierd" },
        typescriptreact = { "prettierd" },
        python = { "black" },
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

      local servers = {
        'lua_ls', 'rust_analyzer', 'gopls', 'ts_ls', 'pyright',
        'tailwindcss'
      }

      for _, server in ipairs(servers) do
        lspconfig[server].setup {
          capabilities = capabilities,
        }
      end
    end
  }
}
