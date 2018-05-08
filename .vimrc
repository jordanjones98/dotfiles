" Vundle Config {
set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" Vundle Plugins
Plugin 'tpope/vim-surround'
Plugin 'mattn/emmet-vim'
Plugin 'bling/vim-airline'
set laststatus=2 "Required for vim-airline
Plugin 'vim-airline/vim-airline-themes'
Plugin 'townk/vim-autoclose'
Plugin 'tpope/vim-commentary'
Plugin 'powerline/powerline'
Plugin 'scrooloose/nerdtree' "Breaking down adding nerd tree
Plugin 'Xuyuanp/nerdtree-git-plugin' " Add git stuff to NerdTree
Plugin 'skielbasa/vim-material-monokai'
Plugin 'morhetz/gruvbox'
Plugin 'tpope/vim-fugitive'
Plugin 'tmhedberg/matchit'
Plugin 'wikitopian/hardmode' " Vim hard mode
Plugin 'kien/ctrlp.vim' " To find files \"Fuzzily\"
Plugin 'vim-syntastic/syntastic'
Plugin 'leafgarland/typescript-vim' " Typescript stuff
Plugin 'editorconfig/editorconfig-vim'
Plugin 'thaerkh/vim-indentguides'
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
set expandtab
set linebreak				"Sets line breaks
set wrap				"Sets wraps

" }

" Visuals {

if has('macunix')
    let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum" " Make colors in vim work when in tmux
    let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum" " Make colors in vim work when in tmux
    set termguicolors
endif
set background=dark
colorscheme gruvbox " Set colorscheme

let g:gruvbox_contrast_dark = 'hard'

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

        let NERDTreeMinimalUI = 1
        let NERDTreeDirArrows = 1

        " Git Nerd Tree config {
            "let g:NerdTreDTreeIndicatorMapCustom = {
            "    \ "Modified"  : "✹",
            "    \ "Staged"    : "✚",
            "    \ "Untracked" : "✭",
            "    \ "Renamed"   : "➜",
            "    \ "Unmerged"  : "═",
            "    \ "Deleted"   : "✖",
            "    \ "Dirty"     : "✗",
            "    \ "Clean"     : "✔︎",
            "    \ 'Ignored'   : '☒',
            "    \ "Unknown"   : "?"
            "\ }

        " }
	" }
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

" Mapping {

" Add Highlight Removal
nmap <Leader><space> :nohlsearch<cr>

"Map semi-colon to colon
nnoremap ; :

" Vim hard mode stuff
nnoremap <leader>h <Esc>:call ToggleHardMode()<CR> " Toggle hard mode with leader h

" Toggle NERDTree
nnoremap <leader>n <Esc>:NERDTreeToggle<CR>

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

function! SetupEnvironment()
  let l:path = expand('%:p')
  if l:path =~ '/home/jordan/gitrepos/adv-java/hounds/hounds-angular'
		setlocal expandtab smarttab textwidth=0
      setlocal tabstop=2 shiftwidth=2
  endif
endfunction
autocmd! BufReadPost,BufNewFile * call SetupEnvironment()

" Auto Commands {

"Automatically source vimrc file on save"
augroup autosourcing
	autocmd!
	autocmd BufWritePost .vimrc source %
augroup END

" Set no relative number when in insert mode, or focus goes out of the pane.
augroup relnumbertoggle
    autocmd!
    autocmd BufEnter,FocusGained,InsertLeave * set relativenumber
    autocmd BufLeave,FocusLost,InsertEnter * set norelativenumber
augroup END

" }
