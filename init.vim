lua require('basic')
lua require('keybindings')
lua require('plugins')
lua require('plugin-config/nvim-tree')
lua require('plugin-config/bufferline')
lua require('plugin-config/nvim-treesitter')
lua require('plugin-config/telescope')
lua require('plugin-config/autoclose')
lua require('plugin-config/acceleratedjk')

set smartindent
set tabstop=4
set shiftwidth=4
set expandtab
set cmdheight=4

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



map <leader>r :call CompileRunGcc()<CR>
func! CompileRunGcc() 
	exec "w"
    " 第一次開
    if !exists('g:last_terminal_job_id')
        call TermOpen()
        call TermClose()
    endif

  let file_name = expand('%:t:r')

	if &filetype == 'cpp'
		exec "!g++ % -std=c++20 -DLOCAL -Wall -Wextra -O2 -Winvalid-pch -o %<"
    if v:shell_error == 0
        call TermOpen()
        exec "call REPLSend(['./' . file_name])"
    endif

  elseif &filetype == 'c'
		exec "!gcc % -o %<"
    "Make sure that compilation succeded before opening the term
    if v:shell_error == 0
        call TermOpen()
        exec "call REPLSend(['./' . file_name])"
    endif

  elseif &filetype == 'java'
	  exec "!javac %"
    if v:shell_error == 0
        call TermOpen()
        exec "call REPLSend(['java ' . file_name])"
    endif

  elseif &filetype == 'python'
    call TermOpen()
    exec "call REPLSend(['python3 ' . file_name . '.py'])"

	endif
endfunc



" dropdown, persistent terminal {{{

nmap <silent> <leader>. :call nvim_open_win(bufnr('%'), v:true, {'relative': 'editor', 'anchor': 'NW', 'width': winwidth(0), 'height': 2*winheight(0)/2, 'row': 1, 'col': 0})<cr>:call TerminalToggle()<cr>
tmap <silent> <leader>. <c-\><c-n>:call TerminalToggle()<cr>:q<cr>

function! TermOpen()
    call nvim_open_win(bufnr('%'), v:true, {'relative': 'editor', 'anchor': 'NW', 'width': winwidth(0), 'height': 2*winheight(0)/2, 'row': 1, 'col': 0})
    call TerminalToggle()
endfunction

function! TermClose()
    call TerminalToggle()
    exec "quit"
endfunction

function! TerminalCreate() abort
  if !has('nvim')
    return v:false
  endif

  if !exists('g:terminal')
    let g:terminal = {
          \ 'opts': {},
          \ 'term': {
          \ 'loaded': v:null,
          \ 'bufferid': v:null
          \ },
          \ 'origin': {
          \ 'bufferid': v:null
          \ }
          \ }

    function! g:terminal.opts.on_exit(jobid, data, event) abort
      silent execute 'buffer' g:terminal.origin.bufferid silent execute 'bdelete!' g:terminal.term.bufferid

      let g:terminal.term.loaded = v:null
      let g:terminal.term.bufferid = v:null
      let g:terminal.origin.bufferid = v:null
    endfunction
  endif

  if g:terminal.term.loaded
    return v:false
  endif

  let g:terminal.origin.bufferid = bufnr('')

  enew
  call termopen(&shell, g:terminal.opts)

  let g:terminal.term.loaded = v:true
  let g:terminal.term.bufferid = bufnr('')
  startinsert
endfunction

function! TerminalToggle()
  if !has('nvim')
    return v:false
  endif

  " Create the terminal buffer.
  if !exists('g:terminal') || !g:terminal.term.loaded
    return TerminalCreate()
  endif

  " Go back to origin buffer if current buffer is terminal.
  if g:terminal.term.bufferid ==# bufnr('')
    silent execute 'buffer' g:terminal.origin.bufferid

    " Launch terminal buffer and start insert mode.
  else
    let g:terminal.origin.bufferid = bufnr('')

    silent execute 'buffer' g:terminal.term.bufferid
    startinsert
  endif
endfunction

"get last buffer id"
augroup Terminal
  au!
  au TermOpen * let g:last_terminal_job_id = b:terminal_job_id
augroup END

function! REPLSend(lines)
    call jobsend(g:last_terminal_job_id, add(a:lines, ''))
endfunction


