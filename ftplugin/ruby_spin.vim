" Vim filetype plugin
" Maintainer: Steve Occhipinti

map <leader>t :w:call Runnermux("bundle exec spin push ".expand('%'), "spin")
map <leader>T :w:call Runnermux("bundle exec spin push ".expand('%').":".line('.'), "spin")
