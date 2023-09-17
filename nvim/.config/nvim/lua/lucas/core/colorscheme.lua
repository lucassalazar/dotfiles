local status, _ = pcall(vim.cmd, 'colorscheme doom-one')

if not status then
    print('Colorscheme not found')
    return
end

pcall(vim.cmd, "hi Normal guibg=none ctermbg=none")
pcall(vim.cmd, "hi NormalNc guibg=none ctermbg=none")
pcall(vim.cmd, "hi LineNr guibg=none ctermbg=none")
pcall(vim.cmd, "hi Folded guibg=none ctermbg=none")
pcall(vim.cmd, "hi NonText guibg=none ctermbg=none")
pcall(vim.cmd, "hi SpecialKey guibg=none ctermbg=none")
pcall(vim.cmd, "hi VertSplit guibg=none ctermbg=none")
pcall(vim.cmd, "hi SignColumn guibg=none ctermbg=none")
pcall(vim.cmd, "hi EndOfBuffer guibg=none ctermbg=none")
