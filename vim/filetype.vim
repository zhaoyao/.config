
" Reload vim config automatically {{{
execute 'autocmd MyAutoCmd BufWritePost '.$VIMPATH.'/*,vimrc nested'
	\ .' source $MYVIMRC | redraw | silent doautocmd ColorScheme'
" }}}



augroup MyAutoCmd " {{{
	autocmd Syntax * if 5000 < line('$') | syntax sync minlines=200 | endif


	" Update filetype on save if empty
	autocmd BufWritePost * nested
		\ if &l:filetype ==# '' || exists('b:ftdetect')
		\ |   unlet! b:ftdetect
		\ |   filetype detect
		\ | endif


	" When editing a file, always jump to the last known cursor position.
	" Don't do it when the position is invalid or when inside an event handler
	autocmd BufReadPost *
		\ if &ft !~ '^git\c' && ! &diff && line("'\"") > 0 && line("'\"") <= line("$")
		\|   execute 'normal! g`"zvzz'
		\| endif

augroup END " }}}