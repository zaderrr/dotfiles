require("nvim-tree").setup({
    renderer = {
        icons = {
            show = {
                folder = true,
                file = true,
                folder_arrow = false,
            },
        },
    },
})

local opts = { noremap = true, silent = true }
local api = require("nvim-tree.api")
vim.keymap.set("n", "t", api.node.open.tab, opts)
