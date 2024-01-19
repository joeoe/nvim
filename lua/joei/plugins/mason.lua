return {
	"williamboman/mason.nvim",
	dependencies = {
		"williamboman/mason-lspconfig.nvim",
		"WhoIsSethDaniel/mason-tool-installer.nvim",
		"jay-babu/mason-nvim-dap.nvim",
	},
	config = function()
		local mason = require("mason")
		local mason_lspconfig = require("mason-lspconfig")
		local mason_tool_installer = require("mason-tool-installer")
		local mason_dap = require("mason-nvim-dap")

		mason.setup({
			ui = {
				icons = {
					package_installed = "✓",
					package_pending = "➜",
					package_uninstalled = "✗",
				},
			},
		})

		mason_lspconfig.setup({
			ensure_installed = {
				"tsserver",
				"html",
				"cssls",
				"tailwindcss",
				"lua_ls",
				"rust_analyzer",
			},
			automatic_installation = true, -- not the same as ensure_installed
		})

		mason_tool_installer.setup({
			ensure_installed = {
				"prettier", -- prettier formatter
				"stylua", -- lua formatter
				"eslint_d", -- js linter
			},
		})

		mason_dap.setup({
			ensure_installed = {},
			handlers = {
				function(config)
					-- all sources with no handler get passed here
					-- Keep original functionality
					require("mason-nvim-dap").default_setup(config)
				end,
			},
		})

		local lspconfig = require("lspconfig")
		local capabilities = require("cmp_nvim_lsp").default_capabilities(vim.lsp.protocol.make_client_capabilities())
		-- capabilities.textDocument.completion.completionItem.snippetSupport = true
		capabilities.textDocument.foldingRange = { dynamicRegistration = false, lineFoldingOnly = true }

		mason_lspconfig.setup_handlers({
			-- default handler
			function(server_name)
				lspconfig[server_name].setup({
					capabilities,
				})
			end,

			["lua_ls"] = function()
				lspconfig.lua_ls.setup({
					capabilities,
					on_init = function(client)
						local path = client.workspace_folders[1].name
						if
							not vim.loop.fs_stat(path .. "/.luarc.json")
							and not vim.loop.fs_stat(path .. "/.luarc.jsonc")
						then
							client.config.settings = vim.tbl_deep_extend("force", client.config.settings, {
								Lua = {
									runtime = {
										version = "LuaJIT",
									},
									workspace = {
										checkThirdParty = false,
										library = {
											vim.env.VIMRUNTIME,
										},
									},
									diagnostics = {
										globals = {
											"vim",
										},
									},
								},
							})

							client.notify("workspace/didChangeConfiguration", { settings = client.config.settings })
						end
						return true
					end,
				})
			end,

			["rust_analyzer"] = function()
				lspconfig.rust_analyzer.setup({
					capabilities,
					settings = {
						["rust-analyzer"] = {
							assist = {
								importMergeBehavior = "last",
								importPrefix = "by_self",
							},
							diagnostics = {
								disabled = { "unresolved-import" },
							},
							cargo = {
								loadOutDirsFromCheck = true,
							},
							procMacro = {
								enable = true,
							},
							checkOnSave = {
								command = "clippy",
							},
						},
					},
				})
			end,

			["tsserver"] = function()
				lspconfig.tsserver.setup({
					capabilities,
					init_options = {
						preferences = {
							diagnosticOptions = {
								enable = true,
								exclude = { "**/node_modules/**" },
							},
						},
					},
				})
			end,

			["clangd"] = function()
				lspconfig.clangd.setup({
					capabilities,
					cmd = {
						"clangd",
						-- "--log=verbose",
					},
				})
			end,

			["jsonls"] = function()
				local capabilities = capabilities
				capabilities.textDocument.completion.completionItem.snippetSupport = true
				lspconfig.jsonls.setup({
					capabilities,
				})
			end,
		})
	end,
}
