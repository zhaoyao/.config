" vim:fdm=marker foldlevel=0

" Settings -------------------------------------------------------------

" Preamble {{{


" Mapleader {{{
let mapleader=","
" }}}

" Set some junk {{{
set clipboard=unnamed
set cursorline " Highlight current line
set diffopt=filler " Add vertical spaces to keep right and left aligned
set diffopt+=iwhite " Ignore whitespace changes (focus on code changes)
set encoding=utf-8 nobomb " BOM often causes trouble
set expandtab " Expand tabs to spaces
set foldcolumn=0 " Column to show folds
set foldenable " Enable folding
set foldlevel=5 " Open all folds by default
set foldmethod=syntax " Syntax are used to specify folds
set foldminlines=0 " Allow folding single lines
set foldnestmax=5 " Set max fold nesting level
set formatoptions=
set formatoptions+=c " Format comments
set formatoptions+=r " Continue comments by default
set formatoptions+=o " Make comment when using o or O from comment line
set formatoptions+=q " Format comments with gq
set formatoptions+=n " Recognize numbered lists
set formatoptions+=2 " Use indent from 2nd line of a paragraph
set formatoptions+=l " Don't break lines that are already long
set formatoptions+=1 " Break before 1-letter words
set gdefault " By default add g flag to search/replace. Add g to toggle
set hidden " When a buffer is brought to foreground, remember undo history and marks
set ignorecase " Ignore case of searches
set lazyredraw " Don't redraw when we don't have to
set lispwords+=defroutes " Compojure
set lispwords+=defpartial,defpage " Noir core
set lispwords+=defaction,deffilter,defview,defsection " Ciste core
set lispwords+=describe,it " Speclj TDD/BDD
set magic " Enable extended regexes
set mouse=a " Enable the mouse
set noerrorbells " Disable error bells
set nojoinspaces " Only insert single space after a '.', '?' and '!' with a join command
set noshowmode " Don't show the current mode (airline.vim takes care of us)
set nostartofline " Don't reset cursor to start of line when moving around
set nowrap " Do not wrap lines
set nonu " Enable line numbers
" set ofu=syntaxcomplete#Complete " Set omni-completion method
set regexpengine=1 " Use the old regular expression engine (it's faster for certain language syntaxes)
set report=0 " Show all changes
set ruler " Show the cursor position
set scrolloff=3 " Start scrolling three lines before horizontal border of window
set shiftwidth=2 " The # of spaces for indenting
set shortmess=atI " Don't show the intro message when starting vim
set showtabline=2 " Always show tab bar
set sidescrolloff=3 " Start scrolling three columns before vertical border of window
set smartcase " Ignore 'ignorecase' if search patter contains uppercase characters
set softtabstop=2 " Tab key results in 2 spaces
set tabstop=4
set splitbelow " New window goes below
set splitright " New windows goes right
set suffixes=.bak,~,.swp,.swo,.o,.d,.info,.aux,.log,.dvi,.pdf,.bin,.bbl,.blg,.brf,.cb,.dmg,.exe,.ind,.idx,.ilg,.inx,.out,.toc,.pyc,.pyd,.dll
set switchbuf=""
set title " Show the filename in the window titlebar
set termguicolors " Enable true color support
let $NVIM_TUI_ENABLE_TRUE_COLOR=1
set undofile " Persistent Undo
set viminfo=%,'9999,s512 " Restore buffer list, marks are remembered for 9999 files, registers up to 512Kb are remembered
set visualbell " Use visual bell instead of audible bell (annnnnoying)
set wildchar=<TAB> " Character for CLI expansion (TAB-completion)
set wildignore+=.DS_Store
set wildignore+=*.jpg,*.jpeg,*.gif,*.png,*.gif,*.psd,*.o,*.obj,*.min.js
set wildignore+=*/bower_components/*,*/node_modules/*
set wildignore+=*/smarty/*,*/vendor/*,*/.git/*,*/.hg/*,*/.svn/*,*/.sass-cache/*,*/log/*,*/tmp/*,*/build/*,*/ckeditor/*,*/doc/*,*/source_maps/*,*/dist/*
set winminheight=0 " Allow splits to be reduced to a single line
set wrapscan " Searches wrap around end of file
" }}}

" }}}

" Configuration -------------------------------------------------------------

" FastEscape {{{
" Speed up transition from modes
" if ! has('gui_running')
  " set ttimeoutlen=10
  " augroup FastEscape
    " autocmd!
    " au InsertEnter * set timeoutlen=0
    " au InsertLeave * set timeoutlen=1000
  " augroup END
" endif
" }}}

" General {{{
augroup general_config
  autocmd!

  " Speed up viewport scrolling {{{
  nnoremap <C-e> 3<C-e>
  nnoremap <C-y> 3<C-y>
  " }}}

  " Faster split resizing (+,-) {{{
  if bufwinnr(1)
    map + <C-W>+
    map - <C-W>-
  endif
  " }}}

  " Better split switching (Ctrl-j, Ctrl-k, Ctrl-h, Ctrl-l) {{{
  tnoremap <C-h> <C-\><C-n><C-w>h
  tnoremap <C-j> <C-\><C-n><C-w>j
  tnoremap <C-k> <C-\><C-n><C-w>k
  tnoremap <C-l> <C-\><C-n><C-w>l
  nnoremap <C-j> <C-W>j
  nnoremap <C-k> <C-W>k
  nnoremap <C-h> <C-W>h
  nnoremap <C-l> <C-W>l
  " }}}

  " Sudo write (,W) {{{
  noremap <leader>W :w !sudo tee %<CR>
  " }}}

  " Remap :W to :w {{{
  command! W w
  " }}}

  " Better mark jumping (line + col) {{{
  nnoremap ' `
  " }}}

  " Hard to type things {{{
  iabbrev >> →
  iabbrev << ←
  iabbrev ^^ ↑
  iabbrev VV ↓
  iabbrev aa λ
  " }}}

  " Toggle show tabs and trailing spaces (,c) {{{
  set lcs=tab:›\ ,trail:·,eol:¬,nbsp:_
  set fcs=fold:-
  nnoremap <silent> <leader>c :set nolist!<CR>
  " }}}

  " Clear last search (,qs) {{{
  map <silent> <leader>qs <Esc>:noh<CR>
  " map <silent> <leader>qs <Esc>:let @/ = ""<CR>
  " }}}

  " Remap keys for auto-completion menu {{{
  inoremap <expr> <CR>   pumvisible() ? "\<C-y>" : "\<CR>"
  inoremap <expr> <Down> pumvisible() ? "\<C-n>" : "\<Down>"
  inoremap <expr> <Up>   pumvisible() ? "\<C-p>" : "\<Up>"
  " }}}

  " Paste toggle (,p) {{{
  set pastetoggle=<leader>p
  map <leader>p :set invpaste paste?<CR>
  " }}}

  " Yank from cursor to end of line {{{
  nnoremap Y y$
  " }}}

  " Insert newline {{{
  map <leader><Enter> o<ESC>
  " }}}

  " Search and replace word under cursor (,*) {{{
  nnoremap <leader>* :%s/\<<C-r><C-w>\>//<Left>
  vnoremap <leader>* "hy:%s/\V<C-r>h//<left>
  " }}}

  " Strip trailing whitespace (,ss) {{{
  function! StripWhitespace () " {{{
    let save_cursor = getpos(".")
    let old_query = getreg('/')
    :%s/\s\+$//e
    call setpos('.', save_cursor)
    call setreg('/', old_query)
  endfunction " }}}
  noremap <leader>ss :call StripWhitespace ()<CR>
  " }}}

  " Join lines and restore cursor location (J) {{{
  nnoremap J mjJ`j
  " }}}

  " Toggle folds (<Space>) {{{
  nnoremap <silent> <space> :exe 'silent! normal! '.((foldclosed('.')>0)? 'zMzx' : 'zc')<CR>
  " }}}

  " Fix page up and down {{{
  map <PageUp> <C-U>
  map <PageDown> <C-D>
  imap <PageUp> <C-O><C-U>
  imap <PageDown> <C-O><C-D>
  " }}}

  " Show syntax highlighting group upder cursor (F10) {{{
  map <F10> :echo "hi<" . synIDattr(synID(line("."),col("."),1),"name") . '> trans<'
        \ . synIDattr(synID(line("."),col("."),0),"name") . "> lo<"
        \ . synIDattr(synIDtrans(synID(line("."),col("."),1)),"name") . ">"<CR>
  " }}}

  " Relative numbers {{{
  "set relativenumber " Use relative line numbers. Current line is still in status bar.
  "au BufReadPost,BufNewFile * set relativenumber
  " }}}

  " Auto close preview-window after autocomplete {{{
  autocmd CursorMovedI * if pumvisible() == 0|pclose|endif
  autocmd InsertLeave * if pumvisible() == 0|pclose|endif
  " }}}
augroup END
" }}}

" NERD Commenter {{{
augroup nerd_commenter
  autocmd!

  let NERDSpaceDelims=1
  let NERDCompactSexyComs=1
  let g:NERDCustomDelimiters = { 'racket': { 'left': ';', 'leftAlt': '#|', 'rightAlt': '|#' } }
augroup END
" }}}

" Buffers {{{
augroup buffer_control
  autocmd!

  " Buffer navigation (,,) (gb) (gB) (,ls) {{{
  map <Leader>, <C-^>
  map <Leader>ls :buffers<CR>
  map gb :bnext<CR>
  map gB :bprev<CR>
  " }}}

  " Jump to buffer number (<N>gb) {{{
  let c = 1
  while c <= 99
    execute "nnoremap " . c . "gb :" . c . "b\<CR>"
    let c += 1
  endwhile
  " }}}

  " Close Quickfix window (,qq) {{{
  map <leader>qq :cclose<CR>
  " }}}

  " Rename buffer (:Rename) {{{
  function! s:RenameBuffer(name)
    silent! execute 'saveas! ' . a:name
    let l:old_buffer = bufnr("#")
    let l:old_filename = expand("#:t")
    let l:new_buffer = bufnr("%")
    let l:new_filename = expand("%:t")
    silent! execute '!rm ' . shellescape(expand("#"), 1)
    silent! execute 'bd' l:old_buffer
    echom 'Renamed `' . l:old_filename . '` to `' . l:new_filename . '`'
  endfunction
  command! -nargs=1 Rename call s:RenameBuffer(<f-args>)
  " }}}
augroup END
" }}}

" Jumping to tags {{{
augroup jump_to_tags
  autocmd!

  " Basically, <c-]> jumps to tags (like normal) and <c-\> opens the tag in a new
  " split instead.
  "
  " Both of them will align the destination line to the upper middle part of the
  " screen.  Both will pulse the cursor line so you can see where the hell you
  " are.  <c-\> will also fold everything in the buffer and then unfold just
  " enough for you to see the destination line.
  nnoremap <c-]> <c-]>mzzvzz15<c-e>`z:Pulse<cr>
  nnoremap <c-\> <c-w>v<c-]>mzzMzvzz15<c-e>`z:Pulse<cr>

  " Pulse Line (thanks Steve Losh)
  function! s:Pulse() " {{{
    redir => old_hi
      silent execute 'hi CursorLine'
    redir END
    let old_hi = split(old_hi, '\n')[0]
    let old_hi = substitute(old_hi, 'xxx', '', '')

    let steps = 8
    let width = 1
    let start = width
    let end = steps * width
    let color = 233

    for i in range(start, end, width)
      execute "hi CursorLine ctermbg=" . (color + i)
      redraw
      sleep 6m
    endfor
    for i in range(end, start, -1 * width)
      execute "hi CursorLine ctermbg=" . (color + i)
      redraw
      sleep 6m
    endfor

    execute 'hi ' . old_hi
  endfunction " }}}
  command! -nargs=0 Pulse call s:Pulse()
augroup END
" }}}

" Highlight Interesting Words {{{
augroup highlight_interesting_word
  autocmd!
  " This mini-plugin provides a few mappings for highlighting words temporarily.
  "
  " Sometimes you're looking at a hairy piece of code and would like a certain
  " word or two to stand out temporarily.  You can search for it, but that only
  " gives you one color of highlighting.  Now you can use <leader>N where N is
  " a number from 1-6 to highlight the current word in a specific color.
  function! HiInterestingWord(n) " {{{
    " Save our location.
    normal! mz

    " Yank the current word into the z register.
    normal! "zyiw

    " Calculate an arbitrary match ID.  Hopefully nothing else is using it.
    let mid = 86750 + a:n

    " Clear existing matches, but don't worry if they don't exist.
    silent! call matchdelete(mid)

    " Construct a literal pattern that has to match at boundaries.
    let pat = '\V\<' . escape(@z, '\') . '\>'

    " Actually match the words.
    call matchadd("InterestingWord" . a:n, pat, 1, mid)

    " Move back to our original location.
    normal! `z
  endfunction " }}}

  " Mappings {{{
  nnoremap <silent> <leader>1 :call HiInterestingWord(1)<cr>
  nnoremap <silent> <leader>2 :call HiInterestingWord(2)<cr>
  nnoremap <silent> <leader>3 :call HiInterestingWord(3)<cr>
  nnoremap <silent> <leader>4 :call HiInterestingWord(4)<cr>
  nnoremap <silent> <leader>5 :call HiInterestingWord(5)<cr>
  nnoremap <silent> <leader>6 :call HiInterestingWord(6)<cr>
  " }}}

  " Default Highlights {{{
  hi def InterestingWord1 guifg=#000000 ctermfg=16 guibg=#ffa724 ctermbg=214
  hi def InterestingWord2 guifg=#000000 ctermfg=16 guibg=#aeee00 ctermbg=154
  hi def InterestingWord3 guifg=#000000 ctermfg=16 guibg=#8cffba ctermbg=121
  hi def InterestingWord4 guifg=#000000 ctermfg=16 guibg=#b88853 ctermbg=137
  hi def InterestingWord5 guifg=#000000 ctermfg=16 guibg=#ff9eb8 ctermbg=211
  hi def InterestingWord6 guifg=#000000 ctermfg=16 guibg=#ff2c4b ctermbg=195
  " }}}
augroup END
" }}}

" Word Processor Mode {{{
augroup word_processor_mode
  autocmd!

  function! WordProcessorMode() " {{{
    setlocal formatoptions=t1
    map j gj
    map k gk
    setlocal smartindent
    setlocal spell spelllang=en_ca
    setlocal noexpandtab
    setlocal wrap
    setlocal linebreak
    Goyo 100
  endfunction " }}}
  com! WP call WordProcessorMode()
augroup END
" }}}

" Restore Cursor Position {{{
augroup restore_cursor
  autocmd!

  autocmd BufReadPost *
    \ if line("'\"") > 1 && line("'\"") <= line("$") |
    \   exe "normal! g`\"" |
    \ endif
augroup END
" }}}

" Filetypes -------------------------------------------------------------

" JSON {{{
augroup filetype_json
  autocmd!
  au BufRead,BufNewFile *.json set ft=json syntax=javascript
augroup END
" }}}

" Markdown {{{
augroup filetype_markdown
  autocmd!
  let g:markdown_fenced_languages = ['ruby', 'html', 'javascript', 'css', 'erb=eruby.html', 'bash=sh']
augroup END
" }}}

" XML {{{
augroup filetype_xml
  autocmd!
  au FileType xml exe ":silent 1,$!xmllint --format --recover - 2>/dev/null"
augroup END
" }}}

" ZSH {{{
augroup filetype_zsh
  autocmd!
  au BufRead,BufNewFile .zsh_rc,.functions,.commonrc set ft=zsh
augroup END
" }}}

" Plugin Configuration -------------------------------------------------------------

" Airline.vim {{{
augroup airline_config
  autocmd!
  if !exists('g:airline_symbols')
    let g:airline_symbols = {}
  endif
  let g:airline_theme='onedark'
  let g:airline_symbols.linenr = '␤'
  let g:airline_powerline_fonts = 1
  let g:airline#extensions#ale#enabled = 1
  let g:airline#extensions#tabline#buffer_nr_format = '%s '
  let g:airline#extensions#tabline#buffer_nr_show = 1
  let g:airline#extensions#tabline#enabled = 1
  let g:airline#extensions#tabline#fnamecollapse = 0
  let g:airline#extensions#tabline#fnamemod = ':t'
augroup END
" }}}

" Ale.vim {{{
augroup ale_config
  " let g:ale_sign_error = '>>'
  " let g:ale_sign_warning = '--'
  let g:ale_sign_column_always = 0
  let g:ale_set_loclist = 0
  let g:ale_set_quickfix = 1
  let g:ale_linters = {
  \   'typescript': ['tslint', 'tsserver', 'typecheck'],
  \}
augroup END
" }}}

" Silver Searcher {{{
augroup ag_config
  autocmd!

  if executable("ag")
    " Note we extract the column as well as the file and line number
    set grepprg=ag\ --nogroup\ --nocolor\ --column
    set grepformat=%f:%l:%c%m

    " Have the silver searcher ignore all the same things as wilgignore
    let b:ag_command = 'ag %s -i --nocolor --nogroup'

    for i in split(&wildignore, ",")
      let i = substitute(i, '\*/\(.*\)/\*', '\1', 'g')
      let b:ag_command = b:ag_command . ' --ignore "' . substitute(i, '\*/\(.*\)/\*', '\1', 'g') . '"'
    endfor

    let b:ag_command = b:ag_command . ' --hidden -g ""'
  endif
augroup END
" }}}

" fzf {{{
augroup fzf_config
  set rtp+=/usr/local/opt/fzf

  let g:fzf_layout = { 'up': '~40%' }
  let g:fzf_history_dir = '~/.config/nvim/fzf-history'
  let g:fzf_buffers_jump = 1 " Jump to existing buffer if available

  nnoremap <C-p> :Files<CR>
  nnoremap <C-g> :GFiles?<CR>
  nnoremap <C-b> :Buffers<CR>
  nnoremap <C-x> :Tags<CR>
  nnoremap <leader>l :BTags<CR>
  nnoremap <C-m> :Marks<CR>

  " Mapping selecting mappings
  nmap <leader><tab> <plug>(fzf-maps-n)
  xmap <leader><tab> <plug>(fzf-maps-x)
  omap <leader><tab> <plug>(fzf-maps-o)

  " Insert mode completion
  imap <c-x><c-k> <plug>(fzf-complete-word)
  imap <c-x><c-f> <plug>(fzf-complete-path)
  imap <c-x><c-j> <plug>(fzf-complete-file-ag)
  imap <c-x><c-l> <plug>(fzf-complete-line)
augroup END
" }}}

" incsearch.vim {{{
augroup easy_align_config
  autocmd!
  let g:incsearch#auto_nohlsearch = 1
  map /  <Plug>(incsearch-forward)
  map ?  <Plug>(incsearch-backward)
  map g/ <Plug>(incsearch-stay)
  map n  <Plug>(incsearch-nohl-n)
  map N  <Plug>(incsearch-nohl-N)
  map *  <Plug>(incsearch-nohl-*)
  map #  <Plug>(incsearch-nohl-#)
  map g* <Plug>(incsearch-nohl-g*)
  map g# <Plug>(incsearch-nohl-g#)

  " incsearch-easymotion.vim
  map z/ <Plug>(incsearch-easymotion-/)
  map z? <Plug>(incsearch-easymotion-?)
  map zg/ <Plug>(incsearch-easymotion-stay)
augroup END
" }}}

" RainbowParenthesis.vim {{{
augroup rainbow_parenthesis_config
  autocmd!
  nnoremap <leader>rp :RainbowParentheses!!<CR>
  let g:rainbow#pairs = [['(', ')'], ['[', ']'], ['{', '}']]
  let g:rainbow#blacklist = ['#F4CF86', '#FFFFFF']
augroup END
" }}}

" UltiSnip.vim {{{
augroup ultisnip_config
  autocmd!
augroup END

let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"
" }}}

" Nerdtree {{{
"
map <F2> :NERDTreeToggle<CR>
nmap  <leader>t :NERDTreeToggle<CR>
nmap  <leader>f :NERDTreeFind<CR>

" close vim if the only window left open is a NERDTree
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

let g:NERDTreeDirArrowExpandable = '▸'
let g:NERDTreeDirArrowCollapsible = '▾'

" }}}

" deoplete {{{
let g:deoplete#enable_at_startup = 1

set completeopt+=noinsert
set completeopt+=noselect
set completeopt+=menuone
set completeopt-=preview
" }}}

" go {{{
"let g:go_highlight_extra_types = 1
let g:go_highlight_operators = 1
"let g:go_highlight_functions = 1
"let g:go_highlight_types = 1
"let g:go_highlight_fields = 1

let g:go_def_mapping_enabled=1

let g:deoplete#sources#go#gocode_binary = $HOME.'/go/bin/gocode'
let g:deoplete#sources#go#sort_class = ['package', 'func', 'type', 'var', 'const']
let g:deoplete#sources#go#pointer=1

au FileType go nmap <leader>gs <Plug>(go-def-split)
au FileType go nmap <leader>gv <Plug>(go-def-vertical)
au FileType go nmap <leader>gt <Plug>(go-def-tab)
au FileType go nmap <leader>gl :GoImports<Enter>
" }}}

" Plugins -------------------------------------------------------------

" Load plugins {{{
call plug#begin('~/.config/nvim/plugged')

Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'zchee/deoplete-go', { 'do': 'make'}

Plug 'bling/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'easymotion/vim-easymotion'
Plug 'elzr/vim-json'
Plug 'scrooloose/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'haya14busa/incsearch.vim'
Plug 'haya14busa/incsearch-easymotion.vim'
Plug 'junegunn/fzf',           { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'junegunn/rainbow_parentheses.vim'
Plug 'nathanaelkane/vim-indent-guides'
Plug 'rking/ag.vim'
Plug 'scrooloose/nerdcommenter'
Plug 'Shougo/vimproc.vim',     { 'do' : 'make' }
Plug 'w0rp/ale'
Plug 'SirVer/ultisnips'
Plug 'fatih/vim-go'
Plug 'edkolev/tmuxline.vim'
Plug 'airblade/vim-gitgutter'
Plug 'jiangmiao/auto-pairs'
Plug 'joshdick/onedark.vim'

"Plug 'altercation/vim-colors-solarized'
"Plug 'junegunn/seoul256.vim'
"Plug 'NLKNguyen/papercolor-theme'

call plug#end()
" }}}

" Syntax highlighting {{{
colo onedark
  " }}}
