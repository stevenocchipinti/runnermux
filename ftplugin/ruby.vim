" Vim filetype plugin
" Maintainer: Steve Occhipinti

map <leader>t :w:call RunnermuxRubyFile()
map <leader>T :w:call RunnermuxRubyLine()

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


function! RunnermuxRubyLine()
  if exists('g:runnermuxDontUseSpin')
    call Runnermux("bundle exec rspec ".expand('%').":".line('.'))
  else
    call Runnermux("bundle exec spin push ".expand('%').":".line('.'), "spin")
  endif
endfunction

function! RunnermuxRubyFile()
  if exists('g:runnermuxDontUseSpin')
    call Runnermux("bundle exec rspec ".expand('%'))
  else
    call Runnermux("bundle exec spin push ".expand('%'), "spin")
  endif
endfunction
