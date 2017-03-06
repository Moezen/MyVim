set nocompatible              " be iMproved, required
filetype off                  " required

" git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.
" plugin on GitHub repo
Plugin 'tpope/vim-fugitive'
" plugin from http://vim-scripts.org/vim/scripts.html
" Plugin 'L9'
" Common
Plugin 'taglist.vim'
Plugin 'The-NERD-Commenter'
Plugin 'indent-Guides'
Plugin 'ctrlp.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'ntpeters/vim-better-whitespace'
Plugin 'scrooloose/syntastic'
Plugin 'Valloric/YouCompleteMe'
Plugin 'bling/vim-airline'
Plugin 'junegunn/vim-easy-align'
Plugin 'tpope/vim-commentary'
Plugin 'tpope/vim-surround'

" HTML
Plugin 'closetag.vim'

" Python
Plugin 'django_templates.vim'
Plugin 'hynek/vim-python-pep8-indent'
Plugin 'vim-flake8'

" Lua
Plugin 'xolox/vim-misc'
" Plugin 'tbastos/vim-lua'
Plugin 'WolfgangMehner/lua-support'

" nginx
Plugin 'nginx.vim'

" markdown
Plugin 'godlygeek/tabular'
Plugin 'plasticboy/vim-markdown'

" The sparkup vim script is in a subdirectory of this repo called vim.
" Pass the path to set the runtimepath properly.
Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}

Plugin 'indenthtml.vim'

" vim plugin of go
Plugin 'fatih/vim-go'

" themes
Plugin 'sickill/vim-monokai'
Plugin 'altercation/vim-colors-solarized'
Plugin 'jonathanfilip/vim-lucius'
Plugin 'chriskempson/tomorrow-theme'
Plugin 'chriskempson/vim-tomorrow-theme'
Plugin 'therubymug/vim-pyte'


" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line

" tab navigation like firefox
"

" syntastic {
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
set laststatus=2

" python {
function! GetPythonVersion()
    let python_version = system("python -c 'import sys; print(sys.version_info[0])'")[0]
    return python_version
endfunction
let python_version = GetPythonVersion()
let flake8_exec = '/usr/local/bin/flake8-python' . python_version
" }

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_loc_list_height = 5
let g:syntastic_python_checkers = ['flake8']
let g:syntastic_python_flake8_exec = flake8_exec
" let g:syntastic_python_flake8_exe = 'python3 -m flake8'
" }

" airline {
let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1
let g:airline_theme = 'bubblegum'
" }

" flake8 {
let g:flake8_ignore = "E402"
" }

let g:solarized_termcolors=256
syntax enable
set background=dark
" colorscheme Tomorrow-Night-Eighties
colorscheme solarized

set encoding=utf-8
set fileencodings=utf-8,gbk
set fencs=utf-8,gbk
set langmenu=zh_CN.UTF-8
set helplang=cn

set nu!
set ts=4
set expandtab
set autoindent
set hlsearch
set history=1000
set undofile
set undodir=/home/moezen/.vimbackup/

set mouse-=a
set splitbelow
set splitright

set pastetoggle=π

set shiftwidth=4

set backspace=indent,start

:let g:html_indent_inctags = "html,body,head,tbody"

" shortcuts
" tab
nnoremap <C-t>     :tabnew<CR>
inoremap <C-t>     <Esc>:tabnew<CR>

nnoremap <S-H>     :tabpre<CR>
nnoremap <S-L>     :tabne<CR>
nnoremap <D-L>     :tabne<CR>
nnoremap <D-l>     :tabne<CR>

" window
nnoremap <C-h>     <C-W>h<C-W><ESC>
nnoremap <C-l>     <C-W>l<C-W><ESC>
nnoremap <C-j>     <C-W>j<C-W><ESC>
nnoremap <C-k>     <C-W>k<C-W><ESC>

noremap j gj
noremap k gk

" NERD TREE
map <C-n> :NERDTreeToggle<CR>

" auto strip whitespace
map <C-s> 	:StripWhitespace<CR>

" lua
:let g:Lua_GlobalTemplateFile = '~/.vim/bundle/lua-support/lua-support/templates/Templates'
:let g:Templates_PersonalizationFile = '~/.vim/bundle/lua-support/lua-support/template*'

" HTML
:let g:closetag_html_style=1
autocmd Filetype html,jinja,htmldjango,xml,xsl source ~/.vim/bundle/closetag.vim/plugin/closetag.vim

" Jinja
au BufNewFile,BufRead *.j2 set filetype=jinja

" markdown
let g:vim_markdown_folding_disabled = 1

" Start interactive EasyAlign in visual mode (e.g. vipga)
xmap ga <Plug>(EasyAlign)

" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)
