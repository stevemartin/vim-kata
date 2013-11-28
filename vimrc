set nocompatible

" essential settings
set visualbell t_vb=
set number
set hlsearch
set incsearch
set hidden
set ts=2 sts=2 sw=2 expandtab
set laststatus=2
set backspace=2
set nobackup
set noswapfile


function! KataFolds()
  if match(getline(v:lnum), "^solution$") >= 0
    return ">1"
  else
    return "="
  endif
endfunction

function! KataFoldText()
  let title = "SOLUTION"
  return "" . title
endfunction

function! KataQuickfix()
  let addressFile = expand('%:p:h').'/addresses.toc'
  if filereadable(addressFile)
    execute ":cgetfile ".addressFile
  endif
endfunction

if has("autocmd")
  autocmd BufNewFile,BufRead build/*/*/*.{tut,exe} setfiletype kata
  autocmd FileType kata let @/=''
  autocmd FileType kata setlocal autoindent
  autocmd FileType kata setlocal foldmethod=expr
  autocmd FileType kata setlocal foldexpr=KataFolds()
endif

" [a and ]a to move between arguments
nmap ]a :next!<CR>
nmap [a :Next!<CR>
nmap ]A :last!<CR>
nmap [A :first!<CR>
" quickfix list helpers
nmap <left> :cprev!<CR>
nmap <right> :cnext!<CR>
nmap <up> :cpfile!<CR>
nmap <down> :cnfile!<CR>
nmap [q :cprev!<CR>
nmap ]q :cnext!<CR>
nmap [Q :cfirst!<CR>
nmap ]Q :clast!<CR>
nmap Q <Nop>

" Table of Contents
let &errorformat="%f|%l col %c|%m"
call KataQuickfix()
