local kmap = vim.keymap.set

vim.g.mapleader = " "

kmap("n", "<leader>nt", "<cmd>Ex<cr>")
kmap("n", "<leader>nl", "<cmd>Vex<cr>")
kmap("n", "<leader>nr", "<cmd>Vex!<cr>")

kmap("n", "<C-s>", "<cmd>w!<cr>")
kmap("n", "<C-w>", "<cmd>q!<cr>")

kmap("v", "<leader>y", "\"+y")

kmap("n", "<C-h>", "<cmd>wincmd h<cr>")
kmap("n", "<C-l>", "<cmd>wincmd l<cr>")
