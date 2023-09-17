local setup, nvimtree = pcall(require, 'nvim-tree')

if not setup then
    return
end

-- disable netrw at the very start of your init.lua (strongly advised)
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

nvimtree.setup({
    sort_by = "case_sensitive",
    view = {
        width = 30,
    },
    renderer = {
        group_empty = true,
    },
    filters = {
        dotfiles = false,
    },
})

pcall(vim.cmd, "hi NvimTreeNormal guibg=none ctermbg=none")
