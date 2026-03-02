require("akita")
require("config.lazy")

require("conform").setup({
	formatters_by_ft = {
		lua = { "stylua" },
		-- Conform will run multiple formatters sequentially
		python = { "pyright" },
		-- You can customize some of the format options for the filetype (:help conform.format)
		rust = { "rustfmt", lsp_format = "fallback" },
		-- Conform will run the first available formatter
		javascript = { "prettierd", "prettier", stop_after_first = true },
	},
	format_after_save = {
		async = true,
		lsp_format = "fallback",
	},
})

-- print("hello")

if vim.fn.filereadable(vim.fn.getcwd() .. "/project.godot") == 1 then
	local addr = "./godot.pipe"
	if vim.fn.has("win32 == 1") then
		-- Windows can't pipe so use localhost. Make sure this is configured in Godot
		addr = "127.0.0.1:6004"
	end
	vim.fn.serverstart(addr)
end
