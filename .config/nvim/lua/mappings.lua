require "nvchad.mappings"

-- add yours here

local map = vim.keymap.set

map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>")
map("n", "<leader>w", "<cmd>w!<cr>", { desc = "Save file" })
map("n", "<leader>gg", "<cmd>LazyGit<cr>", { desc = "Open Lazy Git" })

-- map({ "n", "i", "v" }, "<C-s>", "<cmd> w <cr>")
