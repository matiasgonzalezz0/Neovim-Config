-- Some themes need these option
vim.opt.termguicolors = true

vim.opt.number = true
vim.opt.relativenumber = true

vim.opt.expandtab = true

vim.opt.mouse = "a"

vim.opt.wrap = false

vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.opt.undofile = true

vim.opt.ignorecase = true
vim.opt.smartcase = true

vim.opt.signcolumn = "yes"

vim.opt.updatetime = 50

vim.opt.cursorline = true

vim.opt.scrolloff = 10

vim.opt.hlsearch = true

-- Disables netrw
vim.g.loaded_netrwPlugin = 1
vim.g.loaded_netrw = 1

-- Modular function to set indentation
local function set_indent(size)
  vim.opt.tabstop = size
  vim.opt.softtabstop = size
  vim.opt.shiftwidth = size
  print("Switched to " .. size .. "-space indentation")
end

-- Set default indentation
set_indent(2)

-- Create the commands
vim.api.nvim_create_user_command('Indent2', function()
  set_indent(2)
end, {})

vim.api.nvim_create_user_command('Indent4', function()
  set_indent(4)
end, {})
