" Vim filetype plugin
" Maintainer: Steve Occhipinti

map <leader>t :w:call Runnermux("bundle exec spin push ".expand('%'), "spin")
map <leader>T :w:call Runnermux("bundle exec spin push ".expand('%').":".line('.'), "spin")

" To use RSpec instead of Spin, use these mapping instead
"map <leader>t :w:call Runnermux("bundle exec rspec ".expand('%'))
"map <leader>T :w:call Runnermux("bundle exec rspec ".expand('%').":".line('.'))
