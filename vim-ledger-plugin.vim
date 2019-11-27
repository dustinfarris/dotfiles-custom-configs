"===============================================================================
" Plugin source
"===============================================================================
"'ledger/vim-ledger'


"===============================================================================
" Plugin Configurations
"===============================================================================
let g:ledger_default_commodity = "$"
let g:ledger_align_at = 80
"let g:ledger_extra_options = '--pedantic --explicit --check-payees'
autocmd BufEnter,BufRead *.journal set filetype=ledger
autocmd BufEnter,BufRead *.php.journal let g:ledger_default_commodity = "₱"

"===============================================================================
" Plugin Keymappings
"===============================================================================
au FileType ledger inoremap <silent> <Tab> <C-r>=ledger#autocomplete_and_align()<CR>
au FileType ledger vnoremap <silent> <Tab> :LedgerAlign<CR>
au FileType ledger nnoremap <F5> "=strftime("%Y/%m/%d")<CR>P
au FileType ledger inoremap <F5> <C-R>=strftime("%Y/%m/%d")<CR>
au FileType ledger noremap <Leader>a O<Esc>"=strftime("%Y/%m/%d")<CR>PA<Space>

"===============================================================================
" Unite Keymap Menu Item(s)
"===============================================================================
au BufNewFile,BufRead *.ldg,*.ledger,*.journal setf ledger | comp ledger
let g:ledger_maxwidth = 120
let g:ledger_fold_blanks = 1
function LedgerSort()
    :%! ledger -f - print --sort 'date, amount'
    :%LedgerAlign
endfunction
command LedgerSort call LedgerSort()
" autocmd BufWrite *.journal LedgerSort
