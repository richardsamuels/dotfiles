vim.g.mapleader = "\\" -- Make sure to set `mapleader` before lazy so your mappings are correct
vim.g.python3_host_prog = "/Users/rsamuels/.pyenv/versions/py3nvim/bin/python"

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
  map('c', shortcut, command)
end
function nmap(shortcut, command)
  map('n', shortcut, command)
end
function nmap(shortcut, command)
  map('i', shortcut, command)
end
function cnoremap(shortcut, command)
  noremap('c', shortcut, command)
end
function nnoremap(shortcut, command)
  noremap('n', shortcut, command)
end
function inoremapmap(shortcut, command)
  noremap('i', shortcut, command)
end

vim.g.colors_name= "solarized"
vim.opt.background = "dark"

-- Searching
vim.opt.hlsearch = true
vim.opt.incsearch = true
vim.opt.ignorecase = true
vim.opt.smartcase = true

-- Buffer Behaviour
vim.opt.filetype = "on"
vim.opt.syntax = "on"
vim.opt.confirm = true
vim.opt.shortmess = "filnxtToOsA"
vim.opt.showmode = false
vim.opt.autoread = true

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
if vim.loop.os_uname().system == "Darwin" then
    vim.opt.clipboard = "unnamed"
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
-- }}}


-- Plugin Settings

-- Airline {{{
vim.g.Powerline_symbols = 'fancy'
vim.g.airline_powerline_fonts = 1

vim.g.airline_theme = 'solarized'

-- don't count trailing whitespace since it lags in huge files
vim.g["airline#extensions#whitespace#enabled"] = 0

-- disable to improve fugitive performance
vim.g["airline#extensions#branch#enabled"] = 1

-- put a buffer list at the top
vim.g["airline#extensions#tabline#enabled"] = 1
vim.g["airline#extensions#tabline#fnamemod"] = ':t'
-- }}}

-- Rainbow
vim.g.rainbow_active = 1
-- vim: set foldmethod=marker :
