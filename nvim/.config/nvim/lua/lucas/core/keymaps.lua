-- [[ Basic Keymaps ]]
local keymap = vim.keymap

-- Keymaps for better default experience
-- See `:help vim.keymap.set()`
keymap.set({ 'n', 'v' }, '<Space>', '<Nop>', { silent = true })

-- Remap for dealing with word wrap
keymap.set('n', 'k', "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
keymap.set('n', 'j', "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })

-- Increment and decrement numbers
keymap.set("n", "<leader>+", "<C-a>")
keymap.set("n", "<leader>-", "<C-x>")

-- Diagnostic keymaps
keymap.set('n', '[d', vim.diagnostic.goto_prev, { desc = 'Go to previous diagnostic message' })
keymap.set('n', ']d', vim.diagnostic.goto_next, { desc = 'Go to next diagnostic message' })
keymap.set('n', '<leader>e', vim.diagnostic.open_float, { desc = 'Open floating diagnostic message' })
keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostics list' })

keymap.set("n", "<leader>pv", vim.cmd.Ex)

-- Toggle NvimTree
keymap.set('n', '<leader>ft', vim.cmd.NvimTreeToggle)

-- toggles splitted window maximization
keymap.set("n", "<leader>sm", ":MaximizerToggle<CR>")

-- moves the highlighted lines up and down
keymap.set("v", "J", ":m '>+1<CR>gv=gv")
keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- brings up the bottom line up keeping the cursor still
keymap.set("n", "J", "mzJ`z")

-- jumps down keeping the cursor in the middle of the page
keymap.set("n", "<C-d>", "<C-d>zz")
keymap.set("n", "<C-u>", "<C-u>zz")

-- keeps the searched terms in the middle of the page
keymap.set("n", "n", "nzzzv")
keymap.set("n", "N", "Nzzzv")

-- greatest remap ever (ThePrimeagen)
-- keeps the yanked in buffer over the deleted highlight
keymap.set("x", "<leader>p", [["_dP]])

-- next greatest remap ever (asbjornHaland)
-- calls the + register (system clipboard)
keymap.set({ "n", "v" }, "<leader>y", [["+y]])
-- calls the + register for the entire line
keymap.set("n", "<leader>Y", [["+Y]])

keymap.set({ "n", "v" }, "<leader>d", [["_d]])

keymap.set("n", "Q", "<nop>")

-- opens filesystem navigation (fzf) and tmux
keymap.set("n", "<C-f>", "<cmd>silent !tmux neww tmux-sessionizer<CR>")

-- opens cheat sheet
keymap.set("n", "<leader>cs", "<cmd>silent !tmux split-window -h tmux-cht<CR>")

-- indents the code
keymap.set("n", "<leader>f", vim.lsp.buf.format)

-- quick fix navigation
-- keymap.set("n", "<C->", "<cmd>cnext<CR>zz")
-- keymap.set("n", "<C-j>", "<cmd>cprev<CR>zz")
-- keymap.set("n", "<leader>k", "<cmd>lnext<CR>zz")
-- keymap.set("n", "<leader>j", "<cmd>lprev<CR>zz")

-- search and replace
keymap.set("n", "<leader>sr", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]], { desc = "[S]earch and [R]eplace" })

-- makes the file executable
keymap.set("n", "<leader>x", "<cmd>!chmod +x %<CR>", { silent = true })

-- opens plugins-setup.lua
keymap.set("n", "<leader>vpp", "<cmd>e ~/.config/nvim/lua/lucas/plugins-setup.lua<CR>");
