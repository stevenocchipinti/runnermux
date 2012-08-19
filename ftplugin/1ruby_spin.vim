" Vim filetype plugin
" Maintainer: Steve Occhipinti
"
" TODO: Make this work with both rspec and spin... somehow
" NOTE: Spin doesn't work very well for view specs, so revert to command line

exe "!which spin"
if v:shell_error
  exe "!which rpsec"
  if v:shell_error
    echo "Could not find 'spin' or 'rspec'"
  else
    let rspec_command = "bundle exec rspec "
  endif
else
  let rspec_command = "bundle exec spin push "
endif

map <leader>t :w:!bundle exec spin push %
map <leader>T :w:call SpinLine()
function! SpinLine()
  call Send_to_Tmux(rspec_command.expand('%').":".line('.'))
endfunction


"au! BufRead,BufNewFile */spec/views/*.rb set colorcolumn=60,65,70,75


map <leader>t :w:call Send_to_Tmux("bundle exec rspec ".expand('%'))
map <leader>T :w:call Send_to_Tmux("bundle exec rspec ".expand('%').":".line('.'))
