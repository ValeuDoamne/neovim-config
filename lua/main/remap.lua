vim.g.mapleader = " "
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

vim.keymap.set("n", "J", "mzJ`z")
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

vim.keymap.set("x", "<leader>p", [["_dP]])

vim.keymap.set({ "n", "v" }, "<leader>y", [["+y]])
vim.keymap.set("n", "<leader>Y", [["+Y]])

vim.keymap.set({ "n", "v" }, "<leader>d", [["_d]])

vim.keymap.set("n", "Q", "<nop>")
vim.keymap.set("n", "<leader>f", vim.lsp.buf.format)

vim.keymap.set("n", "<C-k>", "<cmd>cnext<CR>zz")
vim.keymap.set("n", "<C-j>", "<cmd>cprev<CR>zz")
vim.keymap.set("n", "<leader>k", "<cmd>lnext<CR>zz")
vim.keymap.set("n", "<leader>j", "<cmd>lprev<CR>zz")

vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])
vim.keymap.set("n", "<leader>x", "<cmd>!chmod +x %<CR>", { silent = true })

vim.keymap.set("n", "<leader><leader>", function()
    vim.cmd("so")
end)

-- Oil Nvim 
vim.keymap.set("n", "<leader>t", "<cmd>Oil<CR>")

-- Vimspector
vim.keymap.set("n", "<F6>", "<cmd>call vimspector#Launch()<CR>")
vim.keymap.set("n", "<F3>", "<cmd>call vimspector#Reset()<CR>")
vim.keymap.set("n", "<F9>", "<cmd>call vimspector#Continue()<CR>")
vim.keymap.set("n", "<F5>", "<cmd>call vimspector#ToggleBreakpoint()<CR>")
vim.keymap.set("n", "<F12>", "<cmd>call vimspector#ClearBreakpoints()<CR>")

vim.keymap.set("n", "<F11>", "<cmd>call vimspector#Restart()<CR>")
vim.keymap.set("n", "<F7>", "<cmd>call vimspector#StepInto()<CR>")
vim.keymap.set("n", "<F8>", "<cmd>call vimspector#StepOver()<CR>")
vim.keymap.set("n", "<F9>", "<cmd>call vimspector#StepOut()<CR>")
