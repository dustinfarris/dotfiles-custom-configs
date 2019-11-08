"===============================================================================
" Plugin source
"===============================================================================
"'Shougo/denite.nvim'

"===============================================================================
" Plugin Configurations
"===============================================================================
let g:ale_set_highlights = 0
call denite#custom#map(
          \ 'insert',
          \ '<C-j>',
          \ '<denite:move_to_next_line>',
          \ 'noremap'
          \)
call denite#custom#map(
          \ 'insert',
          \ '<C-k>',
          \ '<denite:move_to_previous_line>',
          \ 'noremap'
          \)
" call denite#custom#alias('source', 'file_rec/git', 'file_rec')
" call denite#custom#var('file_rec/git', 'command',
"             \ ['git', 'ls-files', '-co', '--exclude-standard'])
" Change file_rec command.
call denite#custom#var('file_rec', 'command',
            \ ['ag', '--follow', '--nocolor', '--nogroup', '-g', ''])

"===============================================================================
" Plugin Keymappings
"===============================================================================
nnoremap <Leader>b :Denite buffer<CR>
" nnoremap <Leader>ff :Denite file/rec -auto-resize -winheight=12 -auto-highlight -reversed<CR>
nnoremap <Leader>vu :PlugUpdate<CR>

"===============================================================================
" Denite Keymap Menu Item(s)
"===============================================================================
