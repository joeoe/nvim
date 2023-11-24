return {
	"neovim/nvim-lspconfig",
	event = { "BufReadPre", "BufNewFile" },
	dependencies = {
		"williamboman/mason.nvim",
		"williamboman/mason-lspconfig.nvim",
		"WhoIsSethDaniel/mason-tool-installer.nvim",
		"hrsh7th/cmp-nvim-lsp",
		{ "antosha417/nvim-lsp-file-operations", config = true },
	},
	config = function()
		local lspconfig = require("lspconfig")
		local mason = require("mason")
		local mason_lspconfig = require("mason-lspconfig")
		local mason_tool_installer = require("mason-tool-installer")
		local capabilities = require("cmp_nvim_lsp").default_capabilities(vim.lsp.protocol.make_client_capabilities())
		capabilities.textDocument.completion.completionItem.snippetSupport = true
		capabilities.textDocument.foldingRange = {
			dynamicRegistration = false,
			lineFoldingOnly = true,
		}
		vim.diagnostic.config({
			virtual_text = false,
		})

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
				-- "cssls",
				-- "tailwindcss",
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

		-- Global mappings.
		-- See `:help vim.diagnostic.*` for documentation on any of the below functions
		vim.keymap.set("n", "<space>e", vim.diagnostic.open_float, { desc = "Open diagnostic float" })
		vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, { desc = "Previous diagnostic" })
		vim.keymap.set("n", "]d", vim.diagnostic.goto_next, { desc = "Next diagnostic" })
		vim.keymap.set("n", "<space>q", vim.diagnostic.setloclist, { desc = "Diagnostic loclist" })

		-- Use LspAttach autocommand to only map the following keys
		-- after the language server attaches to the current buffer
		vim.api.nvim_create_autocmd("LspAttach", {
			group = vim.api.nvim_create_augroup("UserLspConfig", {}),
			callback = function(ev)
				-- Enable completion triggered by <c-x><c-o>
				vim.bo[ev.buf].omnifunc = "v:lua.vim.lsp.omnifunc"

				-- Buffer local mappings.
				vim.keymap.set("n", "gD", vim.lsp.buf.declaration, { buffer = ev.buf, desc = "Go to declaration" })
				vim.keymap.set("n", "gd", vim.lsp.buf.definition, { buffer = ev.buf, desc = "Go to definition" })
				vim.keymap.set(
					"n",
					"<leader>D",
					vim.lsp.buf.type_definition,
					{ buffer = ev.buf, desc = "Go to type definition" }
				)
				vim.keymap.set("n", "K", vim.lsp.buf.hover, { buffer = ev.buf, desc = "Hover" })
				vim.keymap.set(
					"n",
					"gi",
					vim.lsp.buf.implementation,
					{ buffer = ev.buf, desc = "Go to implementation" }
				)
				vim.keymap.set("n", "<C-k>", vim.lsp.buf.signature_help, { buffer = ev.buf, desc = "Signature help" })
				vim.keymap.set(
					"n",
					"<leader>wa",
					vim.lsp.buf.add_workspace_folder,
					{ buffer = ev.buf, desc = "Add workspace folder" }
				)
				vim.keymap.set(
					"n",
					"<leader>wr",
					vim.lsp.buf.remove_workspace_folder,
					{ buffer = ev.buf, desc = "Remove workspace folder" }
				)
				vim.keymap.set("n", "<leader>wl", function()
					print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
				end, { buffer = ev.buf, desc = "List workspace folder" })
				vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, { buffer = ev.buf, desc = "Rename" })
				vim.keymap.set(
					{ "n", "v" },
					"<leader>ca",
					vim.lsp.buf.code_action,
					{ buffer = ev.buf, desc = "Code action" }
				)
				vim.keymap.set("n", "gr", vim.lsp.buf.references, { buffer = ev.buf, desc = "References" })
				vim.keymap.set("n", "<leader>F", function()
					vim.lsp.buf.format({ async = true })
				end, { buffer = ev.buf, desc = "Format buffer" })
				vim.keymap.set("n", "<leader>rs", ":LspRestart<cr>", { buffer = ev.buf, desc = "Restart LSP" })
			end,
		})

		mason_lspconfig.setup_handlers({
			-- The first entry (without a key) will be the default handler
			-- and will be called for each installed server that doesn't have
			-- a dedicated handler.
			function(server_name) -- default handler (optional)
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
										-- Tell the language server which version of Lua you're using
										-- (most likely LuaJIT in the case of Neovim)
										version = "LuaJIT",
									},
									-- Make the server aware of Neovim runtime files
									workspace = {
										checkThirdParty = false,
										library = {
											vim.env.VIMRUNTIME,
											-- "${3rd}/luv/library"
											-- "${3rd}/busted/library",
										},
										-- or pull in all of 'runtimepath'. NOTE: this is a lot slower
										-- library = vim.api.nvim_get_runtime_file("", true)
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
				})
			end,
		})
	end,
}
