return {
	{
		"stevearc/conform.nvim",
		opts = require "configs.conform",
	},

	{
		"neovim/nvim-lspconfig",
		config = function()
			require "configs.lspconfig"
		end,
	},

		{
			"williamboman/mason.nvim",
			opts = {
				ensure_installed = {
					"bash-language-server",
					"css-lsp",
					"docker-compose-language-service",
					"dockerfile-language-server",
					"eslint-lsp",
					"html-lsp",
					"json-lsp",
					"lua-language-server",
					"markdownlint",
					"prettierd",
					"tailwindcss-language-server",
					"typescript-language-server",
					"yaml-language-server",
				},
				PATH = "prepend",
			},
		},

	{
		"iamcco/markdown-preview.nvim",
		cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
		build = "cd app && yarn install",
		init = function()
			vim.g.mkdp_filetypes = { "markdown" }
		end,
		ft = { "markdown" },
	},

	{
		"windwp/nvim-ts-autotag",
		ft = { "javascript", "javascriptreact", "typescript", "typescriptreact" },
		config = function()
			require("nvim-ts-autotag").setup()
		end,
	},

	{
		"nvim-treesitter/nvim-treesitter",
		opts = {
			ensure_installed = {
				"vim",
				"lua",
				"vimdoc",
				"html",
				"css",
				"bash",
				"javascript",
				"typescript",
				"tsx",
				"markdown",
				"markdown_inline",
				"mermaid",
				"json",
			},
		},
	},
}
