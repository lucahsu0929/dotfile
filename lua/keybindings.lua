vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- 保存本地变量(方便未來建立map)
local map = vim.api.nvim_set_keymap
local opt = {noremap = true, silent = true }

-- 之后就可以这样映射按键了
-- map('模式','按键','映射为XX',opt)

map("i", "jk", "<ESC>", opt)
map("v", "<leader>cs", "\"+y", opt)
map("n", "<leader>.", ":FloatermNew<CR>", opt)
map("t", "<leader>.", "<c-\\><c-n>:FloatermKill<CR>", opt)
-- map("n", "<leader>s", ":source %<CR>", opt) --refresh current file

--navigation
map('n', 'j', '<Plug>(accelerated_jk_gj)', {})
map('n', 'k', '<Plug>(accelerated_jk_gk)', {})
map('n', '<C-j>', '9j', {})
map('n', '<C-k>', '9k', {})

map('v', '<', '<gv', opt)
map('v', '>', '>gv', opt)


-- delete word
map('n', 'dw', 'evbd', {})


