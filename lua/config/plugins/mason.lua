return {
    -- Bridges Mason with the built-in LSP
    {
        "williamboman/mason-lspconfig.nvim",
        config = function()
            require("mason-lspconfig").setup({
                ensure_installed = { 
			"lua_ls", 
			"rust_analyzer",
			"ts_ls",
			"html",
			"cssls",
			"tailwindcss",
			"svelte",
			"graphql",
			"emmet_ls",
			"prismals",
			"pyright",
			"eslint",
		},
            })
        end,
	dependencies = {
		{
			"williamboman/mason.nvim",
			opts = {}
		},
		{
    		
			"neovim/nvim-lspconfig",
			config = function()
				local gd_cfg = vim.lsp.config.gdscript

				vim.lsp.config('gdscript', {
					cmd = {"ncat", "localhost", "6005"},
					-- Merge with the defaults from nvim-lspconfig
					root_markers = gd_cfg.root_markers,
					filetypes = gd_cfg.filetypes,
				})

				vim.lsp.enable('gdscript')
			end
		}
	}
    },
}
