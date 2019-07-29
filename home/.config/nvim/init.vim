filetype off                   " required
" set the runtime path to include Vundle and initialize
set rtp+=~/.config/nvim/bundle/Vundle.vim
call vundle#begin('~/.config/nvim/bundle')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

Bundle 'gmarik/vundle'

Bundle 'altercation/vim-colors-solarized'
Bundle 'nanotech/jellybeans.vim'
Bundle 'tpope/vim-fugitive'
Bundle 'scrooloose/nerdtree'
map <C-f> :NERDTreeFind<CR>
Bundle 'tpope/vim-surround'
Bundle 'tpope/vim-repeat'
Bundle 'scrooloose/nerdcommenter'
Bundle 'kien/ctrlp.vim'
Bundle 'tpope/vim-projectionist'
Bundle 'christoomey/vim-tmux-navigator'
map ,b :CtrlPBuffer<CR>
Bundle 'terryma/vim-multiple-cursors'
Bundle 'rking/ag.vim'
Bundle 'ntpeters/vim-better-whitespace'
Bundle  'kien/rainbow_parentheses.vim'

Bundle 'tpope/vim-markdown'

" ember specifics
Bundle 'mustache/vim-mustache-handlebars'

" ruby and/or rails specifics
Bundle 'tpope/vim-rails'
Bundle 'tpope/vim-rake'
Bundle 'tpope/vim-endwise'
Bundle 'tpope/vim-haml'
Bundle 'tpope/vim-cucumber'
Bundle 'tpope/vim-bundler'

" elm specifics
Bundle 'lambdatoast/elm.vim'

" vim/tmux/terminal status bar visual tweeks
Bundle 'bling/vim-airline'
Bundle 'itchyny/lightline.vim'
Bundle 'edkolev/tmuxline.vim'
Bundle 'edkolev/promptline.vim'

call vundle#end()
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

  " Spell checking with ,s
  nmap <silent> <leader>s :set spell!<CR>
  " Set region to British English
  set spelllang=en_gb

" CtrtlP Plugin mappings
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
let g:ctrlp_working_path_mode = 'ra'
" Exclude the following:
set wildignore+=*/tmp/*,*.so,*.swp,*.zip     " MacOSX/Linux
set wildignore+=*\\tmp\\*,*.swp,*.zip,*.exe  " Windows

let g:ctrlp_custom_ignore = '\v[\/]\.(git|hg|svn)$'

" NERDTree
let NERDTreeQuitOnOpen=1
let NERDTreeShowHidden=1
let g:airline_section_c = '%f'
let g:airline_powerline_fonts = 1
let g:airline_theme = 'wombat'

" Projectionist
nnoremap <leader>k :bnext<CR>
nnoremap <leader>l :bprevious<CR>

let g:projectionist_heuristics = {
      \ "ember-cli-build.js": {
      \   "app/adapters/*.js": {
      \     "alternate": "tests/unit/adapters/{}-test.js",
      \     "type": "adapter"
      \   },
      \   "tests/unit/adapters/*-test.js": {
      \     "alternate": "app/adapters/{}.js",
      \     "type": "unit-test"
      \   },
      \
      \   "app/components/*/component.js": {
      \     "alternate": "tests/integration/components/{}-test.js",
      \     "type": "component"
      \   },
      \   "tests/integration/components/*-test.js": {
      \     "alternate": "app/components/{}/component.js",
      \     "type": "integration-test"
      \   },
      \
      \   "app/helpers/*.js": {
      \     "alternate": "tests/unit/helpers/{}-test.js",
      \     "type": "helper"
      \   },
      \   "tests/unit/helpers/*-test.js": {
      \     "alternate": "app/helpers/{}.js",
      \     "type": "unit-test"
      \   },
      \
      \   "app/initializers/*.js": {
      \     "alternate": "tests/unit/initializers/{}-test.js",
      \     "type": "initializer"
      \   },
      \   "tests/unit/initializers/*-test.js": {
      \     "alternate": "app/initializers/{}.js",
      \     "type": "unit-test"
      \   },
      \
      \   "app/instance-initializers/*.js": {
      \     "alternate": "tests/unit/instance-initializers/{}-test.js",
      \     "type": "instance-initializers"
      \   },
      \   "tests/unit/instance-initializers/*-test.js": {
      \     "alternate": "app/instance-initializers/{}.js",
      \     "type": "unit-test"
      \   },
      \
      \   "app/mixins/*.js": {
      \     "alternate": "tests/unit/mixins/{}-test.js",
      \     "type": "mixin"
      \   },
      \   "tests/unit/mixins/*-test.js": {
      \     "alternate": "app/mixins/{}.js",
      \     "type": "unit-test"
      \   },
      \
      \   "app/models/*.js": {
      \     "alternate": "tests/unit/models/{}-test.js",
      \     "type": "model"
      \   },
      \   "tests/unit/models/*-test.js": {
      \     "alternate": "app/models/{}.js",
      \     "type": "unit-test"
      \   },
      \
      \   "app/serializers/*.js": {
      \     "alternate": "tests/unit/serializers/{}-test.js",
      \     "type": "serializer"
      \   },
      \   "tests/unit/serializers/*-test.js": {
      \     "alternate": "app/serializers/{}.js",
      \     "type": "unit-test"
      \   },
      \
      \   "app/services/*.js": {
      \     "alternate": "tests/unit/services/{}-test.js",
      \     "type": "service"
      \   },
      \   "tests/unit/services/*-test.js": {
      \     "alternate": "app/services/{}.js",
      \     "type": "unit-test"
      \   },
      \
      \   "app/transforms/*.js": {
      \     "alternate": "tests/unit/transforms/{}-test.js",
      \     "type": "transform"
      \   },
      \   "tests/unit/transforms/*-test.js": {
      \     "alternate": "app/transforms/{}.js",
      \     "type": "unit-test"
      \   },
      \
      \   "tests/helpers/*.js": {"type": "test-helpers"},
      \   "app/mirage/factories/*.js": {"type": "factory"},
      \   "app/mirage/fixtures/*.js": {"type": "fixture"},
      \   "app/mirage/scenarios/*.js": {"type": "scenario"},
      \   "tests/acceptance/*.js": {"type": "acceptance-test"},
      \   "app/*/styles.scss": {"type": "style"},
      \   "app/*.scss": {"type": "style"},
      \   "app/*/template.hbs": {"type": "template"},
      \   "app/*.hbs": {"type": "template"},
      \ }}

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

" selecta
" Run a given vim command on the results of fuzzy selecting from a given shell
" command. See usage below.
function! SelectaCommand(choice_command, selecta_args, vim_command)
 try
   let selection = system(a:choice_command . " | selecta " . a:selecta_args)
 catch /Vim:Interrupt/
   " Swallow the ^C so that the redraw below happens; otherwise there will be
   " leftovers from selecta on the screen
   redraw!
   return
 endtry
 redraw!
 exec a:vim_command . " " . selection
endfunction

" Find all files in all non-dot directories starting in the working directory.
" Fuzzy select one of those. Open the selected file with :e.
nnoremap <leader>s :call SelectaCommand("ag -l", "", ":e")<cr>

function! SelectaBuffer()
  let bufnrs = filter(range(1, bufnr("$")), 'buflisted(v:val)')
  let buffers = map(bufnrs, 'bufname(v:val)')
  call SelectaCommand('echo "' . join(buffers, "\n") . '"', "", ":b")
endfunction

" Fuzzy select a buffer. Open the selected buffer with :b.
nnoremap <leader>b :call SelectaBuffer()<cr>
" xxx selecta xxx "


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

