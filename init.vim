"=====================================================
" Common settings
"=====================================================
" tabs and spaces handling
set expandtab
set tabstop=4
set shiftwidth=4
set softtabstop=0
set smartindent
set number 
set relativenumber
set scrolloff=8
set hidden
set path+=**
set title
set mouse=a
set termguicolors
set listchars=tab:→\ ,space:·
set list
set nowrap
set ignorecase
set smartcase
let g:python_host_prog = '/usr/bin/python2'
let g:python3_host_prog = '/usr/bin/python3'
let mapleader=","
" undo
set undodir=~/.vim/undodir
set undofile
set undolevels=1000
set undoreload=10000
" local .vimrc
set exrc
set secure


"=====================================================
" File specific settings
"=====================================================
au FileType tex,latex set noexpandtab
au BufNewFile,BufRead *.tex set noexpandtab
au FileType html,javascript,javascriptreact set tabstop=2 shiftwidth=2
au FileType javascriptreact runtime ftplugin/html/sparkup.vim


"=====================================================
" Plugin settings
"=====================================================
" colorscheme
autocmd vimenter * ++nested colorscheme gruvbox
autocmd vimenter * ++nested colorscheme vimterial
let g:gruvbox_contrast_dark="soft"
" jedi-vim
let g:jedi#environment_path = $VIRTUAL_ENV
let g:jedi#smart_auto_mappings = 1
let g:jedi#documentation_command = '?'
autocmd FileType python setlocal completeopt-=preview
" deoplete
let g:deoplete#enable_at_startup = 1
" airline
let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1
let g:airline_theme='powerlineish'
" pymode
let g:pymode = 1
let g:pymode_options_max_line_length = 119
let g:pymode_folding = 0
let g:pymoe_doc = 0
" let g:pymode_doc_bind = '?'
let g:pymode_lint_on_fly = 0
let g:pymode_lint_on_write = 0
let g:pymode_lint_options_pep8 = {'max_line_length': g:pymode_options_max_line_length}
let completeopt = 'menuone,noinsert'
let g:pymode_rope = 1
let g:pymode_rope_completion = 0
let g:pymode_rope_complete_on_dot = 0
" let g:pymode_rope_rename_bind = '<Leader>rr'
let g:pymode_rope_autoimport = 1
let g:pymode_rope_autoimport_import_after_complete = 1
let g:pymode_rope_goto_definition_bind = 'gd'
let g:pymode_rope_goto_definition_cmd = 'edit'
let g:pymode_syntax = 1
let g:pymode_syntax_all = 1
" python-syntax
let g:python_highlight_all = 0
let g:python_highlight_builtins = 1
let g:python_highlight_builtin_objs = 1
" gutentags
let g:gutentags_enabled = 1
" vim-auto-save
let g:auto_save = 1
" vim-closetag
let g:closetag_filetypes = 'html,xhtml,phtml,javascript'


"=====================================================
" Mappings
"=====================================================
inoremap <M-h> <Left>
inoremap <M-j> <Down>
inoremap <M-k> <Up>
inoremap <M-l> <Right>
inoremap <M-4> <End>
inoremap <M-0> <Home>
" buffers
noremap <M-k> :bp<CR>
noremap <M-j> :bn<CR> 
nnoremap <M-q> :bd<CR>
" windows
nnoremap <C-l> <C-w>l
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-q> <C-w>c
" Map save to Ctrl + S
map <C-s> :w<CR>
imap <C-s> <C-o>:w<CR>
nnoremap <Leader>s :w<CR>
" edit vim config
nnoremap <Leader>ve :e $MYVIMRC<CR>
nnoremap <Leader>vr :source $MYVIMRC<CR>
" open terminal
nnoremap <Leader>t <C-w>s <C-w>j :terminal<CR>i
" plug
nnoremap <Leader>pi :PlugInstall<CR>
nnoremap <Leader>pc :PlugClean<CR>
" NERDTree
function MyNerdToggle()
    if exists("g:NERDTree") && g:NERDTree.IsOpen()
        NERDTreeClose
    elseif filereadable(expand('%'))
        NERDTreeFind
    else
        NERDTree
    endif
endfunction

nnoremap <F3> :call MyNerdToggle()<CR>
let NERDTreeQuitOnOpen=1
let NERDTreeMinimalUI=1
" Copy to system clipboard
vnoremap <C-c> "+y
" Paste from system clipboard with Ctrl + v
inoremap <C-v> <Esc>"+p
nnoremap <Leader>p "0p
vnoremap <Leader>p "0p
nnoremap <Leader>h viw"0p
" Move lines up and down
nnoremap J :m .+1<CR>==
nnoremap K :m .-2<CR>==
vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '<-2<CR>gv=gv
" Shift 
vnoremap > >gv
vnoremap < <gv
" FZF
nnoremap <Leader>ff :Files<CR>
nnoremap <Leader>ft :Tags<CR>
nnoremap <Leader>fb :Buffers<CR>
nnoremap <Leader>fh :History<CR>
nnoremap <Leader>fm :Maps<CR>
" jedi-vim
imap <C-j> <C-n>
imap <C-k> <C-p>
" make
nnoremap <Leader>m :make<CR>
" Join
nnoremap <Leader>j :Join ' '<CR>k
nnoremap <Leader>J :Join ' ' -1<CR>k
" vim-split-line
nnoremap <Leader>s :SplitLine<CR>
" undotree
nnoremap <F5> :UndotreeToggle<CR>:UndotreeFocus<CR>


"=====================================================
" Plugins
"=====================================================
call plug#begin('~/.local/share/nvim/plugged')
" appearance
Plug 'morhetz/gruvbox'
Plug 'larsbs/vimterial_dark'
Plug 'mhartington/oceanic-next'
Plug 'larsbs/vimterial'
Plug 'jackiehluo/vim-material'
Plug 'larsbs/vimtom'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
" autocomplete
Plug 'davidhalter/jedi-vim'
Plug 'ervandew/supertab'
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'deoplete-plugins/deoplete-jedi'
" git
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-fugitive'
" editing
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-commentary'
Plug 'sk1418/Join'
Plug 'drzel/vim-split-line'
Plug 'jiangmiao/auto-pairs'
Plug 'alvan/vim-closetag'
" html
Plug 'rstacruz/sparkup', {'rtp': 'vim/'}
" NERDTree
Plug 'preservim/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'ryanoasis/vim-devicons'
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
Plug 'scrooloose/nerdtree-project-plugin'
" FZF
Plug 'junegunn/fzf', { 'do': './install --all && ln -sf $(pwd) ~/.fzf'}
Plug 'junegunn/fzf.vim'
" Python
Plug 'python-mode/python-mode', { 'for': 'python', 'branch': 'develop' }
" JS
Plug 'neoclide/vim-jsx-improve'
" TaTeX
Plug 'lervag/vimtex'
" undo
Plug 'mbbill/undotree'
"tags
Plug 'ludovicchabant/vim-gutentags'
Plug 'preservim/tagbar'
" other
Plug 'andymass/vim-matchup'
Plug 'spinks/vim-leader-guide'
Plug '907th/vim-auto-save'
" russian layout
Plug 'powerman/vim-plugin-ruscmd'

call plug#end()
