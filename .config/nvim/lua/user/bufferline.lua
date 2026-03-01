require("bufferline").setup({
    options = {
        mode = "tabs",
        close_icon = ' ',
        buffer_close_icon = ' ',
        show_buffer_icons = false,
        show_tab_indicators = false,
        indicator = {
            style = 'none'
        },
        separator_style = { " ", " " },
        offsets = {
            filetype = "neo-tree",
            text = "File explorer",
            text_align = "left",
            separator = false
        }
    }
})
