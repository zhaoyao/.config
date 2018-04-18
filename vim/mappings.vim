
augroup key_mapping
    autocmd!
    " Window-control prefix
    nnoremap  [Window]   <Nop>
    nmap      s [Window]


    " Fast saving
    nnoremap <silent><Leader>w :write<CR>
    vnoremap <silent><Leader>w <Esc>:write<CR>
    nnoremap <silent><C-s> :<C-u>write<CR>
    vnoremap <silent><C-s> :<C-u>write<CR>
    cnoremap <silent><C-s> <C-u>write<CR>


    " Save a file with sudo
    " http://forrst.com/posts/Use_w_to_sudo_write_a_file_with_Vim-uAN
    cmap W!! w !sudo tee % >/dev/null

    " Toggle editor visuals
    nmap <silent> <Leader>ts :setlocal spell!<cr>
    nmap <silent> <Leader>tn :setlocal nonumber!<CR>
    nmap <silent> <Leader>tl :setlocal nolist!<CR>
    nmap <silent> <Leader>th :nohlsearch<CR>
    nmap <silent> <Leader>tw :setlocal wrap! breakindent!<CR>


    " Location list movement
    nmap <Leader>j :lnext<CR>
    nmap <Leader>k :lprev<CR>


    nnoremap <silent> [Window]v  :<C-u>split<CR>
    nnoremap <silent> [Window]g  :<C-u>vsplit<CR>
    nnoremap <silent> [Window]t  :tabnew<CR>
    nnoremap <silent> [Window]o  :<C-u>only<CR>
    nnoremap <silent> [Window]b  :b#<CR>
    nnoremap <silent> [Window]c  :close<CR>

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


augroup END