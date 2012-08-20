" Make tslime default to RunnerMux's runner window
let g:tmux_sessionname = 'runnermux'
let g:tmux_windowname = 'runner'
let g:tmux_panenumber = 0

function! Runnermux(text, ...)
  if a:0 == 1
    call system("tmux select-window -t runnermux:" . a:1)
  else
    call system("tmux select-window -t runnermux:runner")
  endif
  call Send_to_Tmux(a:text)
  redraw
  echo
endfunction
