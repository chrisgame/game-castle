filetype off                   " required

call plug#begin('~/.vim/plugged')

Plug 'altercation/vim-colors-solarized'
Plug 'nanotech/jellybeans.vim'
Plug 'tpope/vim-fugitive'
Plug 'scrooloose/nerdtree'
map <C-f> :NERDTreeFind<CR>
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'
Plug 'scrooloose/nerdcommenter'
Plug 'christoomey/vim-tmux-navigator'
Plug 'terryma/vim-multiple-cursors'
Plug 'rking/ag.vim'
Plug 'ntpeters/vim-better-whitespace'
Plug  'kien/rainbow_parentheses.vim'

" linting
Plug 'dense-analysis/ale'

" ember specifics
Plug 'joukevandermaas/vim-ember-hbs'

" ruby and/or rails specifics
Plug 'tpope/vim-rails'
Plug 'tpope/vim-rake'
Plug 'tpope/vim-haml'
Plug 'tpope/vim-cucumber'
Plug 'tpope/vim-bundler'

" elm specifics
Plug 'lambdatoast/elm.vim'

" markdown specifics
Plug 'tpope/vim-markdown'

" vim/tmux/terminal status bar visual tweeks
Plug 'bling/vim-airline'
Plug 'itchyny/lightline.vim'
Plug 'edkolev/tmuxline.vim'
Plug 'edkolev/promptline.vim'
Plug 'vim-airline/vim-airline-themes'

Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }

" searching
Plug 'srstevenson/vim-picker'

call plug#end()

filetype plugin indent on  " allows auto-indenting depending on file type

let mapleader = ","

set history=10000                 " Keep history

syntax enable                     " Turn on syntax highlighting.
set showcmd                       " Display incomplete commands.
set showmode                      " Display the mode you're in.

set backspace=indent,eol,start    " Intuitive backspacing.

"This means you can navigate away from a buffer without saving - no likey.
"set hidden                        " Handle multiple buffers better.

set wildmenu                      " Enhanced command line completion.
set wildmode=list:longest         " Complete files like a shell.

set ignorecase                    " Case-insensitive searching.
set smartcase                     " But case-sensitive if expression contains a capital letter.

set number                        " Show line numbers.
set ruler                         " Show cursor position.

set incsearch                     " Highlight matches as you type.
set hlsearch                      " Highlight matches.

set wrap                          " Turn on line wrapping.
set scrolloff=3                   " Show 3 lines of context around the cursor.

set title                         " Set the terminal's title

set visualbell                    " No beeping.
set nobackup                      " Don't make a backup before overwriting a file.
set nowritebackup                 " And again.
set directory=~/.vim/swap//       " Keep swap files in one location

" UNCOMMENT TO USE
set tabstop=2                    " Global tab width.
set shiftwidth=2                 " And again, related.
set expandtab                    " Use spaces instead of tabs

set laststatus=2                  " Show the status line all the time
" Useful status information at bottom of screen
set statusline=[%n]\ %<%.99f\ %h%w%m%r%y\ %{fugitive#statusline()}%{exists('*CapsLockStatusline')?CapsLockStatusline():''}%=%-16(\ %l,%c-%v\ %)%P
o
colorscheme jellybeans
" CONFIGURATION
" VIM specifics
  map <leader>tt :tabnew<cr>
  map <leader>te :tabedit
  map <leader>tc :tabclose<cr>
  map <leader>to :tabonly<cr>
  map <leader>tn :tabnext<cr>
  map <leader>tp :tabprevious<cr>
  map <leader>tf :tabfirst<cr>
  map <leader>tl :tablast<cr>
  map <leader>tm :tabmove

  " Spell checking with ,c
  nmap <silent> <leader>c :set spell!<CR>
  " Set region to British English
  set spelllang=en_gb

" Exclude the following:
set wildignore+=*/tmp/*,*.so,*.swp,*.zip     " MacOSX/Linux
set wildignore+=*\\tmp\\*,*.swp,*.zip,*.exe  " Windows

" better-whitespace options
let g:strip_whitespace_on_save = 1
let g:better_whitespace_enabled = 1
let g:strip_whitespace_confirm = 0

" NERDTree
let NERDTreeQuitOnOpen=1
let NERDTreeShowHidden=1
let g:airline_section_c = '%f'
let g:airline_powerline_fonts = 1
let g:airline_theme = 'wombat'

" Completion config
let g:coc_global_extensions = [
  \ 'coc-tsserver',
  \ 'coc-css',
  \ 'coc-eslint',
  \ 'coc-json',
  \ 'coc-html',
  \ 'coc-vimlsp',
  \ 'coc-highlight',
  \ 'coc-ember'
  \ ]


" ALE options
let g:ale_linters = {
  \   'javascript': ['eslint'],
  \}
let g:ale_fixers = {
  \   'javascript': ['prettier'],
  \}
let g:ale_linters_explicit = 1
let g:ale_javascript_prettier_use_local_config = 1

" Rainbow Parenthese
let g:rbpt_colorpairs = [
    \ ['brown',       'RoyalBlue3'],
    \ ['Darkblue',    'SeaGreen3'],
    \ ['darkgray',    'DarkOrchid3'],
    \ ['darkgreen',   'firebrick3'],
    \ ['darkcyan',    'RoyalBlue3'],
    \ ['darkred',     'SeaGreen3'],
    \ ['darkmagenta', 'DarkOrchid3'],
    \ ['brown',       'firebrick3'],
    \ ['gray',        'RoyalBlue3'],
    \ ['darkmagenta', 'DarkOrchid3'],
    \ ['Darkblue',    'firebrick3'],
    \ ['darkgreen',   'RoyalBlue3'],
    \ ['darkcyan',    'SeaGreen3'],
    \ ['darkred',     'DarkOrchid3'],
    \ ['red',         'firebrick3'],
    \ ]

au VimEnter * RainbowParenthesesToggle
au Syntax * RainbowParenthesesLoadRound
au Syntax * RainbowParenthesesLoadSquare
au Syntax * RainbowParenthesesLoadBraces

" ember specifics
let mustache_abbreviations=1

" vim-picker
nmap <unique> <leader>s <Plug>(PickerEdit)

" deoplete
let g:deoplete#enable_at_startup = 1
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"

" vim/tmux/terminal status bar visual tweeks
let g:promptline_preset = {
      \'a'    : [ '$' ],
      \'b'    : [ '%~' ],
      \'warn' : [ promptline#slices#last_exit_code() ],
      \'x'    : [ promptline#slices#git_status() ],
      \'y'    : [ promptline#slices#vcs_branch() ],
      \'z'    : [ '%*']
      \}

let g:lightline = {
      \ 'colorscheme': 'jellybeans',
      \ 'mode_map': { 'c': 'NORMAL' },
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'fugitive', 'readonly', 'filename' ] ]
      \ },
      \ 'component_function': {
      \   'modified': 'MyModified',
      \   'readonly': 'MyReadonly',
      \   'fugitive': 'MyFugitive',
      \   'filename': 'MyFilename',
      \   'fileformat': 'MyFileformat',
      \   'filetype': 'MyFiletype',
      \   'fileencoding': 'MyFileencoding',
      \   'mode': 'MyMode',
      \ },
      \ 'separator': { 'left': '', 'right': '' },
      \ 'subseparator': { 'left': '', 'right': '' }
      \ }

function! MyModified()
  return &ft =~ 'help\|vimfiler\|gundo' ? '' : &modified ? '+' : &modifiable ? '' : '-'
endfunction

function! MyReadonly()
  return &ft !~? 'help\|vimfiler\|gundo' && &readonly ? '' : ''
endfunction

function! MyFilename()
  return ('' != MyReadonly() ? MyReadonly() . ' ' : '') .
        \ (&ft == 'vimfiler' ? vimfiler#get_status_string() :
        \  &ft == 'unite' ? unite#get_status_string() :
        \  &ft == 'vimshell' ? vimshell#get_status_string() :
        \ '' != expand('%:T') ? expand('%:T') : '[No Name]') .
        \ ('' != MyModified() ? ' ' . MyModified() : '')
endfunction

function! MyFugitive()
  if &ft !~? 'vimfiler\|gundo' && exists("*fugitive#head")
    let _ = fugitive#head()
    return strlen(_) ? ' '._ : ''
  endif
  return ''
endfunction

function! MyFileformat()
  return winwidth(0) > 70 ? &fileformat : ''
endfunction

function! MyFiletype()
  return winwidth(0) > 70 ? (strlen(&filetype) ? &filetype : 'no ft') : ''
endfunction

function! MyFileencoding()
  return winwidth(0) > 70 ? (strlen(&fenc) ? &fenc : &enc) : ''
endfunction

function! MyMode()
  return winwidth(0) > 60 ? lightline#mode() : ''
endfunction

let g:tmuxline_preset = {
      \'win'  : '#I #W',
      \'cwin' : '#I #W',
      \'x'    : '%A',
      \'y'    : '%d-%b-%Y',
      \'z'    : '%R',
      \'options' : {'status-justify' : 'left'}
      \}
