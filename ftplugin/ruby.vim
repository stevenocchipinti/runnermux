if exists('runnermux_use_spin')
  if g:runnermux_use_spin == 'always'
    map <leader>t :w:call Runnermux("bundle exec spin push ".expand('%'), "spin")
    map <leader>T :w:call Runnermux("bundle exec spin push ".expand('%').":".line('.'), "spin")
  elseif g:runnermux_use_spin == 'notviews'
    " dont use spin for view tests? || only use spin if it is available || both?
    "au! BufRead,BufNewFile */spec/views/*.rb set colorcolumn=60,65,70,75
  elseif g:runnermux_use_spin == 'auto'
    " If spin is available && not for views
  endif
else
  map <leader>t :w:call Runnermux("bundle exec rspec ".expand('%'))
  map <leader>T :w:call Runnermux("bundle exec rspec ".expand('%').":".line('.'))
endif


" A potential way to detect if spin is available
"exe "!which spin"
"if v:shell_error
"  exe "!which rpsec"
"  if v:shell_error
"    echo "Could not find 'spin' or 'rspec'"
"  else
"    let rspec_command = "bundle exec rspec "
"  endif
"else
"  let rspec_command = "bundle exec spin push "
"endif
