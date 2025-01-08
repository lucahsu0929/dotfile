lua require('basic')
lua require('keybindings')
lua require('plugins')
lua require('plugin-config/nvim-tree')
lua require('plugin-config/bufferline')
lua require('plugin-config/nvim-treesitter')
lua require('plugin-config/telescope')
lua require('plugin-config/autoclose') 
lua require('plugin-config/acceleratedjk')
lua require('plugin-config/alpha')
lua require('plugin-config/lualine')
lua require('plugin-config/whichkey')


set smartindent
set tabstop=4
set shiftwidth=4
set expandtab
set cmdheight=3

if has('termguicolors')
    set termguicolors
    endif
    " For dark version.
    set background=dark
    " Set contrast.
    " This configuration option should be placed before `colorscheme everforest`.
    " Available values: 'hard', 'medium'(default), 'soft'
    let g:everforest_background = 'soft'
    " For better performance
    let g:everforest_better_performance = 1 
    colorscheme everforest
    let g:airline_theme = 'everforest'


map <leader>r :call CompileRun()<CR>
func! CompileRun()

	  exec "w"

    let file_name = expand('%:t:r')

    if &filetype == 'cpp'
		    exec "!g++ % -std=c++20 -DLOCAL -Wall -Wextra -O2 -Winvalid-pch -o %<"
        if v:shell_error == 0
            exec ":AsyncRun -mode=term -pos=iterm ./%<"
        endif

    elseif &filetype == 'c'
		    exec "!gcc % -o %<"
        if v:shell_error == 0
            exec ":AsyncRun -mode=term -pos=iterm ./%<"
        endif

    elseif &filetype == 'java'
	     exec "!javac %"
        if v:shell_error == 0
            exec ":AsyncRun -mode=term -pos=iterm java %<"
        endif

    elseif &filetype == 'python'
        exec ":AsyncRun -mode=term -pos=iterm python3 %"

    endif
endfunc

nmap <silent> <leader>. :FloatermNew<cr>
tmap <silent> <leader>. <c-\><c-n>:FloatermKill<cr>

highlight Normal ctermbg=none guibg=none
highlight NonText ctermbg=none guibg=none
highlight SignColumn ctermbg=none guibg=none


nnoremap hash<tab> :-1read $HOME/.config/nvim/snippet/hash.snippet<cr>G
nnoremap fheap<tab> :-1read $HOME/.config/nvim/snippet/fheap.snippet<cr>G
nnoremap bheap<tab> :-1read $HOME/.config/nvim/snippet/bheap.snippet<cr>G
nnoremap bf<tab> :-1read $HOME/.config/nvim/snippet/bf.snippet<cr>G
nnoremap avl<tab> :-1read $HOME/.config/nvim/snippet/avl.snippet<cr>G
nnoremap mmheap<tab> :-1read $HOME/.config/nvim/snippet/mmheap.snippet<cr>G
nnoremap bminus<tab> :-1read $HOME/.config/nvim/snippet/bminus.snippet<cr>G
nnoremap red<tab> :-1read $HOME/.config/nvim/snippet/red.snippet<cr>G
nnoremap bplus<tab> :-1read $HOME/.config/nvim/snippet/bplus.snippet<cr>G
nnoremap trie<tab> :-1read $HOME/.config/nvim/snippet/trie.snippet<cr>G
nnoremap patricia<tab> :-1read $HOME/.config/nvim/snippet/patricia.snippet<cr>G
