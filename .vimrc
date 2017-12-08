" Vundle Config
set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" dont create those annoying backup files that clog up folders
set nobackup       "no backup files
set nowritebackup  "only in case you don't want a backup file while editing
set noswapfile     "no swap files

" Vundle Plugins
Plugin 'tpope/vim-surround'
Plugin 'mattn/emmet-vim'
Plugin 'bling/vim-airline'
set laststatus=2 "Required for vim-airline
Plugin 'vim-airline/vim-airline-themes'
Plugin 'townk/vim-autoclose'
Plugin 'tpope/vim-commentary'
Plugin 'powerline/powerline'
call vundle#end()
"End Vundle Config


syntax enable

set backspace=indent,eol,start		"Make backspace work."
let mapleader = "," 			"Set default leader to , instead of \"
set number				"Activates line numbers."

"-----Tabbing----------"
set tabstop=4
set shiftwidth=4

"---------Visuals-------"
colorscheme atom-dark-256
set t_co=256				"Set 256 colors"
set linebreak				"Sets line breaks
set wrap				"Sets wraps
set colorcolumn=80 " sets a color at the 80 character mark

set showmode " Shows the mode in the bottom of the screen
set linespace=3
set guifont=Monospace\ 20

" Visualize tabs and newlines
set listchars=tab:▸\ ,eol:¬
map <leader>l :set list!<CR>



"------File Explorer-----"
let g:netrw_liststyle = 3 "Sets the style of the lists
let g:netrw_banner = 0 "Gets rid of the banner on top of the file explorer
let g:netrw_browse_split = 4 "Opens files in the previous window
let g:netrw_winsize = 20 "Sets the width of the file explorer to 20% of the screen
let g:netrw_altv = 1


"---------Mark whitespace with red---------"
highlight ExtraWhitespace ctermbg=red guibg=red
match ExtraWhitespace /\s\+$/

"------------------Searching----------"
set hlsearch 				"Highlights words when they are searched."
set smartcase
set showmatch
set hlsearch
set incsearch
set ignorecase				"Searching is not case sensitive

"make it easy to edit vimrc file."
nmap <Leader>ev :tabedit $MYVIMRC<cr>

"Add highlight removal
nmap <Leader><space> :nohlsearch<cr>
set incsearch

"Resize file explorer to 40
nmap <Leader>e :vertical resize 40 <cr>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                                Functions                                    "
"                                                                             "
" WinMove from https://github.com/nicknisi/vim-workshop/                      "
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Also stole this from Vaughn https://github.com/vkottler/dotfiles/blob/master/.vimrc
map <C-h> :call WinMove('h')<cr>
map <C-j> :call WinMove('j')<cr>
map <C-k> :call WinMove('k')<cr>
map <C-l> :call WinMove('l')<cr>

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


"--------Auto commands-----------"
"Automatically source vimrc file on save"
augroup autosourcing
	autocmd!
	autocmd BufWritePost .vimrc source %
augroup END

augroup ProjectDrawer
  autocmd!
  autocmd VimEnter * :Vexplore
augroup END
