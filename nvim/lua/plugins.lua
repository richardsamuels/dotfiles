return {
	{
		"tpope/vim-sleuth", -- Detect tabstop and shiftwidth automatically
	},
	{ -- Adds git related signs to the gutter, as well as utilities for managing changes
		"lewis6991/gitsigns.nvim",
		opts = {
			signs = {
				add = { text = "+" },
				change = { text = "~" },
				delete = { text = "_" },
				topdelete = { text = "‾" },
				changedelete = { text = "~" },
			},
		},
	},
	{
		"catppuccin/nvim",
		lazy = false,
		priority = 1000,
		options = {},
		config = function()
			vim.cmd([[colorscheme catppuccin]])
			vim.cmd([[hi ColorColumn guibg=#313244]])
			vim.cmd([[hi PMenu guibg=#313244]])
			vim.cmd([[hi CursorLine guibg=#313244]])
			vim.cmd([[hi LineNr guifg=#9191a6]])
			vim.cmd([[hi Comment guifg=#6f7077]])
			vim.cmd([[hi Visual guibg=#524352]])
		end,
	},
	--{
	--	"davidosomething/vim-colors-meh",
	--	lazy = false,
	--	priority = 1000,
	--	options = {},
	--	config = function()
	--		vim.cmd([[colorscheme meh]])
	--		--vim.cmd([[hi ColorColumn guibg=#313244]])
	--		--vim.cmd([[hi PMenu guibg=#313244]])
	--		--vim.cmd([[hi CursorLine guibg=#313244]])
	--		--vim.cmd([[hi LineNr guifg=#9191a6]])
	--		--vim.cmd([[hi Comment guifg=#6f7077]])
	--		--vim.cmd([[hi Visual guibg=#524352]])
	--	end,
	--},
	--{
	--	"phha/zenburn.nvim",
	--	lazy = false,
	--	priority = 1000,
	--	options = {},
	--	config = function()
	--		vim.cmd([[colorscheme zenburn]])
	--		--vim.cmd([[hi ColorColumn guibg=#313244]])
	--		--vim.cmd([[hi PMenu guibg=#313244]])
	--		--vim.cmd([[hi CursorLine guibg=#313244]])
	--		--vim.cmd([[hi LineNr guifg=#9191a6]])
	--		--vim.cmd([[hi Comment guifg=#6f7077]])
	--		--vim.cmd([[hi Visual guibg=#524352]])
	--	end,
	--},
	{
		"sindrets/diffview.nvim",
	},
	{
		"junegunn/vim-easy-align",
	},
	{
		"williamboman/mason.nvim",
		build = ":MasonUpdate",
		priority = 900,
		config = function()
			require("mason").setup({
				ensure_installed = {
					"clangd",
					"lua-language-server",
					"svelte-language-server",
					"stylua",
					"jedi-language-server",
				},
				automatic_installation = true,
				handlers = nil,
			})
		end,
	},
	--{
	--	"lvimuser/lsp-inlayhints.nvim",
	--	config = function()
	--		require("lsp-inlayhints").setup()
	--		vim.api.nvim_create_augroup("LspAttach_inlayhints", {})
	--		vim.api.nvim_create_autocmd("LspAttach", {
	--			group = "LspAttach_inlayhints",
	--			callback = function(args)
	--				if not (args.data and args.data.client_id) then
	--					return
	--				end

	--				local bufnr = args.buf
	--				local client = vim.lsp.get_client_by_id(args.data.client_id)
	--				require("lsp-inlayhints").on_attach(client, bufnr)
	--			end,
	--		})
	--	end,
	--},
	--{
	--	"chrisgrieser/nvim-lsp-endhints",
	--	event = "LspAttach",
	--	opts = {
	--		type = ": ",
	--		parameter = ": ",
	--	},
	--},
	{
		"felpafel/inlay-hint.nvim",
		event = "LspAttach",
		config = true,
	},
	{
		"nvim-focus/focus.nvim",
		lazy = false,
		priority = 900,
		version = "*",
		config = function()
			local focus = require("focus")
			focus.setup()
			vim.keymap.set("n", "<S-L>", function()
				focus.split_nicely()
			end, { desc = "split nicely" })
		end,
	},
	{
		"lukas-reineke/indent-blankline.nvim",
		lazy = false,
		priority = 900,
		init = function()
			--vim.cmd([[hi IblScope guibg=#073642 guifg=#073642]])
			--vim.cmd([[hi IblWhitespace guibg=none guifg=#073642]])
			--vim.cmd([[hi IblIndent guibg=#073642 guifg=#073642]])
		end,
		config = function()
			--local hooks = require "ibl.hooks"
			--hooks.register(hooks.type.HIGHLIGHT_SETUP, function()
			--    vim.api.nvim_set_hl(0, "IblScope", { fg = "none", bg = "#002b36" })
			--    vim.api.nvim_set_hl(0, "IblWhitespace", { fg = "#073642", bg = "none" })
			--    vim.api.nvim_set_hl(0, "IblIndent", { fg = "none", bg = "#073642" })
			--end)

			require("ibl").setup({
				scope = {
					enabled = true,
				},
			})
		end,
	},
	{
		"rcarriga/nvim-dap-ui",
		dependencies = {
			{
				"mfussenegger/nvim-dap",
				"nvim-neotest/nvim-nio",
				priority = 800,
			},
		},
		config = function()
			require("dapui").setup()

			local dap, dapui = require("dap"), require("dapui")
			dap.listeners.before.attach.dapui_config = function()
				dapui.open()
			end
			dap.listeners.before.launch.dapui_config = function()
				dapui.open()
			end
			dap.listeners.before.event_terminated.dapui_config = function()
				dapui.close()
			end
			dap.listeners.before.event_exited.dapui_config = function()
				dapui.close()
			end
		end,
	},
	--{
	--	"nvim-lualine/lualine.nvim",
	--	dependencies = { "nvim-tree/nvim-web-devicons" },
	--	config = function()
	--		require("lualine").setup({
	--			sections = {
	--				lualine_c = {
	--					{
	--						"filename",
	--						path = 1,
	--					},
	--				},
	--			},
	--		})
	--	end,
	--},
	{
		"nvim-treesitter/nvim-treesitter",
		lazy = false,
		priority = 900,
		config = function()
			require("nvim-treesitter.configs").setup({
				ensure_installed = { "c", "lua", "vim", "vimdoc", "rust", "elixir" },
				highlight = { enable = true, additional_vim_regex_highlighting = { "ruby" } },
				indent = {
					enable = true,
					disable = { "go", "python", "ruby" },
				},
				rainbow = { enable = true, extended_mode = true },
			})
		end,
		dependencies = {
			"JoosepAlviste/nvim-ts-context-commentstring", -- allow comments in mixed content files like jsx, html and svelte
			"windwp/nvim-ts-autotag", -- autoclose html tags
		},
	},
	{ -- Collection of various small independent plugins/modules
		"echasnovski/mini.nvim",
		config = function()
			-- Better Around/Inside textobjects
			--
			-- Examples:
			--  - va)  - [V]isually select [A]round [)]paren
			--  - yinq - [Y]ank [I]nside [N]ext [Q]uote
			--  - ci'  - [C]hange [I]nside [']quote
			require("mini.ai").setup({ n_lines = 500 })

			-- Add/delete/replace surroundings (brackets, quotes, etc.)
			--
			-- - saiw) - [S]urround [A]dd [I]nner [W]ord [)]Paren
			-- - sd'   - [S]urround [D]elete [']quotes
			-- - sr)'  - [S]urround [R]eplace [)] [']
			--require("mini.surround").setup()

			-- Simple and easy statusline.
			--  You could remove this setup call if you don't like it,
			--  and try some other statusline plugin
			local statusline = require("mini.statusline")
			-- set use_icons to true if you have a Nerd Font
			statusline.setup({ use_icons = vim.g.have_nerd_font })

			-- You can configure sections in the statusline by overriding their
			-- default behavior. For example, here we set the section for
			-- cursor location to LINE:COLUMN
			---@diagnostic disable-next-line: duplicate-set-field
			statusline.section_location = function()
				return "%2l:%-2v"
			end

			-- ... and there is more!
			--  Check out: https://github.com/echasnovski/mini.nvim
		end,
	},
	{
		"mhinz/vim-startify",
		init = function()
			vim.g.startify_custom_header = { "NeoVIM" }
			vim.g.startify_custom_header_quotes = { { "" } }
			vim.g.startify_bookmarks = {
				"~/.config/nvim/init.lua",
				"~/.config/nvim/lua/plugins.lua",
			}
		end,
	},

	"godlygeek/tabular",

	-- Surround
	"tpope/vim-surround",

	{
		"windwp/nvim-autopairs",
		event = "InsertEnter",
		opts = {}, -- this is equalent to setup({}) function
	},

	-- Reveals trailing whitespace
	"ntpeters/vim-better-whitespace",

	-- Rainbow Parens
	"luochen1990/rainbow",
	{
		"mrcjkb/rustaceanvim",
		dependencies = {
			"rust-lang/rust.vim",
			"mfussenegger/nvim-dap",
		},
		version = "^4", -- Recommended
		ft = { "rust" },
		config = function()
			--vim.g.rustfmt_autosave = 1
			vim.keymap.set("n", "<leader>rh", function()
				vim.cmd.RustLsp({ "hover", "actions" })
			end, {})
			vim.keymap.set("n", "<leader>re", function()
				vim.cmd.RustLsp("explainError")
			end, {})
		end,
	},
	{
		"ray-x/go.nvim",
		dependencies = { -- optional packages
			"ray-x/guihua.lua",
			"neovim/nvim-lspconfig",
			"nvim-treesitter/nvim-treesitter",
		},
		config = function()
			require("go").setup()
		end,
		event = { "CmdlineEnter" },
		ft = { "go", "gomod" },
		build = ':lua require("go.install").update_all_sync()', -- if you need to install/update all binaries
	},
	{
		"neovim/nvim-lspconfig",
		dependencies = {
			{
				"folke/neodev.nvim",
				opts = {},
			},
			-- Automatically install LSPs and related tools to stdpath for Neovim
			-- Mason must be loaded before its dependents so we need to set it up here.
			-- NOTE: `opts = {}` is the same as calling `require('mason').setup({})`
			{ "williamboman/mason.nvim", opts = {} },
			"williamboman/mason-lspconfig.nvim",
			"WhoIsSethDaniel/mason-tool-installer.nvim",

			-- Useful status updates for LSP.
			{ "j-hui/fidget.nvim", opts = {} },

			-- Allows extra capabilities provided by nvim-cmp
			"hrsh7th/cmp-nvim-lsp",
			"felpafel/inlay-hint.nvim",
		},
		priority = 800,
		config = function()
			require("inlay-hint").setup()
			vim.api.nvim_create_autocmd("LspAttach", {
				group = vim.api.nvim_create_augroup("kickstart-lsp-attach", { clear = true }),
				callback = function(event)
					-- NOTE: Remember that Lua is a real programming language, and as such it is possible
					-- to define small helper and utility functions so you don't have to repeat yourself.
					--
					-- In this case, we create a function that lets us more easily define mappings specific
					-- for LSP related items. It sets the mode, buffer and description for us each time.
					local map = function(keys, func, desc, mode)
						mode = mode or "n"
						vim.keymap.set(mode, keys, func, { buffer = event.buf, desc = "LSP: " .. desc })
					end

					-- Jump to the definition of the word under your cursor.
					--  This is where a variable was first declared, or where a function is defined, etc.
					--  To jump back, press <C-t>.
					map("gd", require("telescope.builtin").lsp_definitions, "[G]oto [D]efinition")

					-- Find references for the word under your cursor.
					map("gr", require("telescope.builtin").lsp_references, "[G]oto [R]eferences")

					-- Jump to the implementation of the word under your cursor.
					--  Useful when your language has ways of declaring types without an actual implementation.
					map("gI", require("telescope.builtin").lsp_implementations, "[G]oto [I]mplementation")

					-- Jump to the type of the word under your cursor.
					--  Useful when you're not sure what type a variable is and you want to see
					--  the definition of its *type*, not where it was *defined*.
					map("<leader>D", require("telescope.builtin").lsp_type_definitions, "Type [D]efinition")

					-- Fuzzy find all the symbols in your current document.
					--  Symbols are things like variables, functions, types, etc.
					map("<leader>ds", require("telescope.builtin").lsp_document_symbols, "[D]ocument [S]ymbols")

					-- Fuzzy find all the symbols in your current workspace.
					--  Similar to document symbols, except searches over your entire project.
					map(
						"<leader>ws",
						require("telescope.builtin").lsp_dynamic_workspace_symbols,
						"[W]orkspace [S]ymbols"
					)

					-- Rename the variable under your cursor.
					--  Most Language Servers support renaming across files, etc.
					map("<leader>rn", vim.lsp.buf.rename, "[R]e[n]ame")

					-- Execute a code action, usually your cursor needs to be on top of an error
					-- or a suggestion from your LSP for this to activate.
					map("<leader>ca", vim.lsp.buf.code_action, "[C]ode [A]ction", { "n", "x" })

					-- WARN: This is not Goto Definition, this is Goto Declaration.
					--  For example, in C this would take you to the header.
					map("gD", vim.lsp.buf.declaration, "[G]oto [D]eclaration")

					-- This function resolves a difference between neovim nightly (version 0.11) and stable (version 0.10)
					---@param client vim.lsp.Client
					---@param method vim.lsp.protocol.Method
					---@param bufnr? integer some lsp support methods only in specific files
					---@return boolean
					local function client_supports_method(client, method, bufnr)
						if vim.fn.has("nvim-0.11") == 1 then
							return client:supports_method(method, bufnr)
						else
							return client.supports_method(method, { bufnr = bufnr })
						end
					end

					-- The following two autocommands are used to highlight references of the
					-- word under your cursor when your cursor rests there for a little while.
					--    See `:help CursorHold` for information about when this is executed
					--
					-- When you move your cursor, the highlights will be cleared (the second autocommand).
					--local client = vim.lsp.get_client_by_id(event.data.client_id)
					--if
					--	client
					--	and client_supports_method(
					--		client,
					--		vim.lsp.protocol.Methods.textDocument_documentHighlight,
					--		event.buf
					--	)
					--then
					--	local highlight_augroup =
					--		vim.api.nvim_create_augroup("kickstart-lsp-highlight", { clear = false })
					--	vim.api.nvim_create_autocmd({ "CursorHold", "CursorHoldI" }, {
					--		buffer = event.buf,
					--		group = highlight_augroup,
					--		callback = vim.lsp.buf.document_highlight,
					--	})

					--	vim.api.nvim_create_autocmd({ "CursorMoved", "CursorMovedI" }, {
					--		buffer = event.buf,
					--		group = highlight_augroup,
					--		callback = vim.lsp.buf.clear_references,
					--	})

					--	vim.api.nvim_create_autocmd("LspDetach", {
					--		group = vim.api.nvim_create_augroup("kickstart-lsp-detach", { clear = true }),
					--		callback = function(event2)
					--			vim.lsp.buf.clear_references()
					--			vim.api.nvim_clear_autocmds({ group = "kickstart-lsp-highlight", buffer = event2.buf })
					--		end,
					--	})
					--end

					-- The following code creates a keymap to toggle inlay hints in your
					-- code, if the language server you are using supports them
					--
					-- This may be unwanted, since they displace some of your code
					if
						client
						and client_supports_method(client, vim.lsp.protocol.Methods.textDocument_inlayHint, event.buf)
					then
						map("<leader>th", function()
							vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled({ bufnr = event.buf }))
						end, "[T]oggle Inlay [H]ints")
					end
					vim.api.nvim_create_autocmd("LspAttach", {
						callback = function(args)
							local bufnr = args.buf ---@type number
							local client = vim.lsp.get_client_by_id(args.data.client_id)
							if client.supports_method("textDocument/inlayHint") then
								vim.lsp.inlay_hint.enable(true, { bufnr = bufnr })
								vim.keymap.set("n", "<leader>i", function()
									vim.lsp.inlay_hint.enable(
										not vim.lsp.inlay_hint.is_enabled({ bufnr = bufnr }),
										{ bufnr = bufnr }
									)
								end, { buffer = bufnr })
							end
						end,
					})
				end,
			})

			-- Diagnostic Config
			-- See :help vim.diagnostic.Opts
			vim.diagnostic.config({
				severity_sort = true,
				float = { border = "rounded", source = "if_many" },
				underline = { severity = vim.diagnostic.severity.ERROR },
				signs = vim.g.have_nerd_font and {
					text = {
						[vim.diagnostic.severity.ERROR] = "󰅚 ",
						[vim.diagnostic.severity.WARN] = "󰀪 ",
						[vim.diagnostic.severity.INFO] = "󰋽 ",
						[vim.diagnostic.severity.HINT] = "󰌶 ",
					},
				} or {},
				virtual_text = {
					source = "if_many",
					spacing = 2,
					format = function(diagnostic)
						local diagnostic_message = {
							[vim.diagnostic.severity.ERROR] = diagnostic.message,
							[vim.diagnostic.severity.WARN] = diagnostic.message,
							[vim.diagnostic.severity.INFO] = diagnostic.message,
							[vim.diagnostic.severity.HINT] = diagnostic.message,
						}
						return diagnostic_message[diagnostic.severity]
					end,
				},
			})

			-- LSP servers and clients are able to communicate to each other what features they support.
			--  By default, Neovim doesn't support everything that is in the LSP specification.
			--  When you add nvim-cmp, luasnip, etc. Neovim now has *more* capabilities.
			--  So, we create new capabilities with nvim cmp, and then broadcast that to the servers.
			local capabilities = vim.lsp.protocol.make_client_capabilities()
			--capabilities = vim.tbl_deep_extend("force", capabilities, require("cmp_nvim_lsp").default_capabilities())
			capabilities =
				vim.tbl_deep_extend("force", capabilities, require("blink.cmp").get_lsp_capabilities({}, false))
			--local capabilities = require("cmp_nvim_lsp").default_capabilities()

			require("neodev").setup({
				library = { plugins = { "nvim-dap-ui" }, types = true },
				capabilities = capabilities,
			})

			-- Enable the following language servers
			--  Feel free to add/remove any LSPs that you want here. They will automatically be installed.
			--
			--  Add any additional override configuration in the following tables. Available keys are:
			--  - cmd (table): Override the default command used to start the server
			--  - filetypes (table): Override the default list of associated filetypes for the server
			--  - capabilities (table): Override fields in capabilities. Can be used to disable certain LSP features.
			--  - settings (table): Override the default settings passed when initializing the server.
			--        For example, to see the options for `lua_ls`, you could go to: https://luals.github.io/wiki/settings/
			local servers = {
				gopls = {},
				clangd = {},
				svelte = {},
				jedi_language_server = {
					init_options = {
						completion = {
							resolveEagerly = true,
						},
						diagnostics = {
							enable = true,
						},
					},
					capabilities = capabilities,
				},
				lua_ls = {
					capabilities = capabilities,
					runtime = {
						-- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
						version = "LuaJIT",
					},
					diagnostics = {
						-- Get the language server to recognize the `vim` global
						globals = { "vim" },
					},
					workspace = {
						-- Make the server aware of Neovim runtime files
						library = vim.api.nvim_get_runtime_file("", true),
					},
					-- Do not send telemetry data containing a randomized but unique identifier
					telemetry = {
						enable = false,
					},
					settings = {
						Lua = {
							completion = {
								callSnippet = "Replace",
							},
							-- You can toggle below to ignore Lua_LS's noisy `missing-fields` warnings
							-- diagnostics = { disable = { 'missing-fields' } },
						},
					},
				},
			}
			local ensure_installed = vim.tbl_keys(servers or {})
			vim.list_extend(ensure_installed, {
				"stylua", -- Used to format Lua code
			})
			require("mason-tool-installer").setup({ ensure_installed = ensure_installed })

			require("mason-lspconfig").setup({
				ensure_installed = {}, -- explicitly set to an empty table (Kickstart populates installs via mason-tool-installer)
				automatic_installation = false,
				handlers = {
					function(server_name)
						local server = servers[server_name] or {}
						-- This handles overriding only values explicitly passed
						-- by the server configuration above. Useful when disabling
						-- certain features of an LSP (for example, turning off formatting for ts_ls)
						server.capabilities = vim.tbl_deep_extend("force", {}, capabilities, server.capabilities or {})
						require("lspconfig")[server_name].setup(server)
					end,
				},
			})
		end,
	},
	--{
	--	"mfussenegger/nvim-lint",
	--	event = { "BufReadPre", "BufNewFile" },
	--	config = function()
	--		local lint = require("lint")

	--		lint.linters_by_ft = {
	--			--javascript = { "eslint_d" },
	--			--typescript = { "eslint_d" },
	--			--javascriptreact = { "eslint_d" },
	--			--typescriptreact = { "eslint_d" },
	--			--svelte = { "eslint_d" },
	--			--python = { "pylint" },
	--		}
	--		local lint_augroup = vim.api.nvim_create_augroup("lint", { clear = true })

	--		vim.api.nvim_create_autocmd({ "BufEnter", "BufWritePost", "InsertLeave" }, {
	--			group = lint_augroup,
	--			callback = function()
	--				lint.try_lint()
	--			end,
	--		})
	--	end,
	--},
	{
		"stevearc/conform.nvim",
		event = { "BufReadPre", "BufNewFile" },
		cmd = { "ConformInfo" },
		opts = {
			notify_on_error = false,
			format_on_save = function(bufnr)
				-- Disable "format_on_save lsp_fallback" for languages that don't
				-- have a well standardized coding style. You can add additional
				-- languages here or re-enable it for the disabled ones.
				local disable_filetypes = { c = true, cpp = true }
				local lsp_format_opt
				if disable_filetypes[vim.bo[bufnr].filetype] then
					lsp_format_opt = "never"
				else
					lsp_format_opt = "fallback"
				end
				return {
					timeout_ms = 500,
					lsp_format = lsp_format_opt,
				}
			end,
			formatters_by_ft = {
				lua = { "stylua" },
				-- Conform will run multiple formatters sequentially
				-- python = { "isort", "black" },
				-- Use a sub-list to run only the first available formatter
				javascriptreact = { "prettierd", "prettier", stop_after_first = true },
				javascript = { "prettierd", "prettier", stop_after_first = true },
				typescriptreact = { "prettierd", "prettier", stop_after_first = true },
				typescript = { "prettierd", "prettier", stop_after_first = true },
				svelte = { "prettierd", "prettier", stop_after_first = true },
				rust = { "rustfmt" },
				go = { "gofmt", "goimports" },
				--sql = { "" },
			},
		},
	},
	{
		"nvim-telescope/telescope.nvim",
		tag = "0.1.5",
		branch = "0.1.x",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"nvim-telescope/telescope-fzy-native.nvim",
			{
				"nvim-telescope/telescope-live-grep-args.nvim",
				-- This will not install any breaking changes.
				-- For major updates, this must be adjusted manually.
				version = "^1.0.0",
			},
		},
		config = function()
			local telescope = require("telescope")
			telescope.setup({
				["ui-select"] = {
					require("telescope.themes").get_dropdown(),
				},
				extensions = {
					fzy_native = {
						override_generic_sorter = true,
						override_file_sorter = true,
					},
				},
				file_ignore_patterns = { "node%_modules/.*", "go/frp/*" },
			})
			pcall(require("telescope").load_extension, "ui-select")
			telescope.load_extension("fzy_native")
			local builtin = require("telescope.builtin")
			vim.keymap.set("n", "<leader>ff", builtin.find_files, { desc = "[F]ind [F]iles" })
			vim.keymap.set("n", "<leader>fg", builtin.live_grep, { desc = "live grep" })
			vim.keymap.set("n", "<leader>fb", builtin.buffers, { desc = "[F]ind [B]uffer" })
			vim.keymap.set("n", "<leader>fh", builtin.help_tags, { desc = "find in help tags" })

			vim.keymap.set("n", "<leader>sh", builtin.help_tags, { desc = "[S]earch [H]elp" })
			vim.keymap.set("n", "<leader>sk", builtin.keymaps, { desc = "[S]earch [K]eymaps" })
			vim.keymap.set("n", "<leader>sf", builtin.find_files, { desc = "[S]earch [F]iles" })
			vim.keymap.set("n", "<leader>ss", builtin.builtin, { desc = "[S]earch [S]elect Telescope" })
			vim.keymap.set("n", "<leader>sw", builtin.grep_string, { desc = "[S]earch current [W]ord" })
			vim.keymap.set("n", "<leader>sg", builtin.live_grep, { desc = "[S]earch by [G]rep" })
			vim.keymap.set("n", "<leader>sd", builtin.diagnostics, { desc = "[S]earch [D]iagnostics" })
			vim.keymap.set("n", "<leader>sr", builtin.resume, { desc = "[S]earch [R]esume" })
			vim.keymap.set("n", "<leader>s.", builtin.oldfiles, { desc = '[S]earch Recent Files ("." for repeat)' })
			vim.keymap.set("n", "<leader><leader>", builtin.buffers, { desc = "[ ] Find existing buffers" })

			telescope.load_extension("live_grep_args")
			vim.keymap.set(
				"n",
				"<leader>fg",
				":lua require('telescope').extensions.live_grep_args.live_grep_args()<CR>",
				{ desc = "live grep" }
			)
			vim.keymap.set("n", "<leader>/", function()
				-- You can pass additional configuration to Telescope to change the theme, layout, etc.
				builtin.current_buffer_fuzzy_find(require("telescope.themes").get_dropdown({
					winblend = 10,
					previewer = false,
				}))
			end, { desc = "[/] Fuzzily search in current buffer" })

			-- It's also possible to pass additional configuration options.
			--  See `:help telescope.builtin.live_grep()` for information about particular keys
			vim.keymap.set("n", "<leader>s/", function()
				builtin.live_grep({
					grep_open_files = true,
					prompt_title = "Live Grep in Open Files",
				})
			end, { desc = "[S]earch [/] in Open Files" })

			-- Shortcut for searching your Neovim configuration files
			vim.keymap.set("n", "<leader>sn", function()
				builtin.find_files({ cwd = vim.fn.stdpath("config") })
			end, { desc = "[S]earch [N]eovim files" })
		end,
	},
	{
		-- `lazydev` configures Lua LSP for your Neovim config, runtime and plugins
		-- used for completion, annotations and signatures of Neovim apis
		"folke/lazydev.nvim",
		ft = "lua",
		opts = {
			library = {
				-- Load luvit types when the `vim.uv` word is found
				{ path = "${3rd}/luv/library", words = { "vim%.uv" } },
			},
		},
	},
	{
		"folke/which-key.nvim",
		event = "VeryLazy",
		init = function()
			vim.o.timeout = true
			vim.o.timeoutlen = 300
		end,
		opts = {
			-- your configuration comes here
			-- or leave it empty to use the default settings
			-- refer to the configuration section below
			-- preset = "helix",
			expand = 20,
			replace = { desc = {} },
			delay = 100,
			icons = {
				-- set icon mappings to true if you have a Nerd Font
				mappings = vim.g.have_nerd_font,
				-- If you are using a Nerd Font: set icons.keys to an empty table which will use the
				-- default which-key.nvim defined Nerd Font icons, otherwise define a string table
				keys = vim.g.have_nerd_font and {} or {
					Up = "<Up> ",
					Down = "<Down> ",
					Left = "<Left> ",
					Right = "<Right> ",
					C = "<C-…> ",
					M = "<M-…> ",
					D = "<D-…> ",
					S = "<S-…> ",
					CR = "<CR> ",
					Esc = "<Esc> ",
					ScrollWheelDown = "<ScrollWheelDown> ",
					ScrollWheelUp = "<ScrollWheelUp> ",
					NL = "<NL> ",
					BS = "<BS> ",
					Space = "<Space> ",
					Tab = "<Tab> ",
					F1 = "<F1>",
					F2 = "<F2>",
					F3 = "<F3>",
					F4 = "<F4>",
					F5 = "<F5>",
					F6 = "<F6>",
					F7 = "<F7>",
					F8 = "<F8>",
					F9 = "<F9>",
					F10 = "<F10>",
					F11 = "<F11>",
					F12 = "<F12>",
				},
			},
			-- Document existing key chains
			spec = {
				{ "<leader>c", group = "[C]ode", mode = { "n", "x" } },
				{ "<leader>d", group = "[D]ocument" },
				{ "<leader>r", group = "[R]ename" },
				{ "<leader>s", group = "[S]earch" },
				{ "<leader>w", group = "[W]orkspace" },
				{ "<leader>t", group = "[T]oggle" },
				{ "<leader>h", group = "Git [H]unk", mode = { "n", "v" } },
			},
		},
	},
	{
		"iamcco/markdown-preview.nvim",
		cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
		ft = { "markdown" },
		build = function()
			vim.fn["mkdp#util#install"]()
		end,
	},
	{
		"lervag/vimtex",
		lazy = false,
	},
	{
		"frabjous/knap",
	},
	{
		"NeogitOrg/neogit",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"sindrets/diffview.nvim",
			"nvim-telescope/telescope.nvim",
		},
		config = true,
	},
	{
		"elixir-tools/elixir-tools.nvim",
		version = "*",
		event = { "BufReadPre", "BufNewFile" },
		config = function()
			local elixir = require("elixir")
			local elixirls = require("elixir.elixirls")

			elixir.setup({
				nextls = { enable = true },
				credo = {},
				elixirls = {
					enable = true,
					settings = elixirls.settings({
						dialyzerEnabled = false,
						enableTestLenses = false,
					}),
					on_attach = function(client, bufnr)
						vim.keymap.set("n", "<space>fp", ":ElixirFromPipe<cr>", { buffer = true, noremap = true })
						vim.keymap.set("n", "<space>tp", ":ElixirToPipe<cr>", { buffer = true, noremap = true })
						vim.keymap.set("v", "<space>em", ":ElixirExpandMacro<cr>", { buffer = true, noremap = true })
					end,
				},
			})
		end,
		dependencies = {
			"nvim-lua/plenary.nvim",
		},
	},
	{
		"elixir-editors/vim-elixir",
		event = { "BufReadPre", "BufNewFile" },
	},
	{
		"pmizio/typescript-tools.nvim",
		dependencies = { "nvim-lua/plenary.nvim", "neovim/nvim-lspconfig" },
		opts = {},
	},
	{
		"saghen/blink.cmp",
		priority = 850,
		lazy = false,
		-- optional: provides snippets for the snippet source
		dependencies = { "rafamadriz/friendly-snippets" },

		-- use a release tag to download pre-built binaries
		version = "1.*",
		-- AND/OR build from source, requires nightly: https://rust-lang.github.io/rustup/concepts/channels.html#working-with-nightly-rust
		-- build = 'cargo build --release',
		-- If you use nix, you can build from source using latest nightly rust with:
		-- build = 'nix run .#build-plugin',

		---@module 'blink.cmp'
		---@type blink.cmp.Config
		opts = {
			-- 'default' (recommended) for mappings similar to built-in completions (C-y to accept)
			-- 'super-tab' for mappings similar to vscode (tab to accept)
			-- 'enter' for enter to accept
			-- 'none' for no mappings
			--
			-- All presets have the following mappings:
			-- C-space: Open menu or open docs if already open
			-- C-n/C-p or Up/Down: Select next/previous item
			-- C-e: Hide menu
			-- C-k: Toggle signature help (if signature.enabled = true)
			--
			-- See :h blink-cmp-config-keymap for defining your own keymap
			keymap = {
				preset = "super-tab",
				["<C-k>"] = { "select_prev", "fallback" },
				["<C-j>"] = { "select_next", "fallback" },
				--["<Tab>"] = { "select_next", "fallback" },
				["<C-b>"] = { "scroll_documentation_up", "fallback" },
				["<C-f>"] = { "scroll_documentation_down", "fallback" },
				--["<C-Space>"] = cmp.mapping.complete(),
				["<C-e>"] = { "cancel", "fallback" },
				--["<CR>"] = { "accept", "fallback" },
			},

			appearance = {
				-- 'mono' (default) for 'Nerd Font Mono' or 'normal' for 'Nerd Font'
				-- Adjusts spacing to ensure icons are aligned
				nerd_font_variant = "mono",
			},

			-- (Default) Only show the documentation popup when manually triggered
			--completion = { documentation = { auto_show = false } },

			-- Default list of enabled providers defined so that you can extend it
			-- elsewhere in your config, without redefining it, due to `opts_extend`
			sources = {
				default = { "lsp", "path", "snippets", "buffer" },
			},

			-- (Default) Rust fuzzy matcher for typo resistance and significantly better performance
			-- You may use a lua implementation instead by using `implementation = "lua"` or fallback to the lua implementation,
			-- when the Rust fuzzy matcher is not available, by using `implementation = "prefer_rust"`
			--
			-- See the fuzzy documentation for more information
			fuzzy = { implementation = "prefer_rust_with_warning" },
		},
		opts_extend = { "sources.default" },
	},
	--{
	--	"hrsh7th/nvim-cmp",
	--	priority = 850,
	--	lazy = false,
	--	dependencies = {
	--		{
	--			"L3MON4D3/LuaSnip",
	--			build = (function()
	--				-- Build Step is needed for regex support in snippets.
	--				-- This step is not supported in many windows environments.
	--				-- Remove the below condition to re-enable on windows.
	--				if vim.fn.has("win32") == 1 or vim.fn.executable("make") == 0 then
	--					return
	--				end
	--				return "make install_jsregexp"
	--			end)(),
	--			dependencies = {
	--				-- `friendly-snippets` contains a variety of premade snippets.
	--				--    See the README about individual language/framework/plugin snippets:
	--				--    https://github.com/rafamadriz/friendly-snippets
	--				-- {
	--				--   'rafamadriz/friendly-snippets',
	--				--   config = function()
	--				--     require('luasnip.loaders.from_vscode').lazy_load()
	--				--   end,
	--				-- },
	--			},
	--		},
	--		"saadparwaiz1/cmp_luasnip",

	--		-- Adds other completion capabilities.
	--		--  nvim-cmp does not ship with all sources by default. They are split
	--		--  into multiple repos for maintenance purposes.
	--		"hrsh7th/cmp-nvim-lsp",
	--		"hrsh7th/cmp-path",
	--		"hrsh7th/cmp-nvim-lsp-signature-help",
	--		"hrsh7th/cmp-cmdline",
	--	},
	--	config = function()
	--		local cmp = require("cmp")

	--		local mapping = cmp.mapping.preset.insert({
	--			["<C-k>"] = cmp.mapping.select_prev_item(),
	--			["<C-j>"] = cmp.mapping.select_next_item(),
	--			["<Tab>"] = cmp.mapping.select_next_item(),
	--			["<C-b>"] = cmp.mapping.scroll_docs(-4),
	--			["<C-f>"] = cmp.mapping.scroll_docs(4),
	--			["<C-Space>"] = cmp.mapping.complete(),
	--			["<C-e>"] = cmp.mapping.abort(),
	--			["<CR>"] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
	--			-- Think of <c-l> as moving to the right of your snippet expansion.
	--			--  So if you have a snippet that's like:
	--			--  function $name($args)
	--			--    $body
	--			--  end
	--			--
	--			-- <c-l> will move you to the right of each of the expansion locations.
	--			-- <c-h> is similar, except moving you backwards.
	--			["<C-l>"] = cmp.mapping(function()
	--				if luasnip.expand_or_locally_jumpable() then
	--					luasnip.expand_or_jump()
	--				end
	--			end, { "i", "s" }),
	--			["<C-h>"] = cmp.mapping(function()
	--				if luasnip.locally_jumpable(-1) then
	--					luasnip.jump(-1)
	--				end
	--			end, { "i", "s" }),
	--		})
	--		cmp.setup({
	--			snippet = {
	--				-- REQUIRED - you must specify a snippet engine
	--				expand = function(args)
	--					-- vim.fn["vsnip#anonymous"](args.body) -- For `vsnip` users.
	--					-- require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
	--					-- require('snippy').expand_snippet(args.body) -- For `snippy` users.
	--					-- vim.fn["UltiSnips#Anon"](args.body) -- For `ultisnips` users.
	--					vim.snippet.expand(args.body) -- For native neovim snippets (Neovim v0.10+)
	--				end,
	--			},
	--			window = {
	--				-- completion = cmp.config.window.bordered(),
	--				-- documentation = cmp.config.window.bordered(),
	--			},
	--			mapping = mapping,
	--			sources = cmp.config.sources({
	--				{
	--					name = "lazydev",
	--					-- set group index to 0 to skip loading LuaLS completions as lazydev recommends it
	--					group_index = 0,
	--				},
	--				{ name = "nvim_lsp" },
	--				{ name = "luasnip" },
	--				{ name = "path" },
	--				{ name = "nvim_lsp_signature_help" },
	--				-- { name = "vsnip" }, -- For vsnip users.
	--				-- { name = 'luasnip' }, -- For luasnip users.
	--				-- { name = 'ultisnips' }, -- For ultisnips users.
	--				-- { name = 'snippy' }, -- For snippy users.
	--			}, {
	--				{ name = "buffer" },
	--			}),
	--		})

	--		-- To use git you need to install the plugin petertriho/cmp-git and uncomment lines below
	--		-- Set configuration for specific filetype.
	--		--[[ cmp.setup.filetype('gitcommit', {
	--                    sources = cmp.config.sources({
	--                    { name = 'git' },
	--                    }, {
	--                    { name = 'buffer' },
	--                    })
	--                })
	--                require("cmp_git").setup() ]]
	--		--

	--		-- Use buffer source for `/` and `?` (if you enabled `native_menu`, this won't work anymore).
	--		cmp.setup.cmdline({ "/", "?" }, {
	--			mapping = cmp.mapping.preset.cmdline(),
	--			sources = {
	--				{ name = "buffer" },
	--			},
	--		})

	--		-- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
	--		cmp.setup.cmdline(":", {
	--			mapping = cmp.mapping.preset.cmdline(),
	--			sources = cmp.config.sources({
	--				{ name = "path" },
	--			}, {
	--				{ name = "cmdline" },
	--			}),
	--			matching = { disallow_symbol_nonprefix_matching = false },
	--		})

	--		-- Set up lspconfig.
	--		local capabilities = require("cmp_nvim_lsp").default_capabilities()
	--		local lspconfig = require("lspconfig")
	--		-- Replace <YOUR_LSP_SERVER> with each lsp server you've enabled.
	--		--require("lspconfig")["<YOUR_LSP_SERVER>"].setup({
	--		--	capabilities = capabilities,
	--		--})
	--	end,
	--},
	{
		"epwalsh/obsidian.nvim",
		version = "*", -- recommended, use latest release instead of latest commit
		lazy = true,
		ft = "markdown",
		-- Replace the above line with this if you only want to load obsidian.nvim for markdown files in your vault:
		-- event = {
		--   -- If you want to use the home shortcut '~' here you need to call 'vim.fn.expand'.
		--   -- E.g. "BufReadPre " .. vim.fn.expand "~" .. "/my-vault/*.md"
		--   -- refer to `:h file-pattern` for more examples
		--   "BufReadPre path/to/my-vault/*.md",
		--   "BufNewFile path/to/my-vault/*.md",
		-- },
		dependencies = {
			-- Required.
			"nvim-lua/plenary.nvim",

			-- see below for full list of optional dependencies 👇
			"nvim-telescope/telescope.nvim",
			"hrsh7th/nvim-cmp",
		},
		opts = {
			ui = {
				enable = false,
			},
			workspaces = {
				{
					name = "appledore",
					path = "/Users/rsamuels/Documents/Obsidian/appledore",
				},
			},
			disable_frontmatter = function(file)
				if file:find("Templates/", 1, true) == 1 then
					return true
				end
				return false
			end,

			note_frontmatter_func = function(note)
				-- Add the title of the note as an alias.
				--
				if note.title then
					note:add_alias(note.title)
				end

				local out = { aliases = note.aliases, tags = note.tags }

				-- `note.metadata` contains any manually added fields in the frontmatter.
				-- So here we just make sure those fields are kept in the frontmatter.
				if note.metadata ~= nil and not vim.tbl_isempty(note.metadata) then
					for k, v in pairs(note.metadata) do
						out[k] = v
					end
				end

				return out
			end,

			-- Optional, completion of wiki links, local markdown links, and tags using nvim-cmp.
			completion = {
				-- Set to false to disable completion.
				nvim_cmp = true,
				-- Trigger completion at 2 chars.
				min_chars = 2,
			},

			-- Optional, configure key mappings. These are the defaults. If you don't want to set any keymappings this
			-- way then set 'mappings = {}'.
			mappings = {
				-- Overrides the 'gf' mapping to work on markdown/wiki links within your vault.
				["gf"] = {
					action = function()
						return require("obsidian").util.gf_passthrough()
					end,
					opts = { noremap = false, expr = true, buffer = true },
				},
				-- Toggle check-boxes.
				["<leader>ch"] = {
					action = function()
						return require("obsidian").util.toggle_checkbox()
					end,
					opts = { buffer = true },
				},
				-- Smart action depending on context, either follow link or toggle checkbox.
				["<cr>"] = {
					action = function()
						return require("obsidian").util.smart_action()
					end,
					opts = { buffer = true, expr = true },
				},
			}, -- see below for full list of options 👇
			-- Optional, set to true if you use the Obsidian Advanced URI plugin.
			-- https://github.com/Vinzent03/obsidian-advanced-uri
			use_advanced_uri = true,

			-- Optional, set to true to force ':ObsidianOpen' to bring the app to the foreground.
			open_app_foreground = true,
		},
	},
	{
		"tpope/vim-eunuch",
	},
	{
		"yetone/avante.nvim",
		event = "VeryLazy",
		lazy = false,
		version = false, -- Set this to "*" to always pull the latest release version, or set it to false to update to the latest code changes.
		opts = {
			-- add any opts here
			auto_suggestions_provider = "ollama", -- Since auto-suggestions are a high-frequency operation and therefore expensive, it is recommended to specify an inexpensive provider or even a free provider: copilot
			provider = "ollama2",
			vendors = {
				deepseek2 = {
					__inherited_from = "openai",
					api_key_name = "cmd:echo password123",
					endpoint = "http://localhost:8080/v1",
					--model = "hf.co/unsloth/DeepSeek-R1-Distill-Llama-8B-GGUF:Q8_0",
					temperature = 0.1,
					top_p = 0.5,
				},
				deepseek = {
					__inherited_from = "openai",
					api_key_name = "cmd:echo password123",
					endpoint = "http://localhost:5001/v1",
					--model = "hf.co/unsloth/DeepSeek-R1-Distill-Llama-8B-GGUF:Q8_0",
					temperature = 0.1,
					top_p = 0.5,
				},
				ollama2 = {
					__inherited_from = "openai",
					api_key_name = "cmd:echo password123",
					endpoint = "http://localhost:5001/v1",
					--model = "hf.co/unsloth/DeepSeek-R1-Distill-Llama-8B-GGUF:Q8_0",
					temperature = 0.1,
					top_p = 0.5,
				},
			},
			mappings = {
				--- @class AvanteConflictMappings
				diff = {
					ours = "co",
					theirs = "ct",
					all_theirs = "ca",
					both = "cb",
					cursor = "cc",
					next = "]x",
					prev = "[x",
				},
				suggestion = {
					accept = "<M-l>",
					next = "<M-]>",
					prev = "<M-[>",
					dismiss = "<C-]>",
				},
				jump = {
					next = "]]",
					prev = "[[",
				},
				submit = {
					normal = "<CR>",
					insert = "<C-s>",
				},
				sidebar = {
					apply_all = "A",
					apply_cursor = "a",
					switch_windows = "<Tab>",
					reverse_switch_windows = "<S-Tab>",
				},
			},
		},
		-- if you want to build from source then do `make BUILD_FROM_SOURCE=true`
		build = "make",
		-- build = "powershell -ExecutionPolicy Bypass -File Build.ps1 -BuildFromSource false" -- for windows
		dependencies = {
			"stevearc/dressing.nvim",
			"nvim-lua/plenary.nvim",
			"MunifTanjim/nui.nvim",
			--- The below dependencies are optional,
			--"echasnovski/mini.pick", -- for file_selector provider mini.pick
			"nvim-telescope/telescope.nvim", -- for file_selector provider telescope
			"hrsh7th/nvim-cmp", -- autocompletion for avante commands and mentions
			--"ibhagwan/fzf-lua", -- for file_selector provider fzf
			"nvim-tree/nvim-web-devicons", -- or echasnovski/mini.icons
			--"zbirenbaum/copilot.lua", -- for providers='copilot'
			--{
			--	-- support for image pasting
			--	"HakonHarnes/img-clip.nvim",
			--	event = "VeryLazy",
			--	opts = {
			--		-- recommended settings
			--		default = {
			--			embed_image_as_base64 = false,
			--			prompt_for_file_name = false,
			--			drag_and_drop = {
			--				insert_mode = true,
			--			},
			--			-- required for Windows users
			--			use_absolute_path = true,
			--		},
			--	},
			--},
			{
				-- Make sure to set this up properly if you have lazy=true
				"MeanderingProgrammer/render-markdown.nvim",
				opts = {
					file_types = { "markdown", "Avante" },
				},
				ft = { "markdown", "Avante" },
			},
		},
	},
}
-- vim: set foldmethod=indent :
-- vim: set foldlevelstart=1 :
