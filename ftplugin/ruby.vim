" Vim filetype plugin
" Maintainer: Steve Occhipinti

map <leader>t :w:call RunnermuxRubyTest(expand('%:p'))
map <leader>T :w:call RunnermuxRubyTest(expand('%:p').":".line('.'))

" Dont use zeus for view specs
au! BufEnter * call RunnermuxCheckForZeus()
au! BufEnter */spec/views/*.rb let g:runnermuxDontUseZeus = 1


" Dont use Zeus if it is not available
function! RunnermuxCheckForZeus()
  call system("which zeus")
  if v:shell_error == 0
    unlet! g:runnermuxDontUseZeus
  else
    let g:runnermuxDontUseZeus = 1
  endif
endfunction


function! RunnermuxRubyTest(test)
  if exists('g:runnermuxDontUseZeus')
    call Runnermux("bundle exec rspec ".a:test)
  else
    call Runnermux("zeus test ".a:test)
  endif
endfunction
