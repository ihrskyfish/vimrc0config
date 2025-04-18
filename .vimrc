set number
set history=10000
set smartcase
set relativenumber
set encoding=utf-8
	set autochdir
	set autoindent
	set list
	set listchars+=tab:>~,trail:.
	set tabstop=4


nnoremap ::  q:iredir @a \|    \|  redir END \|  put a     <ESC>0f\| 

augroup BufferKeyMappings
  autocmd!
  autocmd BufEnter * call SetBufferLocalKeyMappings()
augroup END

function! SetBufferLocalKeyMappings()
  nnoremap <buffer> <leader>k :echo "Hello from buffer"<CR>
endfunction

function! SetBufferLocalKeyMappings()
  if &filetype == 'python'
    nnoremap <buffer> <leader>r :!python3 %<CR>
  elseif &filetype == 'markdown'
    nnoremap <buffer> <leader>p :!pandoc -s -o output.pdf %<CR>
  endif
endfunction

function! CheckFilePathAndMapKeys()
  let l:filepath = expand('%:p')
  if l:filepath =~ '/path/to/special/directory/'
    nnoremap <buffer> <leader>s :echo "Special directory shortcut"<CR>
  endif
endfunction


