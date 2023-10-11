" Ref: https://github.com/neovim/neovim/issues/2437
let g:python_host_prog  = '~/.pyenv/shims/python'
let g:python3_host_prog = '~/.pyenv/shims/python'


" Basic
syntax on

set mouse=
set nowrap
set ignorecase

set noswapfile
set undodir=~/.config/nvim/undodir              " 历史记录文件地址
set undofile                                    " 历史记录记录到文件中

" tab宽度
set tabstop=4                                   " tab 的可视化宽度
set softtabstop=4                               " tab 的空格数
set shiftwidth=4                                " 缩进的空格数
set expandtab                                   " tab 的时候转为空格
set smartindent                                 " tab respect 'tabstop', 'shiftwidth', 'softtabstop'
set autoindent                                  " 新行自动缩进
autocmd FileType go setlocal noexpandtab        " golang 文件中 tab 不要转为空格

set showmatch
set hlsearch
set incsearch                                   " 增量式搜索
set scrolloff=8                                 " 滚动的时候永远会和最上最下隔8行
set number                                      " 显示行号
set laststatus=2                                " 总是显示状态栏
set clipboard=unnamed                           " 共享系统剪切板
set cursorline                                  " 高亮光标所在行
set cursorcolumn                                " 高亮光标所在列
set backspace=2
set foldmethod=indent                           " 按照缩进折叠
set foldlevel=999

" 空白符可视化
set list "Show tabs via listchars below, and display end sign after endo fline.
set listchars=space:·,tab:▸\ ,eol:¬,extends:❯,precedes:❮ "Chars that to display list.

set updatetime=300


function! HighlightExtraWhitespace()
  highlight ExtraWhitespace ctermbg=red guibg=#EC7063
  match ExtraWhitespace /\s\+$/
endfunction

autocmd BufWinEnter * if &buftype != 'terminal' | call HighlightExtraWhitespace() | endif

"保存时自动清理行尾空白
command! WS :%s/\s\+$//e
autocmd BufWrite * :WS


""""""""""" key map """""""""""
" set max height and width to current window
nnoremap <c-l> <c-w>_<c-w><bar>
nnoremap + <c-w>=:NvimTreeResize 30<CR>

" move to the begining/end of the line
noremap H 0
noremap L $

" emacs-style key bindings in cmd & ins mode
noremap! <c-a> <Home>
noremap! <c-e> <End>
noremap! <c-f> <Right>
noremap! <c-b> <Left>
noremap! <c-d> <Del>
noremap! <c-h> <BS>
noremap! <a-b> <S-Left>
noremap! <a-f> <S-Right>

" copy relative file path of current buffer
nmap cp :let @+ = expand("%")<cr>
"""""""""""""""""""""""""""""""

" ftplugin installs a buffer-local mapping for Ctrl-C
" reconfigure it to use <C-j> instead
" ref: https://unix.stackexchange.com/questions/150093/vim-delay-when-using-ctrlc-but-only-in-sql-files
let g:ftplugin_sql_omni_key = '<C-j>'

" send changing words to the black hole
" ref:https://stackoverflow.com/questions/11993851/how-to-delete-not-cut-in-vim
nnoremap c "_d
vnoremap c "_d
vnoremap p "_dP
