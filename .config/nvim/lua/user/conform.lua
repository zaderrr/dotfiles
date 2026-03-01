require("conform").setup({
    format_on_save = {
        timeout_ms = 500,
        lsp_format = "fallback",
    },
    formatters_by_ft = {
        lua = { "stylua" },
        -- Conform will run multiple formatters sequentially
        csharp = { "csharpier" },
        python = { "pyright" },
        -- You can customize some of the format options for the filetype (:help conform.format)
        -- Conform will run the first available formatter
        javascript = { "eslint_d", stop_after_first = true },
    },
})
