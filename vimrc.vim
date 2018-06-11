set mouse=a
set cursorline
set nu
set nuw=6


" colorscheme base16-tomorrow-night
" colorscheme codeschool


"hi Normal guibg=#1d1f21
"hi LineNr guifg=#626267 guibg=#1d1f21
"hi NonText ctermbg=black guibg=#1d1f21

hi clear SignColumn





" Dark (Gray)
" hi Normal guibg=#202020
hi Normal guibg=#242d39

hi NonText ctermbg=black guibg=#242d39
hi LineNr guifg=#626267 guibg=#242d39
hi CursorLineNr ctermfg=yellow ctermbg=233 guifg=#aaaaac guibg=#242d39
" hi ColorColumn ctermbg=234 guibg=#27292b
" hi CursorLine ctermbg=234 guibg=#282828
" hi ColorColumn ctermbg=234 guibg=#3a3a3a
" hi CursorLine ctermbg=234 guibg=#3a3a3a


" Dark (Blue)
" hi NonText ctermbg=black guibg=#242c30
" hi LineNr guifg=#626267 guibg=#242c30
" hi CursorLineNr ctermfg=yellow ctermbg=233 guifg=#aaaaac guibg=#202020
" hi ColorColumn ctermbg=234 guibg=#27292b
" hi CursorLine ctermbg=234 guibg=#333d3c







" Light
"
" set background=light
" colorscheme base16-tomorrow
" hi NonText ctermbg=black guibg=#ffffff
" hi LineNr guifg=#cccccc guibg=#ffffff
" hi CursorLineNr guifg=#aaaaac guibg=#ffffff
" hi ColorColumn guibg=#fafafa
" hi CursorLine guibg=#f2f2f2





" hi CursorLine ctermbg=234 guibg=#202224
autocmd BufEnter,BufRead *.py,*.elm set colorcolumn=73,80,100
autocmd BufEnter,BufRead *.ex,*.exs,*.yml,*.html,*.feature,*.js,*.coffee,*.less,*.css,*.sass,*.scss set shiftwidth=2 softtabstop=2 colorcolumn=80,100
autocmd BufRead,BufNewFile *.json set filetype=json
autocmd BufRead,BufNewFile,BufEnter *.hbs set ft=mustache
autocmd BufEnter,BufRead *.md,*.markdown set wrap
" autocmd BufRead *.ex,*.exs set foldlevelstart=2

set foldmethod=syntax
noremap <tab> za

" Getting folds to behave when navigating is hard :(
" autocmd BufLeave *.* mkview!
" autocmd BufEnter *.* silent loadview
" autocmd InsertLeave,WinEnter * let &l:foldmethod=g:oldfoldmethod
" autocmd InsertEnter,WinLeave * let g:oldfoldmethod=&l:foldmethod | setlocal foldmethod=manual

augroup ELM
    autocmd!
    autocmd FileType elm setlocal foldmethod=syntax " foldlevel=-1 foldlevelstart=1
    " autocmd InsertEnter,WinLeave *.elm setlocal foldmethod=manual
    " autocmd InsertLeave,WinEnter *.elm setlocal foldmethod=indent foldlevel=-1 foldlevelstart=1 foldminlines=0
augroup END

augroup ELIXIR
    autocmd!
    autocmd FileType elixir setlocal foldmethod=syntax
    autocmd BufRead,BufNewFile *.ex,*.exs setlocal foldlevel=1 foldminlines=0
    "autocmd InsertEnter,WinLeave *.ex,*.exs setlocal foldmethod=manual
    "autocmd InsertLeave,WinEnter *.ex,*.exs setlocal foldmethod=syntax foldlevel=1 foldminlines=0
augroup END

augroup PYTHON
    autocmd!
    autocmd FileType python setlocal foldmethod=indent " foldlevel=-1 foldlevelstart=1
    autocmd BufRead,BufNewFile *.py setlocal foldlevel=0 foldminlines=0
    " autocmd InsertEnter,WinLeave *.elm setlocal foldmethod=manual
    " autocmd InsertLeave,WinEnter *.elm setlocal foldmethod=indent foldlevel=-1 foldlevelstart=1 foldminlines=0
augroup END


" Powerline  (not supported in neovim yet)
" https://github.com/powerline/powerline/issues/1287
"
" python from powerline.vim import setup as powerline_setup
" python powerline_setup()
" python del powerline_setup


let g:startify_custom_header = ['']

" Position cursor between to braces/parens on return
let g:delimitMate_expand_cr = 1

" Override and use file_rec/git instead of file_rec/async (it is much faster)
" nnoremap <Leader>ff :Unite file file_rec/git -start-insert -buffer-name=files -winheight=18<CR>

" Not-so-hardtime
let g:hardtime_maxcount = 100


" Tagbar
noremap <Leader>tt :TagbarOpenAutoClose<CR>


" ctags
set tags=./.tags,.tags


" Elm ctags
function! ElmAutoTag()
    exe 'silent !rm -rf ctags'
    exe 'silent !ctags -Rf .tags --exclude=elm-stuff --exclude=tmp --languages=-all,+Elm'
    exe 'redraw!'
endfunction

augroup autotag
    au!
    autocmd BufWritePost,FileWritePost *.elm call ElmAutoTag ()
augroup END

if has("nvim")
    let g:python3_host_prog = '/usr/local/bin/python3'
endif


" Overriding dotfiles/vim/vanilla-configs/status-line.vim for light theme
"
"
" Light theme
" let s:currentmode={'n':  {'text': 'NORMAL',  'termColor': 60, 'guiColor': '#d0d0d0'},
" 			\ 'v':  {'text': 'VISUAL',  'termColor': 58, 'guiColor': '#D65D0E'},
" 			\ 'V':  {'text': 'V-LINE',  'termColor': 58, 'guiColor': '#D65D0E'},
" 			\ '': {'text': 'V-BLOCK', 'termColor': 58, 'guiColor': '#D65D0E'},
" 			\ 'i':  {'text': 'INSERT',  'termColor': 29, 'guiColor': '#8EC07C'},
" 			\ 'R':  {'text': 'REPLACE', 'termColor': 88, 'guiColor': '#CC241D'}}
"
" Dark theme
let s:currentmode={'n':  {'text': 'NORMAL',  'termColor': 60, 'guiColor': '#909090'},
			\ 'v':  {'text': 'VISUAL',  'termColor': 58, 'guiColor': '#D65D0E'},
			\ 'V':  {'text': 'V-LINE',  'termColor': 58, 'guiColor': '#D65D0E'},
			\ '': {'text': 'V-BLOCK', 'termColor': 58, 'guiColor': '#D65D0E'},
			\ 'i':  {'text': 'INSERT',  'termColor': 29, 'guiColor': '#6E905C'},
			\ 'R':  {'text': 'REPLACE', 'termColor': 88, 'guiColor': '#CC241D'}}

function! TextForCurrentMode()
	set lazyredraw
	if has_key(s:currentmode, mode())
		let modeMap = s:currentmode[mode()]
		execute 'hi! User1 ctermfg=255 ctermbg=' . modeMap['termColor'] . 'guifg=#EEEEEE guibg=' . modeMap['guiColor'] . ' cterm=none'
		return modeMap['text']
	else
		return 'UNKNOWN'
	endif
	set nolazyredraw
endfunction

function! BuildStatusLine(showMode)
    " Dark theme
    hi User1 ctermfg=236 ctermbg=101 guibg=#505050 guifg=#d0d0d0 cterm=reverse
    hi User7 ctermfg=88  ctermbg=236 guibg=#870000 guifg=#e0e0e0 cterm=none
    hi User8 ctermfg=236 ctermbg=101 guibg=#505050 guifg=#d0d0d0 cterm=reverse

    " Light theme
    " hi User1 ctermfg=236 ctermbg=101 guifg=#303030 guibg=#d0d0d0 cterm=reverse
    " hi User7 ctermfg=88  ctermbg=236 guifg=#870000 guibg=#e0e0e0 cterm=none
    " hi User8 ctermfg=236 ctermbg=101 guifg=#303030 guibg=#d0d0d0 cterm=reverse
    setl statusline=
    if a:showMode
        setl statusline+=%1*\ %{TextForCurrentMode()}\ "
    endif
    setl statusline+=%<                              " Truncate contents after when line too long
    setl statusline+=%{&paste?'>\ PASTE':''}         " Alert when in paste mode
    setl statusline+=%8*\ %F                         " File path
    setl statusline+=%7*%m                           " File modified status
    setl statusline+=%8*                             " Set User8 coloring for rest of status line
    setl statusline+=%r%h%w                          " Flags
    setl statusline+=%=                              " Right align the rest of the status line
    setl statusline+=\ [TYPE=%Y]                     " File type
    setl statusline+=\ [POS=L%04l,R%04v]             " Cursor position in the file line, row
    setl statusline+=\ [LEN=%L]                      " Number of line in the file
    setl statusline+=%#warningmsg#                   " Highlights the syntastic errors in red
endfunction

