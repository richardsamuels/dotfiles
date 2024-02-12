return {
    {
        "richardsamuels/solarized.nvim",
        lazy = false,
        branch = "rs",
        priority = 1000,
        config = function()
            vim.cmd([[colorscheme solarized]])
        end
    },
    {
        'nvim-focus/focus.nvim',
        lazy = false,
        priority = 900,
        version = '*',
        config = function()
            require("focus").setup()
            vim.keymap.set('n', '<S-L>', function()
                require('focus').split_nicely()
            end, { desc = 'split nicely' })
        end
    },
    {
        "lukas-reineke/indent-blankline.nvim",
        lazy = false,
        priority = 900,
        init = function()
            vim.cmd([[hi IblScope guibg=#073642 guifg=#073642]])
            vim.cmd([[hi IblWhitespace guibg=none guifg=#073642]])
            vim.cmd([[hi IblIndent guibg=#073642 guifg=#073642]])
        end,
        config = function()
            local hooks = require "ibl.hooks"
            hooks.register(hooks.type.HIGHLIGHT_SETUP, function()
                vim.api.nvim_set_hl(0, "IblScope", { fg = "none", bg = "#002b36" })
                vim.api.nvim_set_hl(0, "IblWhitespace", { fg = "#073642", bg = "none" })
                vim.api.nvim_set_hl(0, "IblIndent", { fg = "none", bg = "#073642" })
            end)

            require("ibl").setup {
                scope = {
                    enabled = true,
                },
            }
        end
    },
    "mfussenegger/nvim-dap",
    {
        'nvim-lualine/lualine.nvim',
        dependencies = { 'nvim-tree/nvim-web-devicons' },
        options = { theme = 'solarized_dark' },
        config = function()
            require('lualine').setup()
        end
    },
    {
        "nvim-treesitter/nvim-treesitter",
        lazy = false,
        priority = 900,
        config = function()
            require'nvim-treesitter.configs'.setup {
                ensure_installed =  {"c", "lua", "vim", "vimdoc", "rust", "elixir"},
            }
        end
    },
    {
        "mhinz/vim-startify",
        init = function()
            vim.g.startify_custom_header = {"NeoVIM"}
            vim.g.startify_custom_header_quotes = { {""} }
            vim.g.startify_bookmarks = {
                "~/.config/nvim/init.lua",
                "~/.config/nvim/lua/plugins.lua",
            }
        end
    },
    {
        "folke/neodev.nvim",
        priority = 950,
        opts = {},
        config = function()
        end
    },

    "godlygeek/tabular",

    -- Surround
    "tpope/vim-surround",

    -- "jiangmiao/auto-pairs",
    {
        "windwp/nvim-autopairs",
        event = "InsertEnter",
        opts = {} -- this is equalent to setup({}) function
    },

    -- Reveals trailing whitespace
    "ntpeters/vim-better-whitespace",

    -- Rainbow Parens
    "luochen1990/rainbow",

    {
        "mrcjkb/rustaceanvim",
        version = "^4", -- Recommended
        ft = { 'rust' },
    },
    {
        "neovim/nvim-lspconfig",
        priority = 900,
        config = function()
            require("neodev").setup({})
            require 'lspconfig'.lua_ls.setup{}
        end
    },
    {
        'ms-jpq/coq_nvim',
        branch = "coq",
        init = function()
            vim.g.coq_settings = {
                auto_start = "shut-up",
                keymap = {
                    jump_to_mark = "<C-Y>"
                }
            }
        end
    },
    {
        "ms-jpq/coq.artifacts",
        branch = "artifacts"
    },
    {
        "ms-jpq/coq.thirdparty",
        branch = "3p"
    },
}
