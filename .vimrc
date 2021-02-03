"================
"Editor Behaviour
"================
set number
set relativenumber
set hidden
set cursorline
set noexpandtab
set tabstop=2
set shiftwidth=2
set softtabstop=2
set autoindent
set list
set listchars=tab:\|\ ,trail:▫
set scrolloff=4
set ttimeoutlen=0
set timeoutlen=500
set viewoptions=cursor,folds,slash,unix
set wrap
set tw=0
set indentexpr=
set foldmethod=indent
set foldlevel=99
set foldenable
set formatoptions-=tc
set splitright
set splitbelow
set noshowmode
set showcmd
set wildmenu
set ignorecase
set smartcase
set shortmess+=c
set completeopt=longest,noinsert,menuone,noselect,preview
set ttyfast "should make scrolling faster
set lazyredraw "same as above
"set visualbell
set nobackup
set nowritebackup
set cmdheight=2
set updatetime=300
set shortmess+=c
set belloff=all
set t_Co=256
set termguicolors
set signcolumn=yes " for ale sign column

"===
"===Baisc Mappings
"===
" Set <LEADER> as <SPACE>, ; as :
let mapleader=" "
noremap ; :

" Save & quit
noremap Q :q<CR>
noremap <C-q> :qa<CR>
noremap S :w<CR>
" Open the vimrc file anytime
noremap <LEADER>rc :e ~/.vimrc<CR>

" Insert Key
noremap h i
noremap H I

" make Y to copy till the end of the line
nnoremap Y y$

" Copy to system clipboard
vnoremap Y "+y

" Indentation
"nnoremap < <<
"nnoremap > >>

" Search
noremap <LEADER><CR> :nohlsearch<CR>

"===============
"Cursor Movement
"===============
" New cursor movement (the default arrow keys are used for resizing windows)
"     ^
"     i
" < j   l >
"     k
"     v
noremap <silent> i k
noremap <silent> j h
noremap <silent> k j
noremap <silent> l l
noremap <silent> gi gk
noremap <silent> gk gj
noremap <silent> \v v$h

" U/E keys for 5 times u/e (faster navigation)
noremap <silent> I 5k
noremap <silent> K 5j

" N key: go to the start of the line
noremap <silent> J 0
" I key: go to the end of the line
noremap <silent> L $

" Faster in-line navigation
noremap W 5w
noremap B 5b

" Ctrl + U or E will move up/down the view port without moving the cursor
noremap <C-I> 5<C-y>
" this keybind is used by coc
noremap <C-K> 5<C-e>

" ===
" === Searching
" ===
noremap - N
noremap = n


" ===
" === Window management
" ===
" Use <space> + new arrow keys for moving the cursor around windows
noremap <LEADER>w <C-w>w
noremap <LEADER>i <C-w>k
noremap <LEADER>k <C-w>j
noremap <LEADER>j <C-w>h
noremap <LEADER>l <C-w>l

" window management for repl windows
tnoremap <C-h> <C-w><C-h>

" Disable the default `s` key
noremap s <nop>

" split the screens to up (horizontal), down (horizontal), left (vertical), right (vertical)
noremap si :set nosplitbelow<CR>:split<CR>:set splitbelow<CR>
noremap sk :set splitbelow<CR>:split<CR>
noremap sj :set nosplitright<CR>:vsplit<CR>:set splitright<CR>
noremap sl :set splitright<CR>:vsplit<CR>

" Resize splits with arrow keys
noremap <up> :res +5<CR>
noremap <down> :res -5<CR>
noremap <left> :vertical resize-5<CR>
noremap <right> :vertical resize+5<CR>

" Place the two screens up and down
noremap sh <C-w>t<C-w>K
" Place the two screens side by side
noremap sv <C-w>t<C-w>H

" Rotate screens
noremap srh <C-w>b<C-w>K
noremap srv <C-w>b<C-w>H

" Press <SPACE> + q to close the window below the current window
noremap <LEADER>q <C-w>j:q<CR>


" Compile function
noremap <F5> :call CompileRunGcc()<CR>
func! CompileRunGcc()
	exec "w"
	if &filetype == 'python'
	set splitbelow
	:term python3 %
	exec "!time python3 %"
	endif
endfunc


" ===
" === Tab Management
" ===
" Create a new tab with tu
noremap ti :tabe<CR>
" Move around tabs with tn and ti
noremap tj :-tabnext<CR>
noremap tl :+tabnext<CR>
" Move the tabs with tmn and tmi
noremap tmj :-tabmove<CR>
noremap tml :+tabmove<CR>


" ===
" === Docstring
" ===
map <F4> :call AddTitle()<cr>'s
function AddTitle()
	call append(0,"# !/usr/bin/env python")
	call append(1,"")
	call append(2,"\"\"\"")
	call append(3,"Author: Jiyang Li")
	call append(4,"")
	call append(5,"Created: ".strftime("%Y-%m-%d %H:%M"))
	call append(6,"")
	call append(7,"Filename: ".expand("%:t"))
	call append(8,"")
	call append(9,"Description: ")
	call append(10,"")
	call append(11,"\"\"\"")
	echohl WarningMsg | echo "Successful in adding the copyright." | echohl None
endf

" ===
" === Plugins
" ===

if empty(glob('~/.vim/autoload/plug.vim'))
silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
\ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin()

" airline
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" colorscheme
Plug 'rakr/vim-one'
Plug 'ajmwagar/vim-deus'
Plug 'morhetz/gruvbox'

" coc
Plug 'neoclide/coc.nvim', {'branch': 'release'}

" ALE
Plug 'dense-analysis/ale'

" Ranger.vim
Plug 'francoiscabrol/ranger.vim'

" vim-visual-multi
Plug 'mg979/vim-visual-multi', {'branch': 'master'}

" Nerd Commentor
Plug 'preservim/nerdcommenter'

"indentLine
Plug 'Yggdroot/indentLine'

" REPL
Plug 'sillybun/vim-repl'

" Start Menu
Plug 'mhinz/vim-startify'

" Formatter
Plug 'Chiel92/vim-autoformat'

" Markdown
Plug 'suan/vim-instant-markdown', {'for': 'markdown'}
Plug 'dhruvasagar/vim-table-mode'
Plug 'mzlogin/vim-markdown-toc', { 'for': ['gitignore', 'markdown', 'vim-plug'] }
Plug 'dkarter/bullets.vim'

" Change Surround
Plug 'tpope/vim-surround'

" Select words
Plug 'gcmt/wildfire.vim'

" go
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }

" xtabline
Plug 'mg979/vim-xtabline'

" auto add docstring
Plug 'heavenshell/vim-pydocstring', { 'do': 'make install' }

call plug#end()

" ===
" === Coc Config
" ===
" extensions
let g:coc_global_extensions = ['coc-explorer', 'coc-translator', 'coc-snippets', 'coc-pairs']
" Use tab for trigger completion with characters ahead and navigate.
inoremap <silent><expr> <TAB>
			\ pumvisible() ? "\<C-n>" :
			\ <SID>check_back_space() ? "\<TAB>" :
			\ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"
function! s:check_back_space() abort
	let col = col('.') - 1
	return !col || getline('.')[col - 1]  =~# '\s'
endfunction
" Use `[g` and `]g` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)
" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
" show document
nnoremap <silent> <leader>d :call <SID>show_documentation()<CR>

function! s:show_documentation()
	if (index(['vim','help'], &filetype) >= 0)
		execute 'h '.expand('<cword>')
	elseif (coc#rpc#ready())
		call CocActionAsync('doHover')
	else
		execute '!' . &keywordprg . " " . expand('<cword>')
	endif
endfunction
" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')
" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)
" Remap <C-f> and <C-b> for scroll float windows/popups.
if has('nvim-0.4.0') || has('patch-8.2.0750')
	nnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
	nnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
	inoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(1)\<cr>" : "\<Right>"
	inoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(0)\<cr>" : "\<Left>"
	vnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
	vnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
endif
" Show all diagnostics.
"nnoremap <silent><nowait> <space>a  :<C-u>CocList diagnostics<cr>
" Manage extensions.
"nnoremap <silent><nowait> <space>e  :<C-u>CocList extensions<cr>

" ===
" === Plugin Config
" ===

" colorscheme
"colorscheme deus
autocmd vimenter * ++nested colorscheme gruvbox
let g:airline_theme='gruvbox'
set background=dark
"let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
"let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
"let g:deus_termcolors=256
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1

" ale
let b:ale_linters = ['autopep8', 'flake8', 'pylint']
let g:ale_sign_column_always = 1
let g:ale_disable_lsp = 1
let g:ale_sign_error = '✗'
let g:ale_sign_warning = '⚡'
let g:ale_statusline_format = ['✗ %d', '⚡ %d', '✔ OK']
let g:airline#extensions#ale#enabled = 1
nmap <silent> [g <Plug>(ale_previous_wrap)
nmap <silent> ]g <Plug>(ale_next_wrap)

" Ranger.vim
let g:ranger_map_keys = 0
map <leader>f :RangerNewTab<CR>

" REPL
let g:repl_program = {
	\   'python': 'ipython',
	\   'default': 'zsh',
	\   }
let g:repl_cursor_down = 1
let g:repl_python_automerge = 1
let g:repl_ipython_version = '7'
let g:repl_output_copy_to_register = "t"
nnoremap <leader>r :REPLToggle<Cr>
"nnoremap <leader>e :REPLSendSession<Cr>
autocmd Filetype python nnoremap <F12> <Esc>:REPLDebugStopAtCurrentLine<Cr>
autocmd Filetype python nnoremap <F10> <Esc>:REPLPDBN<Cr>
autocmd Filetype python nnoremap <F11> <Esc>:REPLPDBS<Cr>
let g:repl_position = 3

" Instant Markdown
let g:instant_markdown_slow = 0
let g:instant_markdown_autostart = 0
"let g:instant_markdown_open_to_the_world = 1
"let g:instant_markdown_allow_unsafe_content = 1
"let g:instant_markdown_allow_external_content = 0
"let g:instant_markdown_mathjax = 1
let g:instant_markdown_autoscroll = 1

" vim-markdown-toc
let g:vmt_cycle_list_item_markers = 1

" vim-visual-multi
let g:VM_leader                     = {'default': ',', 'visual': ',', 'buffer': ','}
let g:VM_maps                       = {}
let g:VM_custom_motions             = {'j': 'h', 'i': 'k', 'k': 'j', 'J': '0', 'L': '$'}
let g:VM_maps['i']                  = 'h'
let g:VM_maps['I']                  = 'H'
let g:VM_maps['Find Next']          = ''
let g:VM_maps['Find Prev']          = ''
let g:VM_maps['Remove Region']      = 'q'
let g:VM_maps['Skip Region']        = '<c-n>'
let g:VM_maps["Undo"]               = 'u'
let g:VM_maps["Redo"]               = '<C-r>'

" indentline
let g:indentLine_setColors = 0

"vim-go
let g:go_doc_keywordprg_enabled = 0
"au FileType go nmap <Leader>s <Plug>(go-implements)
"au FileType go nmap <Leader>i <Plug>(go-info)
au FileType go nmap <leader>d <Plug>(go-doc)
"au FileType go nmap <Leader>gv <Plug>(go-doc-vertical)
au FileType go nmap <F5> <Plug>(go-run)
au FileType go nmap <leader>b <Plug>(go-build)
au FileType go nmap <leader>t <Plug>(go-test)
"au FileType go nmap <leader>c <Plug>(go-coverage)
"au FileType go nmap <Leader>ds <Plug>(go-def-split)
"au FileType go nmap <Leader>dv <Plug>(go-def-vertical)
"au FileType go nmap <Leader>dt <Plug>(go-def-tab)
"au FileType go nmap <Leader>e <Plug>(go-rename)
let g:go_fmt_command = "goimports"

"coc snippets
" Use <C-l> for trigger snippet expand.
imap <C-l> <Plug>(coc-snippets-expand)
" Use <C-j> for select text for visual placeholder of snippet.
vmap <C-i> <Plug>(coc-snippets-select)
" Use <C-j> for jump to next placeholder, it's default of coc.nvim
let g:coc_snippet_next = '<c-i>'
" Use <C-k> for jump to previous placeholder, it's default of coc.nvim
let g:coc_snippet_prev = '<c-k>'
" Use <C-j> for both expand and jump (make expand higher priority.)
imap <C-j> <Plug>(coc-snippets-expand-jump)
" Use <leader>x for convert visual selected code to snippet
xmap <leader>x  <Plug>(coc-convert-snippet)
let g:coc_snippet_next = '<tab>'

" coc-translator
"nmap ts <Plug>(coc-translator-p)

" Autoformat
noremap \f :Autoformat<CR>
au BufWrite * :Autoformat
autocmd FileType vim,tex let b:autoformat_autoindent=0

" coc explorer
nmap tt :CocCommand explorer --width 30<CR>

" vim pydocstring
autocmd FileType python setlocal tabstop=4 shiftwidth=4 softtabstop=4 expandtab
nmap <silent> <C-d> <Plug>(pydocstring)
let g:pydocstring_formatter = 'numpy'

