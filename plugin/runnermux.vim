" Make tslime default to RunnerMux's runner window
let g:tmux_sessionname = 'runnermux'
let g:tmux_windowname = 'runner'
let g:tmux_panenumber = 0


" This is just a wrapper for Tslime's function
command! RunnermuxSetup call Tmux_Vars()


" Send keys to a running Tmux session
" If a window name is given, swap to that then run the command
" Otherwise, default to the 'runner' window
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
command! -nargs=1 RunnermuxSend call Runnermux('<args>')
