local colors = {
    blue   = '#80a0ff',
    cyan   = '#79dac8',
    black  = '#080808',
    white  = '#c6c6c6',
    red    = '#ff5189',
    violet = '#d183e8',
    grey   = '#303030',
}

local bubbles_theme = {
    normal = {
        a = { fg = colors.white, bg = "None", bold = true },
        b = { fg = colors.white, bg = "None", bold = true },
        c = { fg = colors.white, bg = "None", bold = true },
    },

    inactive = {
        a = { fg = colors.white, bg = "None", bold = true },
        b = { fg = colors.white, bg = "None", bold = true },
        c = { fg = colors.white, bg = "None", bold = true },
    },

}
require('lualine').setup {
    options = {
        theme = bubbles_theme,
        component_separators = '',
        section_separators = { left = '', right = '' },
        globalstatus = true
    },
    sections = {
        lualine_a = {},
        lualine_b = { 'filename', 'branch' },
        lualine_c = {
            '%=', --[[ add your center components here in place of this comment ]]
        },
        lualine_x = {},
        lualine_y = { 'filetype', 'progress' },
        lualine_z = {
            { 'location', separator = { right = '' }, left_padding = 2 },
        },
    },
    inactive_sections = {
        lualine_a = { { 'mode', separator = { left = '' }, right_padding = 2 } },
        lualine_b = { 'filename', 'branch' },
        lualine_c = {
            '%=', --[[ add your center components here in place of this comment ]]
        },
        lualine_x = {},
        lualine_y = { 'filetype', 'progress' },
        lualine_z = {
            { 'location', separator = { right = '' }, left_padding = 2 },
        },
    },
    tabline = {},
    extensions = {},
}
