local setup_lsp, lsp = pcall(require, "lsp-zero")

if not setup_lsp then
	return
end

lsp.preset("recommended")

lsp.setup_servers({
	"tsserver", -- js/ts
	"html", -- html
	"tailwindcss", -- tawilwind css
	"jsonls", -- json
	"jedi_language_server", -- python
	"clangd", -- c/c++
	"golangci_lint_ls", -- go
	"solang", -- solidity
	"eslint", -- eslint
	"lua_ls", -- lua
	"rust_analyzer", -- rust
	"bashls", -- bash
})

-- Fix Undefined global 'vim'
lsp.configure("lua_ls", {
	settings = {
		Lua = {
			diagnostics = {
				globals = { 'vim' }
			}
		}
	}
})

local setup_cmp, cmp = pcall(require, "cmp")

if not setup_cmp then
	return
end

local lspkind_setup, lspkind = pcall(require, "lspkind")
if not lspkind_setup then
	return
end

local cmp_select = { behavior = cmp.SelectBehavior.Select }
local cmp_mappings = lsp.defaults.cmp_mappings({
	["<C-p>"] = cmp.mapping.select_prev_item(cmp_select),
	["<C-n>"] = cmp.mapping.select_next_item(cmp_select),
	["<Enter>"] = cmp.mapping.confirm({ select = true }),
	["<C-Space>"] = cmp.mapping.complete(),
})

cmp_mappings['<Tab>'] = nil
cmp_mappings['<S-Tab>'] = nil

lsp.setup_nvim_cmp({
	mapping = cmp_mappings,
	-- formatting = {
	-- 	format = lspkind.cmp_format({
	-- 		maxwidth = 50,
	-- 		ellipsis_char = "..."
	-- 	})
	-- }
})

lsp.set_preferences({
	sign_icons = {
		error = '✘',
		warn = '▲',
		hint = '⚑',
		info = ''
	}
})

lsp.on_attach(function(client, bufnr)
	local opts = { buffer = bufnr, remap = false }

	vim.keymap.set("n", "gd", function() vim.lsp.buf.definition() end, opts)
	vim.keymap.set("n", "K", function() vim.lsp.buf.hover() end, opts)
	vim.keymap.set("n", "<leader>vws", function() vim.lsp.buf.workspace_symbol() end, opts)
	vim.keymap.set("n", "<leader>vd", function() vim.lsp.diagnostic.open_float() end, opts)
	vim.keymap.set("n", "[d", function() vim.lsp.diagnostic.goto_next() end, opts)
	vim.keymap.set("n", "]d", function() vim.lsp.diagnostic.goto_prev() end, opts)
	vim.keymap.set("n", "<leader>vca", function() vim.lsp.buf.code_action() end, opts)
	vim.keymap.set("n", "<leader>vrr", function() vim.lsp.buf.references() end, opts)
	vim.keymap.set("n", "<leader>vrn", function() vim.lsp.buf.rename() end, opts)
	vim.keymap.set("i", "<C-h>", function() vim.lsp.buf.signature_help() end, opts)
end)

lsp.setup()

vim.diagnostic.config({
	virtual_text = true
})