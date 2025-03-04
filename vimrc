" enable syntax highlighting
syntax on

" toggle linenumbers on and off by hitting Ctrl-n twice
:nmap <C-N><C-N> :set invnumber <CR>

" turn on line numbers by default
:set invnumber

" always show ^M in DOS files
" set fileformats=unix

" always show line and col number and the current command, set title
set ruler
set showcmd
set title titlestring=vim\ %f

" caseinsensitive incremental search
set ignorecase
set incsearch

" Show matching brackets
set showmatch

" disable any autoindenting which could mess with your mouse pastes (and your head)
" (not useing 'set paste' here to keep fancy stuff like tab completion working)
set nocindent
set nosmartindent
set noautoindent
set indentexpr=
filetype indent off
filetype plugin indent off

" enable php auto folding and remap folding keys to + - (and shift variants)
"let php_folding=1
"map + zo
"map * zR
"map - zc
"map _ zM

" This function determines, wether we are on the start of the line text (then tab indents) or
" if we want to try autocompletion
func! InsertTabWrapper()
    let col = col('.') - 1
    if !col || getline('.')[col - 1] !~ '\k'
        return "\<tab>"
    else
        return "\<c-p>"
    endif
endfunction

" Remap the tab key to select action with InsertTabWrapper
inoremap <tab> <c-r>=InsertTabWrapper()<cr>
filetype on           " Enable filetype detection
filetype plugin on

" function to cleanup a text -> mapped to F5
fun CleanText()
    let curcol = col(".")
    let curline = line(".")
    exe ":retab"
    exe ":%s/^M$//ge"
    exe ":%s/^M/ /ge"
    exe ":%s/ \\+$//e"
    call cursor(curline, curcol)
endfun
map <F5> :call CleanText()<CR>

" don't hang when reading typescript
" thanks to https://vi.stackexchange.com/questions/25086/vim-hangs-when-i-open-a-typescript-file/28721#28721?newreg=b7e9e7a35a2e4ee8806d1900d1c07455
set re=2

