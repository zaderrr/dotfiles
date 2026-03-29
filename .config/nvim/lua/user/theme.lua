vim.opt.background = "dark"
vim.cmd "colorscheme oxocarbon"
vim.api.nvim_set_hl(0, "Normal", { bg = "none" })

vim.api.nvim_set_hl(0, "NvimTreeWinSeparator", { bg = "none" })
vim.api.nvim_set_hl(0, "NvimTreeNormal", { bg = "none" })
vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
vim.api.nvim_set_hl(0, "NormalNC", { bg = "none" })
vim.api.nvim_set_hl(0, 'Winbar', { fg = "white", bold = true, bg = "None" })
vim.api.nvim_set_hl(0, 'WinbarNC', { fg = "white", bold = true, bg = "None" })
vim.api.nvim_set_hl(0, 'StatusLineNC', { fg = "white", bold = true, bg = "None" })
vim.api.nvim_set_hl(0, 'WinSeparator', { fg = "none", bold = true, bg = "None" })
vim.api.nvim_set_hl(0, 'Title', { fg = "white", bold = true, bg = "None" })
vim.api.nvim_set_hl(0, 'TabLine', { fg = "white", bold = false, bg = "None" })
vim.api.nvim_set_hl(0, 'TabLineSel', { fg = "white", bold = true, bg = "None" })
vim.api.nvim_set_hl(0, 'TabLineFill', { fg = "white", bold = true, bg = "None" })
vim.api.nvim_set_hl(0, 'LineNrBelow', { fg = "white", bold = true, bg = "None" })
vim.api.nvim_set_hl(0, 'LineNrAbove', { fg = "white", bold = true, bg = "None" })
vim.api.nvim_set_hl(0, 'CursorLine', { bold = true, bg = "None" })
vim.api.nvim_set_hl(0, 'CursorLineNr', { bold = true, bg = "None", })
vim.api.nvim_set_hl(0, 'StatusLine', { fg = "white", bold = true, bg = "None" })
vim.api.nvim_set_hl(0, 'SignColumn', { fg = "white", bold = true, bg = "None" })
vim.api.nvim_set_hl(0, 'LineNr', { fg = "white", bold = true, bg = "None" })
vim.api.nvim_set_hl(0, "FloatBorder", { fg = "#ffffff", bg = "NONE" })
vim.opt.fillchars:append { eob = " " }
vim.opt.fillchars:append { vert = " " }
