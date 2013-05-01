" Make tslime default to RunnerMux's runner window
let g:tmux_sessionname = 'runnermux'
let g:tmux_windowname = 'runner'
let g:tmux_panenumber = 0

" Used to track the previously user window and command
let g:runnermux_command = ''
let g:runnermux_window = ''


" This is just a wrapper for Tslime's function
command! RunnermuxSetup call Tmux_Vars()


" Send keys to a running Tmux session
" If a window name is given, swap to that then run the command
" Otherwise, default to the 'runner' window
function! Runnermux(text, ...)
  if a:0 == 1
    let g:runnermux_window = a:1
  else
    let g:runnermux_window = "runner"
  endif
  call system("tmux select-window -t runnermux:" . g:runnermux_window)
  let g:runnermux_command = a:text
  let g:dir = substitute(expand("%:p"), "\\(features\\|spec\\).*", "", "")
  call Send_to_Tmux("cd " . g:dir . " && " . g:runnermux_command)
  redraw
  echo
endfunction
command! -nargs=1 RunnermuxSend call Runnermux('<args>')


" Send the last command to a running Tmux session
function! RunnermuxLastCommand()
  call system("tmux select-window -t runnermux:" . g:runnermux_window)
  call Send_to_Tmux("cd " . g:dir . " && " . g:runnermux_command)
endfunction
command! RunnermuxSendLastCommand call RunnermuxLastCommand()
map <leader>. :w:call RunnermuxLastCommand()
