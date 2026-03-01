require('neo-tree').setup({
    border = {
        style = "rounded",
    },
    window = {
        width = 30,
    },
    default_component_configs = {
        indent = {
            indent_size = 1,
            padding = 1,
            -- indent guides
            with_markers = false,
            indent_marker = "",
            last_indent_marker = "",
            highlight = "NeoTreeIndentMarker",
            -- expander config, needed for nesting files
            with_expanders = nil, -- if nil and file nesting is enabled, will enable expanders
            expander_collapsed = "",
            expander_expanded = "",
            expander_highlight = "NeoTreeExpander",
        },
        icon = {
            folder_closed = "",
            folder_open = "",
            folder_empty = "󰜌",
            provider = function(icon, node, state) -- default icon provider utilizes nvim-web-devicons if available
                if node.type == "file" or node.type == "terminal" then
                    local success, web_devicons = pcall(require, "nvim-web-devicons")
                    local name = node.type == "terminal" and "terminal" or node.name
                    if success then
                        local devicon, hl = web_devicons.get_icon(name)
                        icon.text = devicon or icon.text
                        icon.highlight = hl or icon.highlight
                    end
                end
            end,
            -- The next two settings are only a fallback, if you use nvim-web-devicons and configure default icons there
            -- then these will never be used.
            default = "*",
            highlight = "NeoTreeFileIcon",
            use_filtered_colors = true, -- Whether to use a different highlight when the file is filtered (hidden, dotfile, etc.).
        },
        git_status = {
            symbols = {
                -- Change type
                added     = "✚", -- NOTE: you can set any of these to an empty string to not show them
                deleted   = "✖",
                modified  = "M",
                renamed   = "R",
                -- Status type
                untracked = "-",
                ignored   = "",
                unstaged  = "U",
                staged    = "",
                conflict  = "",
            },
            align = "right",
        }
    }
})
