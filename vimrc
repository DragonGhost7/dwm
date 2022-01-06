""       _
""__   _(_)_ __ ___  _ __ ___
""\ \ / / | '_ ` _ \| '__/ __|
"" \ V /| | | | | | | | | (__
""  \_/ |_|_| |_| |_|_|  \___|
""

set nocompatible               " Be iMproved
" PLUGIN {{{

let vimplug_exists=expand('/home/$USER/.vim/autoload/plug.vim')


if !filereadable(vimplug_exists)
	if !executable("curl")
		echoerr "You have to install curl or first install vim-plug yourself!"
		execute "q!"
	endif
	echo "Installing Vim-Plug..."
	echo ""
	silent !\curl -fLo /home/$USER/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
	let g:not_finish_vimplug = "yes"

	autocmd VimEnter * PlugInstall
endif

" Required:
call plug#begin(expand('/home/$USER/.vim/plugged'))

"*****************************************************************************
"" Plug install packages
"*****************************************************************************
Plug 'scrooloose/nerdtree'
Plug 'jistr/vim-nerdtree-tabs'
Plug 'vimwiki/vimwiki'
Plug 'mattn/calendar-vim'
Plug 'mipmip/vim-scimark'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-fugitive'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'airblade/vim-gitgutter'
Plug 'scrooloose/syntastic'
Plug 'Yggdroot/indentLine'
Plug 'sheerun/vim-polyglot'
Plug 'vim-utils/vim-man'
Plug 'junegunn/goyo.vim'
Plug 'dylanaraps/wal.vim'
Plug 'morhetz/gruvbox'
Plug 'terryma/vim-multiple-cursors'
" Plug 'jreybert/vimagit'
" Plug 'davidhalter/jedi-vim'
Plug 'junegunn/fzf', { 'do':{ -> fzf#install() }}
Plug 'junegunn/fzf.vim'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'ycm-core/YouCompleteMe', {'do': './install.py --clangd-completer', 'for': 'typescript'}
Plug 'rdnetto/YCM-Generator', { 'branch': 'stable'}
let g:make = 'gmake'
if exists('make')
	let g:make = 'make'
endif
Plug 'Shougo/vimproc.vim', {'do': g:make}
Plug 'xolox/vim-misc'
Plug 'xolox/vim-session'
if v:version >= 703
	Plug 'Shougo/vimshell.vim'
endif

Plug 'ludwig/split-manpage.vim'
Plug 'raimon49/requirements.txt.vim', {'for': 'requirements'}
call plug#end()

" }}}

filetype plugin indent on
set smartindent


"" Basic Setup {{{
"" Encoding
set encoding=utf-8
set fileencoding=utf-8
set fileencodings=utf-8
set bomb
set binary
set ttyfast
set ma
"" Fix backspace indent
set backspace=indent,eol,start

"" Tabs. May be overriten by autocmd rules
set tabstop=4
set softtabstop=0
set shiftwidth=4
set noexpandtab
"" Map leader to ,
let mapleader=','
" autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o
"" Enable hidden buffers
set hidden

"" Searching
set hlsearch
set incsearch
set ignorecase
set smartcase
set tags=./tags,tags;$HOME
"" Directories for swp files
set nobackup
set noswapfile
set path+=**
set fileformats=unix,dos,mac
set wildmenu
if exists('$SHELL')
	set shell=$SHELL
else
	set shell=/bin/sh
endif
set updatetime=300
set shortmess+=c


" session management
let g:session_directory = "~/.vim/session"
let g:session_autoload = "no"
let g:session_autosave = "no"
let g:session_command_aliases = 1

" }}}

" Visual Settings {{{

" Enable Goyo by default for mutt writting
" Goyo's width will be the line limit in mutt.
autocmd BufRead,BufNewFile /tmp/neomutt* let g:goyo_width=80
autocmd BufRead,BufNewFile /tmp/neomutt* :Goyo

" Spellcheck
map <F6> :setlocal spell! <CR>

autocmd BufWritePre * %s/\s\+$//e
syntax on
set ruler
set number relativenumber

let no_buffers_menu=1
if !exists('g:not_finish_vimplug')
	colorscheme wal
endif

set mousemodel=popup
set t_Co=256
set guioptions=egmrti
set gfn=Monospace\ 10

if has("gui_running")
	if has("gui_mac") || has("gui_macvim")
		set guifont=Menlo:h12
		set transparency=7
	endif
else
	let g:CSApprox_loaded = 1

	" IndentLine
	let g:indentLine_enabled = 1
	let g:indentLine_concealcursor = 0
	let g:indentLine_char = '┆'
	let g:indentLine_faster = 1


	if $COLORTERM == 'gnome-terminal'
		set term=gnome-256color
	else
		if $TERM == 'xterm'
			set term=xterm-256color
		endif
	endif

endif


if &term =~ '256color'
	set t_ut=
endif

"" Status bar
set laststatus=2

"" Use modeline overrides
set modeline
set modelines=10

set title
set titleold="Terminal"
set titlestring=%F

set statusline=%F%m%r%h%w%=(%{&ff}/%Y)\ (line\ %l\/%L,\ col\ %c)\

" Search mappings: These will make it so that going to the next one in a
" search will center on the line it's found in.
nnoremap n nzzzv
nnoremap N Nzzzv

if exists("*fugitive#statusline")
	set statusline+=%{fugitive#statusline()}
endif

" }}}

" Abbreviations {{{
"" no one is really happy until you have this shortcuts
cnoreabbrev W! w!
cnoreabbrev Q! q!
cnoreabbrev Qall! qall!
cnoreabbrev Wq wq
cnoreabbrev Wa wa
cnoreabbrev wQ wq
cnoreabbrev WQ wq
cnoreabbrev W w
cnoreabbrev Q q
cnoreabbrev Qall qall

" }}}

" NERDTree configuration {{{
let g:NERDTreeChDirMode=2
let g:NERDTreeIgnore=['\.rbc$', '\~$', '\.pyc$', '\.db$', '\.sqlite$', '__pycache__']
let g:NERDTreeSortOrder=['^__\.py$', '\/$', '*', '\.swp$', '\.bak$', '\~$']
let g:NERDTreeShowBookmarks=1
let g:nerdtree_tabs_focus_on_files=1
let g:NERDTreeMapOpenInTabSilent = '<RightMouse>'
let g:NERDTreeWinSize = 50
set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*.pyc,*.db,*.sqlite
nnoremap <silent> <F2> :NERDTreeFind<CR>
nnoremap <silent> <F3> :NERDTreeToggle<CR>

" }}}

" vimshell.vim {{{
let g:vimshell_user_prompt = 'fnamemodify(getcwd(), ":~")'
let g:vimshell_prompt =  '$ '


" }}}

" Functions {{{
if !exists('*s:setupWrapping')
	function s:setupWrapping()
		set wrap
		set wm=2
		set textwidth=79
	endfunction
endif

" }}}

" Autocmd Rules {{{
"" The PC is fast enough, do syntax highlight syncing from start unless 200 lines
augroup vimrc-sync-fromstart
	autocmd!
	autocmd BufEnter * :syntax sync maxlines=200
augroup END

"" Remember cursor position
augroup vimrc-remember-cursor-position
	autocmd!
	autocmd BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g`\"" | endif
augroup END

"" txt
augroup vimrc-wrapping
	autocmd!
	autocmd BufRead,BufNewFile *.txt call s:setupWrapping()
augroup END

"" make/cmake
augroup vimrc-make-cmake
	autocmd!
	autocmd FileType make setlocal noexpandtab
	autocmd BufNewFile,BufRead CMakeLists.txt setlocal filetype=cmake
augroup END

set autoread

" }}}

" Mappings {{{
" Navigation {{{
inoremap <Space><Tab> <Esc>/<++><Enter>"_c4l
vnoremap <Space><Tab> <Esc>/<++><Enter>"_c4l
map <Space><Tab> <Esc>/<++><Enter>"_c4l
inoremap ;gui <++>"
"}}}
" Split {{{
noremap <Leader>h :<C-u>split<CR>
noremap <Leader>v :<C-u>vsplit<CR>
"}}}
" Git {{{
noremap <Leader>ga :Gwrite<CR>
noremap <Leader>gc :Gcommit<CR>
noremap <Leader>gsh :Gpush<CR>
noremap <Leader>gll :Gpull<CR>
noremap <Leader>gs :Gstatus<CR>
noremap <Leader>gb :Gblame<CR>
noremap <Leader>gvd :Gvdiff<CR>
noremap <Leader>gm :Gremove<CR>
noremap <C-p>       :GFiles<CR>
" }}}
" session management {{{
nnoremap <leader>so :OpenSession<Space>
nnoremap <leader>ss :SaveSession<Space>
nnoremap <leader>sd :DeleteSession<CR>
nnoremap <leader>sc :CloseSession<CR>
" }}}
"Completition {{{
fun! GoYCM()

	let g:ycm_auto_trigger = 1
	let g:ycm_python_interpreter_path = ''
	let g:ycm_python_sys_path = []
	let g:ycm_extra_conf_vim_data = [
				\  'g:ycm_python_interpreter_path',
				\  'g:ycm_python_sys_path'
				\]
	let g:ycm_global_ycm_extra_conf = '~/.global_ycm_conf.py'
	let g:ycm_auto_hover = 'CursorHold'
	let g:ycm_use_clangd = 1
	let g:ycm_add_preview_to_completeopt = 1
	let g:ycm_autoclose_preview_window_after_completion = 1
	let g:ycm_echo_current_diagnostic = 1
	let g:ycm_enable_diagnostic_signs = 1
	let g:ycm_always_populate_location_list = 1
	let g:ycm_confirm_extra_conf = 0


	nmap <buffer> <leader>D <plug>(YCMHover)
	nmap <buffer> <C-f> :YcmCompleter FixIt
	nmap <buffer> <leader>gd :YcmCompleter GoTo <CR>
	nmap <buffer> <leader>gr :YcmCompleter GoToReferences <CR>
	nmap <buffer> <leader>rr :YcmCompleter RefactorRename <CR>
endfun

function! s:check_back_space() abort
	let col = col('.') - 1
	return !col || getline('.')[col - 1]  =~# '\s'
endfunction

fun! GoCOC()
	noremap <buffer> <silent><expr> <TAB>
				\ pumvisible() ? "\<C-n>" :
				\ <SID>check_back_space() ? "\<TAB>" :
				\ coc#refresh()
	if exists('*complete_info')
		inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"
	else
		inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
	endif

	autocmd User CocJumpPlaceholder call
				\ CocActionAsync('showSignatureHelp')
	inoremap <buffer> <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"
	inoremap <buffer> <silent><expr> <c-space> coc#refresh()
	nmap <buffer> <silent> gd <Plug>(coc-definition)
	nmap <buffer> <silent> gy <Plug>(coc-type-definition)
	nmap <buffer> <silent> gi <Plug>(coc-implementation)
	nmap <buffer> <silent> gr <Plug>(coc-references)
	nmap <buffer> <leader>rn <Plug>(coc-rename)

	nnoremap <buffer> <silent> K :call <SID>show_documentation()<CR>
	nmap <buffer> <silent> [g <Plug>(coc-diagnostic-prev)
	nmap <buffer> <silent> ]g <Plug>(coc-diagnostic-next)
endfun

autocmd Filetype python,cpp,cxx,h,hpp,c :call GoCOC()
" autocmd Filetype python :call GoYCM()
" }}}
" Tabs {{{
nnoremap <Tab> gt
nnoremap <S-Tab> gT
nnoremap <silent> <S-t> :tabnew<CR>
nnoremap <C-Tab> :tabclose<CR>

" }}}
"viman {{{
map <leader>k <Plug>(Man)
map <C-m> <Plug>(Vman)

"}}}
" Vimwiki {{{
						" \'custom_wiki2html':'/home/darkghost/.vim/plugged/vimwiki/autoload/vimwiki/customwiki2html.sh',
let g:vimwiki_list = [{'path': '~/vimwiki/',
			\'syntax': 'markdown',
			\'ext': '.md',
			\'custom_wiki2html': '/home/darkghost/.gem/ruby/2.7.0/bin/vimwiki_markdown',
			\ 'html_filename_parameterization': 1,
			\ 'template_path': '~/vimwiki/templates',
			\'path_html': '~/vimwiki/site_html/'}]
function! ToggleCalendar()
	execute ":Calendar"
	if exists("g:calendar_open")
		if g:calendar_open == 1
			execute "q"
			unlet g:calendar_open
		else
			g:calendar_open = 1
		end
	else
		let g:calendar_open = 1
	end
endfunction
:autocmd FileType vimwiki nmap <leader>ca :call ToggleCalendar()<CR>



"}}}
" Set working directory
nnoremap <leader>. :lcd %:p:h<CR>
" Opens an edit command with the path of the currently edited file filled in
noremap <Leader>e :e <C-R>=expand("%:p:h") . "/" <CR>

" Opens a tab edit command with the path of the currently edited file filled
noremap <Leader>te :tabe <C-R>=expand("%:p:h") . "/" <CR>
nmap <leader><leader>f gg=G

" The Silver Searcher
if executable('ag')
	let $FZF_DEFAULT_COMMAND = 'ag --hidden --ignore .git -g ""'
	set grepprg=ag\ --nogroup\ --nocolor
endif

" ripgrep
if executable('rg')
	let $FZF_DEFAULT_COMMAND = 'rg --files --hidden --follow --glob "!.git/*"'
	set grepprg=rg\ --vimgrep
	command! -bang -nargs=* Find call fzf#vim#grep('rg --column --line-number --no-heading --fixed-strings --ignore-case --hidden --follow --glob "!.git/*" --color "always" '.shellescape(<q-args>).'| tr -d "\017"', 1, <bang>0)
endif

cnoremap <C-P> <C-R>=expand("%:p:h") . "/" <CR>
nnoremap <silent> <leader>b :buffers<CR>
nnoremap <C-c> <Esc>
" }}}

" syntastic {{{
"let g:syntastic_always_populate_loc_list=1
"let g:syntastic_error_symbol='✗'
"let g:syntastic_warning_symbol='⚠'
"let g:syntastic_style_error_symbol = '✗'
"let g:syntastic_style_warning_symbol = '⚠'
"let g:syntastic_auto_loc_list=1
"let g:syntastic_aggregate_errors = 1
"""let g:syntastic_mode_map = { 'passive_filetypes': ['tex','python'] }
"let g:syntastic_tex_checkers = ['lacheck', 'text/language_check']

"set statusline+=%#warningmsg#
"set statusline+=%{SyntasticStatuslineFlag()}
"set statusline+=%*

"let g:syntastic_always_populate_loc_list = 1
"let g:syntastic_auto_loc_list = 1
"let g:syntastic_check_on_open = 1
"let g:syntastic_check_on_wq = 1

" }}}

" Navigation {{{
" Buffer nav {{{
noremap <leader>z :bp<CR>
noremap <leader>q :bp<CR>
noremap <leader>x :bn<CR>
noremap <leader>w :bn<CR>

" }}}

" Close buffer {{{
noremap <leader>c :bd<CR>

" }}}

" Clean search (highlight) {{{
nnoremap <silent> <leader><space> :noh<cr>

" }}}

" Switching windows {{{
noremap <C-j> <C-w>j
noremap <C-k> <C-w>k
noremap <C-l> <C-w>l
noremap <C-h> <C-w>h

" }}}

" Vmap for maintain Visual Mode after shifting > and < {{{
vmap < <gv
vmap > >gv

" }}}

" Move visual block {{{
vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '<-2<CR>gv=gv

" }}}

" }}}

" Folding {{{
set foldclose=all " Close folds if you leave them in any way
set foldenable " Turn on folding
set foldlevel=0 " Autofold everything by default
set foldmethod=marker " Fold on the marker
"set foldopen=all " Open folds if you touch them in any way

" }}}

" Custom configs {{{
" c
" autocmd FileType c setlocal tabstop=4 shiftwidth=4 noexpandtab
" autocmd FileType cpp setlocal tabstop=4 shiftwidth=4 noexpandtab

"Scimark

let g:scimCommand = '/usr/bin/sc-im'



" YCM"


" jedi-vim"
" let g:jedi#auto_initialization = 1
" let g:jedi#completions_command = "<C-C>"
" let g:jedi#goto_assignments_command = "<leader>g"
" let g:jedi#goto_definitions_command = "<C-d>"
" let g:jedi#documentation_command = "K"
" let g:jedi#usages_command = "<leader>n"
" let g:jedi#rename_command = "<leader>r"
" let g:jedi#show_call_signatures = "0"
" let g:jedi#smart_auto_mappings = 1
" let g:jedi#popup_on_dot = 0
" syntastic
let g:syntastic_python_checkers=['python']
"flake8

" vim-airline
let g:airline#extensions#virtualenv#enabled = 1

" Syntax highlight
" Default highlight is better than polyglot
let g:polyglot_disabled = ['python']
let python_highlight_all = 1

" multi-cursor
let g:multi_cursor_use_default_mapping=0

" Default mapping
let g:multi_cursor_start_word_key      = '<C-n>'
let g:multi_cursor_select_all_word_key = '<A-n>'
let g:multi_cursor_start_key           = 'g<C-n>'
let g:multi_cursor_select_all_key      = 'g<A-n>'
let g:multi_cursor_next_key            = '<C-n>'
let g:multi_cursor_prev_key            = '<C-b>'
let g:multi_cursor_skip_key            = '<C-x>'
let g:multi_cursor_quit_key            = '<Esc>'

:command Vimty :source ~/.vim/vimty.vim


" Disable visualbell
set noerrorbells visualbell t_vb=
if has('autocmd')
	autocmd GUIEnter * set visualbell t_vb=
endif

"" Copy/Paste/Cut
if has('unnamedplus')
	set clipboard=unnamed,unnamedplus
endif

noremap YY "+y<CR>
noremap <leader>p "+gP<CR>
noremap XX "+x<CR>


" }}}

" .bib {{{
autocmd FileType bib inoremap ,a @article{<Enter>author<Space>=<Space>{<++>},<Enter>year<Space>=<Space>{<++>},<Enter>title<Space>=<Space>{<++>},<Enter>journal<Space>=<Space>{<++>},<Enter>volume<Space>=<Space>{<++>},<Enter>pages<Space>=<Space>{<++>},<Enter>}<Enter><++><Esc>8kA,<Esc>i
autocmd FileType bib inoremap ,b @book{<Enter>author<Space>=<Space>{<++>},<Enter>year<Space>=<Space>{<++>},<Enter>title<Space>=<Space>{<++>},<Enter>publisher<Space>=<Space>{<++>},<Enter>}<Enter><++><Esc>6kA,<Esc>i
autocmd FileType bib inoremap ,c @incollection{<Enter>author<Space>=<Space>{<++>},<Enter>title<Space>=<Space>{<++>},<Enter>booktitle<Space>=<Space>{<++>},<Enter>editor<Space>=<Space>{<++>},<Enter>year<Space>=<Space>{<++>},<Enter>publisher<Space>=<Space>{<++>},<Enter>}<Enter><++><Esc>8kA,<Esc>i

" }}}

" MARKDOWN {{{
autocmd Filetype markdown,rmd map <leader>w yiWi[<esc>Ea](<esc>pa)
autocmd Filetype markdown,rmd inoremap ,n ---<Enter><Enter>
autocmd Filetype markdown,rmd inoremap ,b ****<++><Esc>F*hi
autocmd Filetype markdown,rmd inoremap ,s ~~~~<++><Esc>F~hi
autocmd Filetype markdown,rmd inoremap ,e **<++><Esc>F*i
autocmd Filetype markdown,rmd inoremap ,h ====<Space><++><Esc>F=hi
autocmd Filetype markdown,rmd inoremap ,i ![](<++>)<++><Esc>F[a
autocmd Filetype markdown,rmd inoremap ,a [](<++>)<++><Esc>F[a
autocmd Filetype markdown,rmd inoremap ,1 #<Space><Enter><++><Esc>kA
autocmd Filetype markdown,rmd inoremap ,2 ##<Space><Enter><++><Esc>kA
autocmd Filetype markdown,rmd inoremap ,3 ###<Space><Enter><++><Esc>kA
autocmd Filetype markdown,rmd inoremap ,l --------<Enter>
autocmd Filetype rmd inoremap ,r ``{r}<CR>``<CR><CR><esc>2kO
autocmd Filetype rmd inoremap ,p ``{python}<CR>``<CR><CR><esc>2kO
autocmd Filetype rmd inoremap ,c ``<cr>``<cr><cr><esc>2kO`]]"

map <F5> :w! \| !compiler <c-r>%<CR>
map .p :!opout <c-r>%<CR><CR>
" }}}

" Powerline variables  {{{

" vim-airline
" let g:airline_theme = 'promptline'
let g:airline#extensions#syntastic#enabled = 1
let g:airline#extensions#branch#enabled = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline_skip_empty_sections = 1
let g:airline_theme='wal'
let g:airline_powerline_fonts = 1
if !exists('g:airline_symbols')
	let g:airline_symbols = {}
endif

" unicode symbols
let g:airline_left_sep = '»'
let g:airline_left_sep = '▶'
let g:airline_right_sep = '«'
let g:airline_right_sep = '◀'
let g:airline_symbols.crypt = '🔒'
let g:airline_symbols.linenr = '☰'
let g:airline_symbols.linenr = '␊'
let g:airline_symbols.linenr = '␤'
let g:airline_symbols.linenr = '¶'
let g:airline_symbols.maxlinenr = ''
let g:airline_symbols.maxlinenr = '㏑'
let g:airline_symbols.branch = '⎇'
let g:airline_symbols.paste = 'ρ'
let g:airline_symbols.paste = 'Þ'
let g:airline_symbols.paste = '∥'
let g:airline_symbols.spell = 'Ꞩ'
let g:airline_symbols.notexists = 'Ɇ'
let g:airline_symbols.whitespace = 'Ξ'

" powerline symbols
let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''
" let g:airline_symbols.branch = ''
let g:airline_symbols.branch = ''
let g:airline_symbols.readonly = ''
let g:airline_symbols.linenr = '☰'
let g:airline_symbols.maxlinenr = ''


" }}}
