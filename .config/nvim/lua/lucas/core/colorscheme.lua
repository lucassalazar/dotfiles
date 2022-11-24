local status, _ = pcall(vim.cmd, "colorscheme nordfox")

if not status then
	print("Colorscheme not found!")
	return
end

pcall(vim.cmd, "hi normal guibg=none")
