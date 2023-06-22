vim.g.mapleader = " "
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)

vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

vim.keymap.set("n", "J", "mzJ`z")
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

-- greatest remap ever
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

-- Chad Tree
vim.keymap.set("n", "<leader>t", "<cmd>NvimTreeToggle<CR>")

-- Vimspector

vim.keymap.set("n", "<leader>dd", "<cmd>call vimspector#Launch()<CR>")
vim.keymap.set("n", "<leader>dr", "<cmd>call vimspector#Reset()<CR>")
vim.keymap.set("n", "<leader>dc", "<cmd>call vimspector#Continue()<CR>")
vim.keymap.set("n", "<leader>db", "<cmd>call vimspector#ToggleBreakpoint()<CR>")
vim.keymap.set("n", "<leader>dB", "<cmd>call vimspector#ClearBreakpoints()<CR>")

vim.keymap.set("n", "<leader>dh", "<cmd>call vimspector#Restart()<CR>")
vim.keymap.set("n", "<leader>dl", "<cmd>call vimspector#StepOut()<CR>")
vim.keymap.set("n", "<leader>dj", "<cmd>call vimspector#StepInto()<CR>")
vim.keymap.set("n", "<leader>dk", "<cmd>call vimspector#StepOver()<CR>")
