" Vundle Config {
set nocompatible              " be iMproved, required
filetype off                  " required
let g:ale_disable_lsp = 1

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" Vundle Plugins
Plugin 'VundleVim/Vundle.vim'
Plugin 'neoclide/coc.nvim', {'do': 'yarn install --frozen-lockfile'}
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
Plugin 'kien/ctrlp.vim' " To find files \"Fuzzily\"
Plugin 'leafgarland/typescript-vim' " Typescript stuff
Plugin 'editorconfig/editorconfig-vim'
Plugin 'thaerkh/vim-indentguides'
Plugin 'majutsushi/tagbar'
Plugin 'arcticicestudio/nord-vim'
Plugin 'psf/black', { 'tag': '19.10b0' }
Plugin 'lepture/vim-jinja' " nunjucks syntax
Plugin 'davidhalter/jedi-vim'
Plugin 'python-mode/python-mode'
Plugin 'liuchengxu/space-vim-theme'
Plugin 'dense-analysis/ale'
Plugin 'peitalin/vim-jsx-typescript'
Plugin 'prettier/vim-prettier', {
  \ 'do': 'yarn install',
  \ 'branch': 'release/1.x',
  \ 'for': [
    \ 'javascript',
    \ 'typescript',
    \ 'css',
    \ 'scss',
    \ 'json',
    \ 'markdown',
    \ 'php',
    \ 'python',
    \ 'html' ] }
Plugin 'AndrewRadev/splitjoin.vim'
Plugin 'junegunn/gv.vim'
Plugin 'ryanoasis/vim-devicons'
Plugin 'joonty/vdebug'
call vundle#end()
" }

" Misc File Setup {
syntax enable " enable syntax hylighting

set encoding=UTF-8
let g:airline_powerline_fonts = 1
set backspace=indent,eol,start		"Make backspace work."
let mapleader = "," 			"Set default leader to , instead of \"
set number				"Activates line numbers."
set nobackup       "no backup files
set nowritebackup  "only in case you don't want a backup file while editing
set noswapfile     "no swap files
set tabstop=2 " Tabbing
set shiftwidth=2 " Tabbing
set expandtab
set linebreak				"Sets line breaks
set wrap				"Sets wraps
set breakindentopt=shift:4
set clipboard+=unnamed
set undodir=~/.vim/undodir
set undofile
set conceallevel=0 " Dont hide quotes. JUST SHOW ME THE FUCKING FILE HOW IT IS

" }

" Visuals {

if has('macunix')
    let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum" " Make colors in vim work when in tmux
    let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum" " Make colors in vim work when in tmux
    set termguicolors
endif
set background=dark
" colorscheme material-monokai " Set colorscheme
colorscheme nord
color space_vim_theme

set t_co=256				"Set 256 colors"
set colorcolumn=80 " sets a color at the 80 character mark
set cursorline " Makes a colored line on the current working line
"set guifont=Monospace\ 20
set guifont=Fira\ Code:h12
set showmode " Shows the mode in the bottom of the screen
set showcmd " Shows the command in the bottom of the screen
set linespace=3
" Visualize tabs and newlines
" set listchars=tab:▸\ ,eol:¬
map <leader>l :set list!<CR>
map <leader>c :set number! relativenumber!<CR>

" Mark whitesapce with red
highlight ExtraWhitespace ctermbg=red guibg=red
match ExtraWhitespace /\s\+$/

" }

    " DeoPlete {
        let g:deoplete#enable_at_startup = 1
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
"
"ALE {
  let g:ale_linters = {
  \   'javascript': ['eslint'],
  \}

  let g:ale_fixers = {
  \   '*': ['remove_trailing_lines', 'trim_whitespace'],
  \   'javascript': ['prettier', 'eslint'],
  \}

  let g:ale_fix_on_save = 1
"}

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

nnoremap <leader>b <Esc>:buffers<CR>:buffer<Space>

"Don't unselect the selection when changing indentation in visual mode.
xnoremap < <gv
xnoremap > >gv

" Insert Mode Mappings
inoremap II <Esc>I
inoremap AA <Esc>A
inoremap ZZ <Esc>zzli

" Make moving windows more 'vim like'
" Also stole this from Vaughn https://github.com/vkottler/dotfiles/blob/master/.vimrc
map <C-h> :call WinMove('h')<cr>
map <C-j> :call WinMove('j')<cr>
map <C-k> :call WinMove('k')<cr>
map <C-l> :call WinMove('l')<cr>

" }

" { python mode config
let g:pymode_rope = 0
let g:pymode_python = 'python3'
" }

" { jedi vim config
let g:jedi#completions_enabled = 0
" }

" { jedi vim config
let g:pymode_python = 'python3'
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

" set filetypes as typescript.tsx
autocmd BufNewFile,BufRead *.tsx,*.jsx set filetype=typescript.tsx

"Automatically run Black on python file save
autocmd BufWritePre *.py execute ':Black'

"Automatically run Prettier on Typescriptt file save
autocmd BufWritePre *.tsx execute ':PrettierAsync'
autocmd BufWritePre *.ts execute ':PrettierAsync'

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



"coc config

" Better display for messages
set cmdheight=2

" You will have bad experience for diagnostic messages when it's default 4000.
set updatetime=300

" always show signcolumns
set signcolumn=yes

nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use tab for trigger completion with characters ahead and navigate.
" Use command ':verbose imap <tab>' to make sure tab is not mapped by other plugin.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()

" Remap for rename current word
nmap <leader>rn <Plug>(coc-rename)

" Remap for format selected region
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

command! -nargs=0 Format :call CocAction('format')

command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

" Add status line support, for integration with other plugin, checkout `:h coc-status`
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}
