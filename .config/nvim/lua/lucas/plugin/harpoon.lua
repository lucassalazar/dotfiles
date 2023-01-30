local setup_mark, mark = pcall(require, "harpoon.mark")

if not setup_mark then
	return
end

local setup_ui, ui = pcall(require, "harpoon.ui")

if not setup_ui then
	return
end

vim.keymap.set("n", "<M-a>", mark.add_file)
vim.keymap.set("n", "<M-e>", ui.toggle_quick_menu)

vim.keymap.set("n", "<M-h>", function () ui.nav_file(1) end)
vim.keymap.set("n", "<M-j>", function () ui.nav_file(2) end)
vim.keymap.set("n", "<M-k>", function () ui.nav_file(3) end)
vim.keymap.set("n", "<M-l>", function () ui.nav_file(4) end)
