return {
  "williamboman/mason.nvim",
  dependencies = {
    "williamboman/mason-lspconfig.nvim",
    "neovim/nvim-lspconfig",
    "jayp0521/mason-null-ls.nvim",
    "nvimtools/none-ls.nvim",
    "nvimtools/none-ls-extras.nvim",
  },

  config = function()
    require("mason").setup()
    local mason_lspconfig = require("mason-lspconfig")
    local mason_null_ls = require("mason-null-ls")
    local null_ls = require("null-ls")
    local capabilities = require("cmp_nvim_lsp").default_capabilities()
    local augroup = vim.api.nvim_create_augroup("LspFormatting", {})

    mason_lspconfig.setup({
      ensure_installed = {
        "cssls",
        "ember",
        "html",
        "lua_ls",
        "tailwindcss",
        "tsserver",
      },
      automatic_installation = true,
    })

    mason_lspconfig.setup_handlers({
      -- automatically setup default handlers
      function(server_name)
        require("lspconfig")[server_name].setup({
          capabilities = capabilities,
        })
      end,
    })

    mason_null_ls.setup({
      ensure_installed = {
        "prettier",
        "stylua",
        "eslint_d",
      },
      automatic_installation = true,
    })

    null_ls.setup({
      -- debug = true
      sources = {
        null_ls.builtins.formatting.stylua,
        null_ls.builtins.completion.spell,
        require("none-ls.diagnostics.eslint_d"),
      },
      on_attach = function(client, bufnr)
        -- doc'd out because of a change to nvim
        -- this is a good write up https://github.com/nvim-flutter/flutter-tools.nvim/issues/351
        -- if client.supports_method("textDocument/formatting") then
        vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
        vim.api.nvim_create_autocmd("BufWritePre", {
          group = augroup,
          buffer = bufnr,
          callback = function()
            vim.lsp.buf.format({ async = false })
          end,
        })
        -- end
      end,
    })
  end,
}
