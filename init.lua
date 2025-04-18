vim.cmd [[
set relativenumber
nnoremap  <F1>  :edit $MYVIMRC<cr>
" nnoremap   : q:i
" set cursorcolumn
nnoremap  <c-x><c-b> :buffers<cr>
nnoremap  R :bnext<cr>
nnoremap  E :bprevious<cr>
nnoremap  , :<up><cr>
" nnoremap  <c-x>k :bdelete<cr>
]]
-- The line beneath this is called `modeline`. See `:help modeline`
-- vim: ts=2 sts=2 sw=2 et
--
vim.cmd [[
set relativenumber
" set cursorcolumn
nnoremap  <F1>  :edit $MYVIMRC<cr>
" nnoremap   : q:i
nnoremap  <c-x><c-b> :buffers<cr>
nnoremap  R :bnext<cr>
nnoremap  E :bprevious<cr>
nnoremap  , :<up><cr>
nnoremap  <c-x>k :bdelete!<cr>
" nnoremap ::  ":redir @a |    | redir end  | put =@a <Esc>0f|2<right>a"
]]
local map = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }
--  bug:  will affact  the old option 'more'  and need to confirm
map("n", "::", "q:iredir @a | set nomore | silent!   | redir end  | set more| put =@a <Esc>0f!<right>a", opts)
map("n", ":", "q:i", opts)
map("n", "<F1><F1>", [[ q:i edit  C:\usr\Users5\Administrator\AppData\Local\nvim\lua\plugins\user.lua <CR>]], opts)
map("n", "//", [[/\%<c-r>=line('.')<cr>l]], opts)
map("n", "<c-x><c-s>", [[:w!<cr>]], opts)
-- this can only execution  vim command ,it has a little  limitation
map("v", "<c-x><c-e>", [[:y"<cr>:@"<cr>]], opts)
-- map("n", "<c-x>k", [[:bdelete!<cr>]], opts)
map("n", "<c-h>", [[:help  ]], opts)
map("n", "<c-x><c-f>", [[:find  ]], opts)
map("n", "<c-x><c-q>", [[:set invreadonly<cr>:set invmodifiable<cr>]], opts)
map("n", "<c-x>b", [[:new  scratch_]], opts)
map("n", "<S-Insert>", [["+p]], opts)
--  bug that  if  add eval ( )
map("n", "gt", [[:%s/\(true\|\(false\)\)/\=eval(submatch(0)=='false'?'true':'false')/g<cr>]], opts)
map("n", "gt", [[:s/\(\<true\|\(false\)\)/\=submatch(0)=='false'?'true':'false'/g<cr>]], opts)
--TODO there is still to upgrade
map("n", "gs", [[kmmj:m//<cr>kdd'mp]], opts)
-- normal!!  表示 不使用map   经过测试 发现下面的这个不行,于是改变使用map方式  bug原因是因为yiw不能只复制数字
map("n", "<c-a><c-a>", [[:exe "normal! \<c-a>\<c-x>yiw\<c-r>"\<c-a>"<cr>]], opts)
map("n", "<c-a><c-a>", [[:%s#txtdev\zs\d#\=submatch(0)+submatch(0)#g]], opts)
map("n", "<c-a><c-a>", [[:s#\d\+#\=submatch(0)*2#<cr>]], opts)
-- there is a bug , it can not   save format
map("n", "<c-a><c-a>", [[:s#\d\+#\=submatch(0)+submatch(0)#<cr>]], opts)
map("n", "<c-x><c-c>", [[:cq<cr>]], opts)

-- 这里只能用于简单的匹配,不能处理中间有多个 ""的情况 TOOO need upgrade
-- map("n", "<c-x><c-q>", [[/"\zs[^"]*\ze<cr>"]], opts)
-- TODO   trim  the space of  [[  ]]
--
vim.cmd [[
chdir  .\AppData\Local\nvim
echo "当前目录是: " . expand('%:h:h')
echo "当前目录是: " . expand('%:h:h')
set nowrap
" 当从插入模式切换到普通模式之前执行的命令

" autocmd InsertLeave * silent! echo "Leaving Insert Mode"
"""
" " 当从普通模式切换到插入模式之前执行的命令
" autocmd InsertEnter	*		echo   "Leaving Insert Mode"
" autocmd InsertEnter * silent! echo "Entering Insert Mode"
]]

-- TODO  record the macro  form the enter normal  mode and exit normal mode
--   example autocmd BufWritePost <buffer> source %
--
--

-- vim.api.nvim_create_autocmd("InsertEnter", {
--   desc = "test",
--   group = vim.api.nvim_create_augroup("test", { clear = true }),
--   callback = function()
--     vim.cmd [[
--       echo  1111
--     ]]
--   end,
-- })
--

-- TODO    auto jump to next  ""
-- TODO    how  to rename  buffer and  file  responding to buffer
-- file name   .it can  rename  buffname
-- TODO  how to redir local buffer de map  to another buffer

vim.cmd [[
autocmd FileType python nnoremap <buffer> <c-x><F5> :w<CR>:!python %<CR>

augroup DockerCompose
    autocmd!
    autocmd BufEnter docker-compose.yml echo "你已经打开了docker-compose.yml"
    autocmd BufEnter docker-compose.yml nnoremap <buffer> <c-x><F5> :w<CR>:!docker-compose -f  %  -p %:h up -d --build<CR> 
augroup END
]]

--  TODO   how to quickly jump to  [[]]  ""=========  "\zs[^"]*\ze"   `  it fail because of  "
--
--
--
--
--  example
--        :let start = line('.')
--              :let end = search("^$") - 1
--                    :let lines = getline(start, end)
--
--
--
--TODO  redo and undo can differ frome  now and all
--
--
--
--
--
--
-- --
-- vim script example
-- function! ToggleTrueFalse()
--     normal! gg
--     let line = getline('.')
--     let new_line = substitute(line, 'false', 'true', 'g')
--     let new_line = substitute(new_line, 'true', 'false', 'g')
--     call setline('.', new_line)
-- endfunction  nnoremap <F5> :call ToggleTrueFalse()<CR>
--
