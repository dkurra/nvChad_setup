require "nvchad.mappings"

-- add yours here

local map = vim.keymap.set

map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>")


map("n", "<leader>b", "<cmd>Telescope buffers<CR>")

-- newly added
vim.api.nvim_set_option("clipboard", "unnamed")

-- map({ "n", "i", "v" }, "<C-s>", "<cmd> w <cr>")
