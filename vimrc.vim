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


" Dark
" hi NonText ctermbg=black guibg=#303234
" hi LineNr guifg=#626267
" hi CursorLineNr ctermfg=yellow ctermbg=233 guifg=#aaaaac guibg=#303137
" hi ColorColumn ctermbg=234 guibg=#27292b
" hi CursorLine ctermbg=234 guibg=#343638




" Light
"
set background=light
colorscheme base16-tomorrow
hi NonText ctermbg=black guibg=#ffffff
hi LineNr guifg=#cccccc guibg=#ffffff
hi CursorLineNr guifg=#aaaaac guibg=#ffffff
hi ColorColumn guibg=#fafafa
hi CursorLine guibg=#f2f2f2





" hi CursorLine ctermbg=234 guibg=#202224
autocmd BufEnter,BufRead *.py,*.elm set colorcolumn=73,80,100
autocmd BufEnter,BufRead *.ex,*.exs,*.yml,*.html,*.feature,*.js,*.coffee,*.less,*.css,*.sass,*.scss set shiftwidth=2 softtabstop=2 colorcolumn=80,100
autocmd BufRead,BufNewFile *.json set filetype=json
autocmd BufRead,BufNewFile,BufEnter *.hbs set ft=mustache
autocmd BufEnter,BufRead *.md,*.markdown set wrap




" Powerline  (not supported in neovim yet)
" https://github.com/powerline/powerline/issues/1287
"
" python from powerline.vim import setup as powerline_setup
" python powerline_setup()
" python del powerline_setup



" source ~/Archive/vim-htmlbars-inline-syntax/plugin/htmlbars_inline_syntax.vim
" autocmd BufRead,BufNewFile *.js HighlightInlineHbs

augroup my_neomake_signs
    au!
    autocmd ColorScheme *
                \ hi clear NeomakeErrorSignDefault
augroup END

map <F10> :echo "hi<" . synIDattr(synID(line("."),col("."),1),"name") . '> trans<'
            \ . synIDattr(synID(line("."),col("."),0),"name") . "> lo<"
            \ . synIDattr(synIDtrans(synID(line("."),col("."),1)),"name") . ">"<CR>

let g:startify_custom_header = ['']

" Position cursor between to braces/parens on return
let g:delimitMate_expand_cr = 1

" Override and use file_rec/git instead of file_rec/async (it is much faster)
nnoremap <Leader>ff :Unite file file_rec/git -start-insert -buffer-name=files -winheight=18<CR>

" Not-so-hardtime
let g:hardtime_maxcount = 100

" Use eslint for JS linting instead of jshint
let g:syntastic_javascript_checkers = ['eslint']

" Define alternative filetype names for markdown syntax highlighting
let g:vim_markdown_fenced_languages = ['js=javascript']

" Use neomake instead of syntastic

" Missing html tags (html5 + flexi)
autocmd BufEnter *.js,*.hbs syn keyword htmlTagName contained section article screen page box vbox hbox centered fill grid container

" Tagbar
noremap <Leader>tt :TagbarOpenAutoClose<CR>


" ctags
set tags=./.tags,.tags


" Elm ctags
function! ElmAutoTag()
    exe 'silent !rm -rf ctags'
    exe 'silent !ctags -Rf .tags --languages=-all,+Elm'
    exe 'redraw!'
endfunction

augroup autotag
    au!
    autocmd BufWritePost,FileWritePost *.elm call ElmAutoTag ()
augroup END

if has("nvim")
    let g:python3_host_prog = '/usr/local/bin/python3'
endif
