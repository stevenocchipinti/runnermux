if exists('runnermux_use_spin')
  if g:runnermux_use_spin == 'always'
    map <leader>t :w:call Runnermux("bundle exec spin push ".expand('%'), "spin")
    map <leader>T :w:call Runnermux("bundle exec spin push ".expand('%').":".line('.'), "spin")
  elseif g:runnermux_use_spin == 'auto'
    " Dont use spin for view specs
    map <leader>t :w:call RunnermuxRubyAutoFile()
    map <leader>T :w:call RunnermuxRubyAutoLine()
    " Dont set the flag if the current buffer is a view spec
    au! BufEnter * let g:_runnermux_use_spin = 1
    au! BufEnter */spec/views/*.rb unlet! g:_runnermux_use_spin
  endif
else
  map <leader>t :w:call Runnermux("bundle exec rspec ".expand('%'))
  map <leader>T :w:call Runnermux("bundle exec rspec ".expand('%').":".line('.'))
endif


function! RunnermuxRubyAutoLine()
  if exists('g:_runnermux_use_spin')
    call Runnermux("bundle exec spin push ".expand('%').":".line('.'), "spin")
  else
    call Runnermux("bundle exec rspec ".expand('%').":".line('.'))
  endif
endfunction

function! RunnermuxRubyAutoFile()
  if exists('g:_runnermux_use_spin')
    call Runnermux("bundle exec spin push ".expand('%'), "spin")
  else
    call Runnermux("bundle exec rspec ".expand('%'))
  endif
endfunction
