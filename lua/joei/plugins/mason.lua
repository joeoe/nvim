return {
  enabled = true,
  'williamboman/mason.nvim',
  dependencies = {
    'folke/neodev.nvim',
    'folke/neoconf.nvim',
    'williamboman/mason-lspconfig.nvim',
    'WhoIsSethDaniel/mason-tool-installer.nvim',
    'jay-babu/mason-nvim-dap.nvim',
  },
  config = function()
    require('neodev').setup {}
    require('neoconf').setup {}
    require('mason').setup {
      ui = {
        icons = {
          package_installed = '✓',
          package_pending = '➜',
          package_uninstalled = '✗',
        },
      },
    }

    local mason_lspconfig = require 'mason-lspconfig'
    mason_lspconfig.setup {
      ensure_installed = {
        -- "tsserver",
        'html',
        'cssls',
        -- "tailwindcss",
        'lua_ls',
        'rust_analyzer',
        'gopls',
      },
      automatic_installation = true, -- not the same as ensure_installed
    }

    require('mason-tool-installer').setup {
      ensure_installed = {
        'prettier', -- prettier formatter
        'stylua', -- lua formatter
        'eslint_d', -- js linter
      },
    }

    require('mason-nvim-dap').setup {
      ensure_installed = {},
      handlers = {
        function(config)
          -- all sources with no handler get passed here
          -- Keep original functionality
          require('mason-nvim-dap').default_setup(config)
        end,
      },
      automatic_installation = true,
    }

    local lspconfig = require 'lspconfig'

    local capabilities = require('cmp_nvim_lsp').default_capabilities(vim.lsp.protocol.make_client_capabilities())
    -- capabilities.textDocument.completion.completionItem.snippetSupport = true
    capabilities.textDocument.foldingRange = { dynamicRegistration = false, lineFoldingOnly = true }

    local border = 'single'
    -- single, double, rounded, solid, shadow

    local handlers = {
      -- ['textDocument/hover'] = vim.lsp.with(vim.lsp.handlers.hover, { border = border }),
      -- ['textDocument/signatureHelp'] = vim.lsp.with(vim.lsp.handlers.signature_help, { border = border }),
    }

    mason_lspconfig.setup_handlers {
      -- default handler
      function(server_name)
        lspconfig[server_name].setup {
          capabilities = capabilities,
          handlers = handlers,
        }
      end,

      ['lua_ls'] = function()
        lspconfig.lua_ls.setup {
          capabilities = capabilities,
          handlers = handlers,
          settings = {
            Lua = {
              runtime = { version = 'LuaJIT' },
              workspace = {
                checkThirdParty = false,
                -- Tells lua_ls where to find all the Lua files that you have loaded
                -- for your neovim configuration.
                library = {
                  '${3rd}/luv/library',
                  unpack(vim.api.nvim_get_runtime_file('', true)),
                },
                -- If lua_ls is really slow on your computer, you can try this instead:
                -- library = { vim.env.VIMRUNTIME },
              },
              completion = {
                callSnippet = 'Replace',
              },
              -- You can toggle below to ignore Lua_LS's noisy `missing-fields` warnings
              diagnostics = { disable = { 'missing-fields' } },
            },
          },
        }
      end,

      ['rust_analyzer'] = function()
        lspconfig.rust_analyzer.setup {
          capabilities = capabilities,
          handlers = handlers,
          cmd = {
            'rustup',
            'run',
            'stable',
            'rust-analyzer',
          },
          settings = {
            ['rust-analyzer'] = {
              assist = {
                importMergeBehavior = 'last',
                importPrefix = 'by_self',
              },
              diagnostics = {
                disabled = { 'unresolved-import' },
              },
              cargo = {
                loadOutDirsFromCheck = true,
              },
              procMacro = {
                enable = true,
              },
              checkOnSave = {
                command = 'clippy',
              },
            },
          },
        }
      end,

      ['tsserver'] = function()
        lspconfig.tsserver.setup {
          capabilities = capabilities,
          handlers = handlers,
          init_options = {
            plugins = {
              {
                name = '@vue/typescript-plugin',
                location = 'any/path',
                languages = { 'javascript', 'typescript', 'vue' },
              },
            },
            preferences = {
              diagnosticOptions = {
                enable = true,
                exclude = { '**/node_modules/**' },
              },
            },
          },
          filetypes = { 'javascript', 'javascriptreact', 'javascript.jsx', 'typescript', 'typescriptreact', 'typescript.tsx', 'vue' },
          -- root_dir = require('lspconfig.util').root_pattern('.git', 'tsconfig.json', 'package.json', 'jsconfig.json'),
        }
      end,

      ['volar'] = function()
        lspconfig.volar.setup {
          capabilities = capabilities,
          handlers = handlers,
          filetypes = { 'typescript', 'javascript', 'javascriptreact', 'typescriptreact', 'vue', 'json' },
          -- root_dir = require('lspconfig.util').root_pattern('.git', 'package.json'),
        }
      end,

      ['clangd'] = function()
        lspconfig.clangd.setup {
          capabilities = capabilities,
          handlers = handlers,
          cmd = {
            'clangd',
            -- "--log=verbose",
          },
        }
      end,

      ['jsonls'] = function()
        local cap = capabilities
        cap.textDocument.completion.completionItem.snippetSupport = true
        lspconfig.jsonls.setup {
          capabilities = cap,
          handlers = handlers,
        }
      end,
    }
  end,
}
