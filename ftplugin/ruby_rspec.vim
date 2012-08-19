" Vim filetype plugin
" Maintainer: Steve Occhipinti

map <leader>t :w:call Send_to_Tmux("bundle exec rspec ".expand('%'))
map <leader>T :w:call Send_to_Tmux("bundle exec rspec ".expand('%').":".line('.'))
