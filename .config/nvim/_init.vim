" Settings
" let mapleader=" "

" luafile ~/.config/nvim/lua/fink/keymaps.lua
" luafile ~/.config/nvim/lua/fink/options.lua

"set signcolumn=yes " später wenn pluglin mit fehlern oder git
"set colorcolumn=80 " kann man das erst anzeigen wenn spalte 80 ereicht ist und wenn code geöffnet ist?


"" todo: format options anschauen
"augroup formatOptions
"    autocmd!
"    autocmd BufEnter * setlocal formatoptions-=c formatoptions-=r formatoptions-=o
"    "autocmd BufEnter * setlocal formatoptions=crqn2l1j
"augroup END

" remove trailing whitespace and newlines at end of file

" Become root todo
"map <leader>p :w !sudo tee %

" R Markdown Compilieren
" autocmd Filetype rmd map <F5> :!echo<space>"require(rmarkdown);<space>render('<c-r>%')"<space>\|<space>R<space>--vanilla<enter>
" Wenn Datei ein pdf wird zathura starten
"autocmd FileType rmd map <F2> :!vimOpenFile %<enter>

" auto-install vim-plug
if empty(glob('~/.config/nvim/autoload/plug.vim'))
  silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall
endif

call plug#begin('~/.config/nvim/autoload/plugged')
	Plug 'nvim-lua/popup.nvim'
	Plug 'nvim-lua/plenary.nvim'
	Plug 'nvim-telescope/telescope.nvim'

	" colorscheme
	Plug 'maaslalani/nordbuddy'
	Plug 'Mofiqul/vscode.nvim'

	Plug 'lambdalisue/fern.vim'
	Plug 'mbbill/undotree'

	" tpope
	Plug 'tpope/vim-surround'
	Plug 'tpope/vim-speeddating'
	Plug 'tpope/vim-endwise'
	Plug 'tpope/vim-commentary'
	Plug 'tpope/vim-repeat'
	Plug 'tpope/vim-fugitive'

	Plug 'Raimondi/delimitMate'

	Plug 'junegunn/goyo.vim'
	Plug 'junegunn/vim-peekaboo'

	" lsp
	Plug 'neovim/nvim-lspconfig'
	Plug 'hrsh7th/nvim-compe'
	Plug 'kabouzeid/nvim-lspinstall'

	" todo
	" Plug 'glepnir/lspsaga.nvim'

	" treesitter
	Plug 'nvim-treesitter/nvim-treesitter'
	Plug 'nvim-treesitter/playground'

call plug#end()

" gramatik deutsch und englisch

" nochaml nachlesen
" vim-fugitive
" https://github.com/tpope/vim-surround
" https://github.com/tpope/vim-speeddating
" https://github.com/tpope/vim-endwise
" https://github.com/tpope/vim-repeat
" https://github.com/zivyangll/git-blame.vim
" https://github.com/easymotion/vim-easymotion
" https://github.com/bkad/CamelCaseMotion
" https://github.com/onsails/lspkind-nvim

" lsp config
nnoremap <silent> gd <cmd>lua vim.lsp.buf.definition()<CR>
nnoremap <silent> gD <cmd>lua vim.lsp.buf.declaration()<CR>
nnoremap <silent> gr <cmd>lua vim.lsp.buf.references()<CR>
nnoremap <silent> gi <cmd>lua vim.lsp.buf.implementation()<CR>
nnoremap <silent> K <cmd>lua vim.lsp.buf.hover()<CR>
nnoremap <silent> <C-k> <cmd>lua vim.lsp.buf.signature_help()<CR>
"nnoremap <silent> <C-n> <cmd>lua vim.lsp.diagnostic.goto_prev()<CR>
" nnoremap <silent> <C-p> <cmd>lua vim.lsp.diagnostic.goto_next()<CR>
" auto-format
autocmd BufWritePre *.js lua vim.lsp.buf.formatting_sync(nil, 100)
" autocmd BufWritePre *.jsx lua vim.lsp.buf.formatting_sync(nil, 100)
autocmd BufWritePre *.py lua vim.lsp.buf.formatting_sync(nil, 100)
luafile ~/.config/nvim/lua/plugins/compe-config.lua
luafile ~/.config/nvim/lua/plugins/lsp.lua

" von-peekaboo
let g:markbar_peekaboo_width = 80

" fern
let g:fern#drawer_width = 30
let g:fern#default_hidden = 1
let g:fern#disable_drawer_auto_quit = 1
noremap <silent><A-f> :Fern . -drawer -toggle<CR>

" undotree
noremap <silent><A-u> :UndotreeToggle<CR>

" goyo
map <leader>g :Goyo<CR>
let g:goyo_width = '70%'
let g:goyo_height = '90%'
" todo: goyo in mutt immer

" telescope
nnoremap <leader>f :lua require('telescope.builtin').grep_string({ search = vim.fn.input("Grep For > ")})<CR>
"nnoremap <C-p> :pg require('telescope.builtin').git_files()<CR>
nnoremap <leader>p :Telescope find_files<CR>
nnoremap <leader>b :Telescope buffers<CR>
nnoremap <leader><F1> :Telescope builtin<CR>
"nnoremap <leader>e :lua require('telescope.builtin').file_browser()<CR>
"nnoremap <leader>e :lua require('telescope.builtin').marks()<CR>

" function! s:init_fern() abort
"  nmap <buffer> H <Plug>(fern-action-open:split)
"  nmap <buffer> V <Plug>(fern-action-open:vsplit)
"  nmap <buffer> R <Plug>(fern-action-rename)
"	nmap <buffer> C <Plug>(fern-action-copy)
"	nmap <buffer> N <Plug>(fern-action-new-path)
"	nmap <buffer> T <Plug>(fern-action-new-file)
"	nmap <buffer> D <Plug>(fern-action-new-dir)
"	nmap <buffer> S <Plug>(fern-action-hidden-toggle)
"	nmap <buffer> dd <Plug>(fern-action-trash)
"  nmap <buffer> <leader> <Plug>(fern-action-mark)
	" set modifiable
" endfunction

" augroup fern-custom
"   autocmd! *
"   autocmd FileType fern call s:init_fern()
" augroup END

" todo: move in init.lua not in own file
" source ~/.config/nvim/after/vscode.vim
" colorscheme vscode

" highlight Normal guibg=none

" luafile ~/.config/nvim/lua/fink/setup_servers.lua
