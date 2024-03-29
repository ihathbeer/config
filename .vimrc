colorscheme ir_black
syntax enable

" Background
set background=dark
" HardTime (delayed h/j/k/l) 
" let g:hardtime_default_on = 1

set formatoptions-=cro "disables continuation of comments on new lines

set colorcolumn=100 " vertical column at char 100 on each line
highlight ColorColumn ctermbg=Black
set autoindent     " copy current indentation when inserting new line
set path+=**       " search down into subfolders & tab completion for all related tasks
set wildmenu       " display all matching files when we tab complete
set relativenumber " show relative numbers
set laststatus=2   " lightline fix
set autoindent     " enable autoindentation
set tabstop=4 	   " # of visual spaces per tab
set softtabstop=4  " # of spaces per tab when editing
set shiftwidth=4   " # of spaces to use for autoindent
set expandtab	   " tabs are spaces

set number 	       " show line numbers
set showcmd	       " show command in bottom bar
set cursorline	   " highlight current line

set lazyredraw     " redraw only when we need to -> faster macros
set showmatch      " highlight matching parens
set incsearch      " search as characters are entered
set hlsearch       " highlight matches
set wildmenu       " visual autocomplete for cmd menu
filetype plugin indent on       " activate extension-specific vim settings
" Create the `tags` file (requires ctags) ; ^ = control
"   - Use ^] to jump to tag under cursor
"   - Use g^] for ambiguous tags
"   - Use ^t to jump back up the tag stack
" For a visual list of tags, use taglist
command! MakeTags !ctags -R .

" turn off search highlight
nnoremap <leader><space> :nohlsearch<CR> 

set foldenable          " enable folding
set foldlevelstart=10   " open most folds til level 10
set foldnestmax=10      " maximum number of nested folds

" space open/closes folds
noremap <space> za      

" fold based on indent level
set foldmethod=indent

" move vertically by visual line
nnoremap j gj
nnoremap k gk

" move to beginning/EOL
nnoremap B ^
nnoremap E $

" disable ^ & $
nnoremap ^ <nop>
nnoremap $ <nop>

" disable arrow keys
noremap <Left> <nop>
noremap <Right> <nop>
noremap <Up> <nop>
noremap <Down> <nop>

inoremap <Left> <nop>
inoremap <Right> <nop>
inoremap <Up> <nop>
inoremap <Down> <nop>

" bind jk to esc 
inoremap jk <esc>

" create new key
let mapleader=","

" toggle undotree
nnoremap <leader>u :UndotreeToggle<CR>

" nohl remap
nnoremap <leader>/ :nohlsearch<CR>

" change to current directory
nnoremap <leader>cd :cd %:p:h<CR>

" FZF mappings
nnoremap <C-p> :Files<Cr>

" FZF.vim now supports this command out of the box
" so this code is potentially no longer needed.
command! -bang -nargs=* Rg
  \ call fzf#vim#grep(
  \   'rg --column --line-number --hidden --ignore-case --no-heading --color=always '.shellescape(<q-args>), 1,
  \   <bang>0 ? fzf#vim#with_preview({'options': '--delimiter : --nth 4..'}, 'up:60%')
  \           : fzf#vim#with_preview({'options': '--delimiter : --nth 4..'}, 'right:50%:hidden', '?'),
  \   <bang>0)

" Rg mappings
nnoremap <leader>a :Rg<Cr>
"
" Rg mappings
nnoremap <C-f> :Ranger<Cr>

" 
" Reload vimrc
nnoremap <leader>sv :source $MYVIMRC<CR>

" Edit virmc
nnoremap <leader>ev :vsp $MYVIMRC<CR>

" activate pathogen
call pathogen#infect()
call pathogen#helptags()

" autocommands
" set comment string for Python
autocmd FileType python setlocal commentstring=#\ %s

" syntactic
"set statusline+=%#warningmsg#
"set statusline+=%{SyntasticStatuslineFlag()}
"set statusline+=%*

"let g:syntastic_always_populate_loc_list = 1
"let g:syntastic_auto_loc_list = 1
"let g:syntastic_check_on_open = 1
"let g:syntastic_check_on_wq = 0
