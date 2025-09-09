vim.g.mapleader = " " -- Make sure to set `mapleader` before lazy so your mappings are correct
vim.g.mapleaderlocal = " " -- Make sure to set `mapleader` before lazy so your mappings are correct
vim.g.python3_host_prog = "/Users/rsamuels/.pyenv/versions/py3nvim/bin/python"
vim.g.rustfmt_command = "/Users/rsamuels/.rustup/toolchains/stable-aarch64-apple-darwin/bin/rustfmt"
vim.g.rustaceanvim = {
	server = {
		cmd = { "/Users/rsamuels/.rustup/toolchains/stable-aarch64-apple-darwin/bin/rust-analyzer" },
		load_vscode_settings = true,
	},
}

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable", -- latest stable release
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)
require("lazy").setup("plugins")

function map(mode, shortcut, command)
	vim.api.nvim_set_keymap(mode, shortcut, command, { noremap = false, silent = true })
end
function noremap(mode, shortcut, command)
	vim.api.nvim_set_keymap(mode, shortcut, command, { noremap = true, silent = true })
end
function cmap(shortcut, command)
	map("c", shortcut, command)
end
function nmap(shortcut, command)
	map("n", shortcut, command)
end
function nmap(shortcut, command)
	map("i", shortcut, command)
end
function cnoremap(shortcut, command)
	noremap("c", shortcut, command)
end
function nnoremap(shortcut, command)
	noremap("n", shortcut, command)
end
function inoremapmap(shortcut, command)
	noremap("i", shortcut, command)
end

vim.g.colors_name = "solarized"
vim.opt.background = "dark"
vim.g.have_nerd_font = false

-- Searching
vim.opt.hlsearch = true
vim.opt.incsearch = true
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.signcolumn = "yes"

vim.opt.updatetime = 250
vim.opt.timeoutlen = 300
vim.opt.splitright = true
vim.opt.splitbelow = true

vim.opt.list = true
vim.opt.listchars = {
	tab = "| ",
	trail = "·",
	nbsp = "␣",
}

-- Show which line your cursor is on
vim.opt.cursorline = true

-- Minimal number of screen lines to keep above and below the cursor.
vim.opt.scrolloff = 10

-- clear highlights
vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>")
vim.keymap.set("n", "<leader>q", vim.diagnostic.setloclist, { desc = "Open diagnostic [Q]uickfix list" })

vim.api.nvim_create_autocmd("TextYankPost", {
	desc = "Highlight when yanking (copying) text",
	group = vim.api.nvim_create_augroup("kickstart-highlight-yank", { clear = true }),
	callback = function()
		vim.highlight.on_yank()
	end,
})

-- Buffer Behaviour
--vim.opt.filetype = "on"
vim.opt.syntax = "on"
vim.opt.confirm = true
vim.opt.shortmess = "filnxtToOsA"
vim.opt.showmode = false
vim.opt.autoread = true
vim.opt.breakindent = true

vim.opt.mouse = "a"
vim.opt.title = true

vim.opt.laststatus = 2
vim.opt.showbreak = "⏎"
vim.opt.undofile = true

-- Text Editing
--vim.opt.backspace = "ident,eol,start"
vim.opt.tabstop = 8
vim.opt.expandtab = true
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.shiftround = true
vim.opt.smartindent = true

vim.opt.colorcolumn = "80"
vim.opt.relativenumber = true
vim.opt.number = true

-- Search & History
vim.opt.history = 10000
vim.opt.wildmenu = true
vim.opt.wildmode = "list:longest"
vim.opt.gdefault = true

-- Mac OS
function dump(o)
	if type(o) == "table" then
		local s = "{ "
		for k, v in pairs(o) do
			if type(k) ~= "number" then
				k = '"' .. k .. '"'
			end
			s = s .. "[" .. k .. "] = " .. dump(v) .. ","
		end
		return s .. "} "
	else
		return tostring(o)
	end
end

if vim.loop.os_uname().sysname == "Darwin" then
	vim.schedule(function()
		vim.opt.clipboard = "unnamedplus"
	end)

	vim.opt.errorbells = false
	vim.opt.visualbell = true
end

-- Remappings
--
-- Write w/ sudo
cmap("w!!", "w ! sudo tee > /dev/null %")

-- Sanity Preservation/capital letter fixer
vim.cmd([[command! -bang -nargs=? -complete=file E e<bang> <args>]])
vim.cmd([[command! -bang -nargs=? -complete=file W w<bang> <args>]])
vim.cmd([[command! -bang -nargs=? -complete=file Wq wq<bang> <args>]])
vim.cmd([[command! -bang -nargs=? -complete=file WQ wq<bang> <args>]])
vim.cmd([[command! -bang Wa wa<bang>]])
vim.cmd([[command! -bang WA wa<bang>]])
vim.cmd([[command! -bang Q q<bang>]])
vim.cmd([[command! -bang QA qa<bang>]])
vim.cmd([[command! -bang Qa qa<bang>]])
vim.cmd([[command! -bang Plugs <S-L>:e ~/dotfiles/nvim/lua/plugins.lua<CR>]])
vim.cmd([[command! -bang Dui :lua require("dapui").toggle() ]])

nnoremap("<Leader>lazy", "<S-L>:e ~/dotfiles/nvim/lua/plugins.lua<CR>")
nnoremap("<Leader>cfg", "<S-L>:e ~/dotfiles/nvim/init.lua<CR>")
nnoremap("<Leader>cols", "<S-L>:e ~/.local/share/nvim/lazy/solarized.nvim/")
nnoremap("<Leader>md", "<S-L>:e ~/Documents/Obsidian/appledore<CR>")
vim.keymap.set("n", "<Leader>d", vim.diagnostic.open_float)
vim.diagnostic.config({
	float = {
		source = true,
	},
})

-- Disable auto comment
--noremap <expr> <enter> getline('.') =~ '^\s*//' ? '<enter><esc>S' : '<enter>'

-- Fixes auto comment with O keys {{{
--nnoremap <expr> O getline('.') =~ '^\s*//' ? 'O<esc>S' : 'O'
--noremap <expr> o getline('.') =~ '^\s*//' ? 'o<esc>S' : 'o'
-- }}}

-- GoldenView {{{

-- 1. split to tiled windows
-- nmap <silent> <S-L>  <Plug>GoldenViewSplit
--nmap("<S-L>", "<Plug>(FocusSplitNicely)")

-- 2. quickly switch current window with the main pane
-- and toggle back
--nmap("<F8>", "<Plug>GoldenViewSwitchMain")
--nmap("<S-F8>", "<Plug>GoldenViewSwitchToggle")

-- 3. jump to next and previous window
--nmap("<C-N>", "<Plug>GoldenViewNext")
--nmap("<C-P>", "<Plug>GoldenViewPrevious")
-- }}}

-- Split Navigation {{{
nnoremap("<C-J>", ":wincmd j<CR>")
nnoremap("<C-K>", ":wincmd k<CR>")
nnoremap("<C-L>", ":wincmd l<CR>")
nnoremap("<C-H>", ":wincmd h<CR>")

nnoremap("<C-S-J>", ":FocusSplitDown<CR>")
nnoremap("<C-S-K>", ":FocusSplitUp<CR>")
nnoremap("<C-S-H>", ":FocusSplitLeft<CR>")
nnoremap("<C-S-L>", ":FocusSplitRight<CR>")
-- }}}
--
vim.api.nvim_set_keymap("x", "ga", "<Plug>(EasyAlign)", { noremap = false })
vim.api.nvim_set_keymap("n", "ga", "<Plug>(EasyAlign)", { noremap = false })

-- Plugin Settings

-- Rainbow
vim.g.rainbow_active = 1

function FoldText()
	--local text = vim.treesitter.foldtext() --[[ @as string[] ]]
	--local n_lines = vim.v.foldend - vim.v.foldstart
	--table.insert(text, { " 󰁂 " .. n_lines, { "Folded" } })
	--return text
	local line = vim.fn.getline(vim.v.foldstart)
	local line_count = vim.v.foldend - vim.v.foldstart + 1
	local prefix = "▸ " -- You can change this to any symbol you prefer
	return prefix .. line .. " [" .. line_count .. " lines]"
end

if not vim.opt.diff:get() then
	--vim.opt.foldexpr = "v:lua.vim.treesitter.foldexpr()"
	vim.opt.conceallevel = 0
	vim.opt.mousemodel = "extend"

	vim.opt.foldcolumn = "0"
	vim.opt.foldlevel = 0
	vim.opt.foldlevelstart = 0
	vim.opt.foldenable = true
	vim.opt.foldmethod = "manual"
	vim.opt.foldexpr = "v:lua.vim.treesitter.foldexpr()"
	vim.opt.foldtext = require("foldtext")
	--vim.cmd([[set foldmethod=syntax]])
	--vim.cmd([[set foldlevelstart=1]])
	--vim.cmd([[set fillchars=fold:\ ]])
end

-- vim: set foldmethod=marker :
