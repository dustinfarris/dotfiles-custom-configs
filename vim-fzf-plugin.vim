"===============================================================================
" Plugin source
"===============================================================================
"'junegunn/fzf'

"===============================================================================
" Plugin Configurations
"===============================================================================

"===============================================================================
" Plugin Keymappings
"===============================================================================
noremap <Leader>f :call fzf#run({'source': 'git ls-files', 'sink': 'e', 'down': '20%'})<CR>
"noremap <Leader>ff :FZF<CR>

"===============================================================================
" Unite Keymap Menu Item(s)
"===============================================================================
