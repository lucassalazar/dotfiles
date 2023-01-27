local setup, nvimtree = pcall(require, "nvim-tree")

if not setup then
    return
end

-- disable netrw at the very start of your init.lua (strongly advised)
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- set toggle keymap
vim.keymap.set("n", "<leader>e", vim.cmd.NvimTreeToggle)

-- changes the color of the arrows
vim.cmd([[ highlight NvimTreeIndentMarker guifg=#ebcb8b ]])

nvimtree.setup({
    renderer = {
        icons = {
            glyphs = {
                folder = {
                    arrow_closed = "",
                    arrow_open = "",
                },
            },
        },
    },
    actions = {
        open_file = {
            window_picker = {
                enable = false,
            },
        },
    },
    filters = {
        dotfiles = false
    }
})

pcall(vim.cmd, "hi NvimTreeNormal guibg=none")