return {
    -- The core Mason plugin
    {
        "williamboman/mason.nvim",
        config = function()
            require("mason").setup()
        end,
    },
    -- Bridges Mason with the built-in LSP
    {
        "williamboman/mason-lspconfig.nvim",
        config = function()
            require("mason-lspconfig").setup({
                ensure_installed = { "lua_ls", "rust_analyzer" },
            })
        end,
    },
    -- The actual LSP configurations
    { "neovim/nvim-lspconfig" },
}
