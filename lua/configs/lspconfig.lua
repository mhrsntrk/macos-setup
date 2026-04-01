require("nvchad.configs.lspconfig").defaults()

local servers = {
	"ts_ls",
	"tailwindcss",
	"eslint",
	"html",
	"cssls",
	"bashls",
	"dockerls",
	"docker_compose_language_service",
	"jsonls",
	"lua_ls",
	"yamlls",
}
vim.lsp.enable(servers)
