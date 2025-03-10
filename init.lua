vim.g.base46_cache = vim.fn.stdpath "data" .. "/nvchad/base46/"
vim.g.mapleader = " "

-- bootstrap lazy and all plugins
local lazypath = vim.fn.stdpath "data" .. "/lazy/lazy.nvim"

if not vim.loop.fs_stat(lazypath) then
  local repo = "https://github.com/folke/lazy.nvim.git"
  vim.fn.system { "git", "clone", "--filter=blob:none", repo, "--branch=stable", lazypath }
end

vim.opt.rtp:prepend(lazypath)

local lazy_config = require "configs.lazy"

-- load plugins
if vim.g.neovide then
  vim.o.guifont = "JetbrainsMono Nerd Font:h10"

  vim.g.neovide_refresh_rate = 75

  vim.g.neovide_cursor_vfx_mode = "railgun"

  vim.keymap.set("i", "<c-s-v>", "<c-r>+")
  vim.keymap.set("i", "<c-r>", "<c-s-v>")
end

vim.api.nvim_set_option("clipboard", "unnamedplus")
vim.opt.clipboard = "unnamedplus"

require("lazy").setup({
  {
    "NvChad/NvChad",
    lazy = false,
    branch = "v2.5",
    import = "nvchad.plugins",
    config = function()
      require "options"
    end,
  },

  { import = "plugins" },
}, lazy_config)

-- load theme
dofile(vim.g.base46_cache .. "defaults")
dofile(vim.g.base46_cache .. "statusline")

require "nvchad.autocmds"

vim.schedule(function()
  require "mappings"
end)
