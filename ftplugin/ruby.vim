" Vim filetype plugin
" Maintainer: Steve Occhipinti

map <leader>t :w:call RunnermuxRubyTest(expand('%:p'))
map <leader>T :w:call RunnermuxRubyTest(expand('%:p').":".line('.'))

" Dont use spin for view specs
au! BufEnter * call RunnermuxCheckForSpin()
au! BufEnter */spec/views/*.rb let g:runnermuxDontUseSpin = 1


" Dont use spin if it is not available
function! RunnermuxCheckForSpin()
  call system("bundle exec which spin")
  if v:shell_error == 0
    unlet! g:runnermuxDontUseSpin
  else
    let g:runnermuxDontUseSpin = 1
  endif
endfunction


function! RunnermuxRubyTest(test)
  if exists('g:runnermuxDontUseSpin')
    call Runnermux("bundle exec rspec ".a:test)
  else
    call Runnermux("bundle exec spin push ".a:test, "spin")
  endif
endfunction
