" vim: filetype=vim foldmethod=marker foldmarker=region,endregion
" Location: ${XDG_CONFIG_HOME:-$HOME/.config}/nvim/init.vim

"region Sets
set tabstop=4
set shiftwidth=4
set noexpandtab
set smarttab
set backspace=indent,eol,start
set number
set foldmethod=syntax " Prefer to use syntax,
set foldmarker=region,endregion " but if we use markers, prefer these
set modeline
set clipboard=unnamedplus
set autoindent
set laststatus=2
set statusline=\ %m%f\ [%W%Y]%=%<%50(%L/%l:%c\ %)
"endregion

syntax enable

"region Mappings
nmap <F4> :tabn<Enter>
nmap <F16> :tabp<Enter>
nmap <C-T> :tabnew<Enter>
nmap <C-T><C-W> :tabclose<Enter>
nmap <C-T><Left> :tabp<Enter>
nmap <C-T><Right> :tabn<Enter>
nmap ƒ :Lexplore<Enter>
vnoremap <S-Tab> <<
vnoremap <Tab> >>
" File-specific mappings
augroup mappings
  autocmd! mappings
  autocmd FileType python map <F5> :!clear; python3 % <Enter>
  autocmd FileType sh     map <F5> :!clear; ./% <Enter>
  autocmd FileType rust   map <F5> :!clear; cargo run <Enter>
  autocmd FileType cpp    map <F5> :!clear; make run <Enter>
augroup END
" Plugin specific mappings
nnoremap <C-U> :UndotreeToggle \| UndotreeFocus<CR>
inoremap <expr> <C-Space> pumvisible()? coc#refresh() : "\<C-n>"
augroup END
" Plugin specific mappings

"endregion

"region Functions
function! Cyclefiles()
  try
    execute 'next'
  catch /^Vim(next):E163*/
    execute 'first'
  endtry
endfunction
"endregion

"region Plugins
call plug#begin(stdpath('data').'/plugged')
Plug 'ghifarit53/tokyonight-vim'
Plug 'jiangmiao/auto-pairs'
Plug 'https://github.com/mbbill/undotree.git'
Plug 'Shougo/defx.nvim'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
call plug#end()
"endregion

"region Configure theme
if $TERM_PROGRAM==#"Apple_Terminal"
	set notermguicolors
else
	set termguicolors
endif
let g:tokyonight_style = 'night'
let g:tokyonight_enable_italic = 1
colorscheme tokyonight
"endregion

"region Configure jiangmiao/auto-pairs
let g:autopairs = {'(':')', '[':']', '{':'}', "'":"'", '"':'"', "`":"`"}
let g:autopairscenterline = 0
let g:autopairsmultilineclose = 0
"endregion

"region Configure NetWR
let g:netrw_winsize = -10
let g:netrw_banner  =  0
let g:netrw_preview =  1
"endregion
"
