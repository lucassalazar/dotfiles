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
-- vim.cmd([[ highlight NvimTreeIndentMarker guifg=#ebcb8b ]])

nvimtree.setup({
    sort_by = "case_sensitive",
    view = {
        width = 30,
        mappings = {
            list = {
                { key = "u", action = "dir_up" },
            },
        },
    },
    -- renderer = {
    --     group_empty = true,
    --     icons = {
    --         glyphs = {
    --             folder = {
    --                 arrow_closed = "",
    --                 arrow_open = "",
    --             },
    --         },
    --     },
    -- },
    actions = {
        open_file = {
            window_picker = {
                enable = false,
            },
        },
    },
    filters = {
        dotfiles = false
    },
})

-- Opens nvim on startup
local function open_nvim_tree(data)

    -- buffer is a [No Name]
    local no_name = data.file == "" and vim.bo[data.buf].buftype == ""

    -- buffer is a directory
    local directory = vim.fn.isdirectory(data.file) == 1

    if not no_name and not directory then
        return
    end

    -- change to the directory
    if directory then
        vim.cmd.cd(data.file)
    end

    -- open the tree
    require("nvim-tree.api").tree.open()
end

vim.api.nvim_create_autocmd({ "VimEnter" }, { callback = open_nvim_tree })

pcall(vim.cmd, "hi NvimTreeNormal guibg=none")
