" Vim filetype plugin
" Maintainer: Steve Occhipinti

map <leader>t :w:call Runnermux("bundle exec cucumber -r features ".expand('%'))
map <leader>T :w:call Runnermux("bundle exec cucumber -r features ".expand('%').":".line('.'))
