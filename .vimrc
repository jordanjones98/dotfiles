" Vundle Config {
set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" Vundle Plugins
Plugin 'tpope/vim-surround' " Cool surrounding text
Plugin 'mattn/emmet-vim' " emmet html completion
Plugin 'bling/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'townk/vim-autoclose'
Plugin 'tpope/vim-commentary'
Plugin 'powerline/powerline'
Plugin 'scrooloose/nerdtree' "Breaking down adding nerd tree
Plugin 'skielbasa/vim-material-monokai'
Plugin 'tpope/vim-fugitive'
Plugin 'tmhedberg/matchit'
Plugin 'wikitopian/hardmode' " Vim hard mode
Plugin 'kien/ctrlp.vim' " To find files \"Fuzzily\"
Plugin 'vim-syntastic/syntastic' " Syntax checker
Plugin 'leafgarland/typescript-vim' " Typescript stuff
Plugin 'tweekmonster/startuptime.vim' " See startup time
call vundle#end()
" }

" Misc File Setup {
syntax enable " enable syntax hylighting

set backspace=indent,eol,start		"Make backspace work."
let mapleader = "," 			"Set default leader to , instead of \"
set number				"Activates line numbers."
set nobackup       "no backup files
set nowritebackup  "only in case you don't want a backup file while editing
set noswapfile     "no swap files
set tabstop=4 " Tabbing
set shiftwidth=4 " Tabbing
set linebreak				"Sets line breaks
set wrap				"Sets wraps

" }

" Visuals {

let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum" " Make colors in vim work when in tmux
let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum" " Make colors in vim work when in tmux
set background=dark
set termguicolors
colorscheme material-monokai " Set colorscheme
set t_co=256				"Set 256 colors"
set colorcolumn=80 " sets a color at the 80 character mark
set cursorline " Makes a colored line on the current working line
set guifont=Monospace\ 20
set showmode " Shows the mode in the bottom of the screen
set showcmd " Shows the command in the bottom of the screen
set linespace=3
" Visualize tabs and newlines
set listchars=tab:▸\ ,eol:¬
map <leader>l :set list!<CR>

" Mark whitesapce with red
highlight ExtraWhitespace ctermbg=red guibg=red
match ExtraWhitespace /\s\+$/

" }

" Plugin Specific Settings {
	" Syntastic {
	set statusline+=%#warningmsg#
	set statusline+=%{SyntasticStatuslineFlag()}
	set statusline+=%*

	let g:syntastic_always_populate_loc_list = 1
	let g:syntastic_auto_loc_list = 1
	let g:syntastic_check_on_open = 1
	let g:syntastic_check_on_wq = 0
	" }

	" NERDTree {
		" Start nerdtree on startup
		autocmd StdinReadPre * let s:std_in=1
		autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
	" }

	" Vim Airline {
		set laststatus=2 "Required for vim-airline
"	}
" }

" Searching {
set hlsearch 				"Highlights words when they are searched."
set smartcase
set showmatch
set hlsearch
set incsearch
set ignorecase				"Searching is not case sensitive
set incsearch
" }


" navigating Tabs {
map <leader>p :tabp<CR>
map <leader>n :tabn<CR>
map <leader>t :tab split +Explore<CR>
map <leader>T :Explore<CR>
" }

" Mapping {

" Add Highlight Removal
nmap <Leader><space> :nohlsearch<cr>

"Map semi-colon to colon
nnoremap ; :

" Vim hard mode stuff
nnoremap <leader>h <Esc>:call ToggleHardMode()<CR> " Toggle hard mode with leader h

"Don't unselect the selection when changing indentation in visual mode.
xnoremap < <gv
xnoremap > >gv

" Make moving windows more 'vim like'
" Also stole this from Vaughn https://github.com/vkottler/dotfiles/blob/master/.vimrc
map <C-h> :call WinMove('h')<cr>
map <C-j> :call WinMove('j')<cr>
map <C-k> :call WinMove('k')<cr>
map <C-l> :call WinMove('l')<cr>

" }

" Functions {

" Window movement shortcuts
" move to the window in the direction shown, or create a new window
function! WinMove(key)
    let t:curwin = winnr()
    exec "wincmd ".a:key
    if (t:curwin == winnr())
        if (match(a:key,'[jk]'))
            wincmd v
        else
            wincmd s
        endif
        exec "wincmd ".a:key
    endif
endfunction

" This function shows the diff of a saved file using :DiffSaved to get out of
" the diff run :DiffOff
function! s:DiffWithSaved()
  let filetype=&ft
  diffthis
  vnew | r # | normal! 1Gdd
  diffthis
  exe "setlocal bt=nofile bh=wipe nobl noswf ro ft=" . filetype
endfunction
com! DiffSaved call s:DiffWithSaved()

" }

" Auto Commands {

"Automatically source vimrc file on save"
augroup autosourcing
	autocmd!
	autocmd BufWritePost .vimrc source %
augroup END

" }
