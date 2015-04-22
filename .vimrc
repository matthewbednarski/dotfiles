set nocompatible
set noundofile
set encoding=utf-8

set wildmode=longest,list,full
set wildmenu
set completeopt=longest,menuone
"g:my_vim_dir is used elsewhere in my vim configurations
let g:my_vim_dir=expand("$HOME/.vim")

if has("win16") || has("win32") || has("win64") 
	"add g:my_vim_dir to the front of the runtimepath 
	"execute "set rtp^=".g:my_vim_dir
	execute "set rtp+=".g:my_vim_dir
	let &rtp=substitute(&rtp,"[/]","\\","g")

	" set shell=powershell
	" set shellcmdflag=-command
	" if &shell=~#'bash$'

	set shell=$COMSPEC " sets shell to correct path for cmd.exe

	set clipboard=unnamed
	set t_Co=16
elseif has("win32unix")
	set clipboard=unnamed
	set t_Co=256
else
	set clipboard=unnamedplus
	set t_Co=256
endif

syntax on
filetype plugin indent on

execute pathogen#infect()

let g:solarized_termtrans=1
if has("win16") || has("win32") || has("win64") 
	let g:solarized_termcolors=16
elseif has("win32unix")
	let g:solarized_termcolors=16
else
	let g:solarized_termcolors=16
endif
let g:solarized_contrast="high" 
let g:solarized_visibility="high"
let g:solarized_underline=0

" let g:airline#extensions#tabline#enabled = 1
" let g:airline_powerline_fonts = 1

" let g:airline#extensions#tmuxline#enabled = 0
colorscheme solarized
set laststatus=2
let g:lightline = {
			\ 'colorscheme': 'solarized',
			\ 'component': {
			\   'readonly': '%{&readonly?"":""}',
			\ },
			\ 'separator': { 'left': '', 'right': '' },
			\ 'subseparator': { 'left': '', 'right': '' }
			\ }
set nowrap
set tabstop=4
set backspace=indent,eol,start
set autoindent
set copyindent
set number
set shiftwidth=4
set shiftround
set showmatch
set ignorecase
set smartcase
set smarttab
set hlsearch
set incsearch

set wildignore=*.swp,*.bak,*.pyc,*.class
set title
set nobackup
set noswapfile
set mouse=a


set omnifunc=syntaxcomplete#Complete

let g:superTabDefaultCompletionType = "context"

let g:syntastic_json_checkers = ['jshint']

set background=dark " dark | light "
if has('gui_running')
	set guioptions-=m
	set guioptions-=T
	if has("gui_gtk2")
		set guifont=Monospace\ Regular\ 12
	elseif has("gui_macvim")
		set guifont=Menlo\ Regular:h14
	elseif has("gui_win32")
		set guifont=Consolas:h11:cANSI
	endif
end
" colorschem solarized
highlight Normal ctermbg=NONE
highlight nonText ctermbg=NONE

let g:xml_syntax_folding=1


cmap w!! w !sudo tee % >/dev/null

call togglebg#map("<F6>")
nnoremap <F2> :TagbarToggle<CR>
nnoremap <F3> :set hlsearch!<CR>
nnoremap <F5>  :e<CR> G

nnoremap F gg=G''zz

nnoremap <C-n> :bNext<CR>
nnoremap <C-p> :bPrevious<CR>

nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>
nnoremap <silent> <Leader>= :exe "resize " . (winheight(0) * 3/2)<CR>
nnoremap <silent> <Leader>- :exe "resize " . (winheight(0) * 2/3)<CR>

let mapleader=","
let maplocalleader=","
inoremap jj <ESC>
nmap <silent> <leader>ev :e $MYVIMRC<CR>
nmap <silent> <leader>sv :so $MYVIMRC<CR>

autocmd FileType json noremap <buffer>  <c-f> :call JsonBeautify()<cr>
autocmd FileType javascript noremap <buffer>  <c-f> :call JsBeautify()<cr>
autocmd FileType html noremap <buffer> <c-f> :call HtmlBeautify()<cr>
autocmd FileType css noremap <buffer> <c-f> :call CSSBeautify()<cr>
autocmd FileType xml noremap <buffer> <c-f> mzgg=G`z<CR>
autocmd FileType java noremap <buffer> <c-f> mzgg=G`z<CR>
autocmd FileType sh noremap <buffer> <c-f> mzgg=G`z<CR>
autocmd FileType todo setlocal completefunc=TodoComplete
autocmd FileType todo imap + +<C-X><C-U>
autocmd FileType todo imap @ @<C-X><C-U>


inoremap <expr> <CR> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
inoremap <expr> <C-n> pumvisible() ? '<C-n>' :
			\ '<C-n><C-r>=pumvisible() ? "\<lt>Down>" : ""<CR>'

inoremap <expr> <M-,> pumvisible() ? '<C-n>' :
			\ '<C-x><C-o><C-n><C-p><C-r>=pumvisible() ? "\<lt>Down>" : ""<CR>'
