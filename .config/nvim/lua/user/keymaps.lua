local opts = { noremap = true, silent = true }

local term_opts = { silent = true }
-- Shorten function name
local keymap = vim.api.nvim_set_keymap
local builtin = require('telescope.builtin')
--Remap space as leader key
keymap("", "<Space>", "<Nop>", opts)
vim.g.mapleader = " "
vim.g.maplocalleader = " "
-- FILES --
vim.keymap.set('n', '<leader>ff', builtin.find_files, { desc = 'Telescope find files' })
keymap("n", "<leader>e", ":NvimTreeToggle<CR>", opts)
vim.keymap.set('n', '<leader>fs', function()
  builtin.grep_string({ search = vim.fn.input("Grep > ") })
end)
vim.keymap.set("n", "<leader>df", ":Gitsigns diffthis ")
vim.keymap.set('n', '<leader>d', function()
  vim.diagnostic.open_float({
    border = 'rounded',
    source = true,
    scope = 'cursor',
  })
end, { desc = 'Show diagnostic' })
vim.keymap.set('n', '<leader>i', function()
  vim.lsp.buf.code_action({
    context = { only = { 'quickfix' } },
    apply = true,
  })
end, { desc = 'Apply quickfix (auto-import)' })
-- GIT --
keymap("n", "<leader>gs", ":Telescope git_status<CR>", opts)
keymap("n", "<leader>fg", ":LazyGit<CR>", opts)
keymap('n', 'gd', ":VGit buffer_diff_preview<CR>", opts)
keymap('n', 'gh', ":VGit buffer_hunk_preview<CR>", opts)
-- LSP --
vim.keymap.set('n', 'gr', function() vim.lsp.buf.references() end)

vim.keymap.set("n", "<C-d>", vim.lsp.buf.definition, {
  desc = "Go to definition",
})

vim.api.nvim_create_autocmd("LspAttach", {
  callback = function(args)
    local client = vim.lsp.get_client_by_id(args.data.client_id)
    if client and client.server_capabilities.signatureHelpProvider then
      vim.keymap.set('i', '<C-s>', vim.lsp.buf.signature_help, { buffer = args.buf })
    end
  end,
})

vim.api.nvim_create_autocmd("LspAttach", {
  callback = function(args)
    local client = vim.lsp.get_client_by_id(args.data.client_id)
    if client and client.server_capabilities.signatureHelpProvider then
      vim.keymap.set('i', '(', '(<cmd>lua vim.lsp.buf.signature_help()<CR>', { buffer = args.buf })
      vim.keymap.set('i', ',', ',<cmd>lua vim.lsp.buf.signature_help()<CR>', { buffer = args.buf })
    end
  end,
})


vim.keymap.set("n", "<leader>nf", function()
  local dir = vim.fn.expand("%:p:h")
  local filename = vim.fn.input("New file: ", dir .. "/")
  if filename ~= "" then
    vim.cmd("edit " .. vim.fn.fnameescape(filename))
  end
end, { desc = "New file in current directory" })
