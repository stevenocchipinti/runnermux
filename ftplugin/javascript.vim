" Vim filetype plugin
" Maintainer: Steve Occhipinti

" TODO: This probably doesn't work.. yet
map <leader>t :w:call Runnermux("open http://localhost:8888/?spec=".expand('%'))
map <leader>T :w:call Runnermux("open http://localhost:8888/?spec=".expand('%').":".line('.'))
