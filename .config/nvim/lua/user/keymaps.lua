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
-- GIT --
keymap("n", "<leader>gs", ":Telescope git_status<CR>", opts)
keymap("n", "<leader>fg", ":LazyGit<CR>", opts)
keymap('n', 'gd', ":VGit buffer_diff_preview<CR>", opts)
keymap('n', 'gh', ":VGit buffer_hunk_preview<CR>", opts)
-- LSP --
vim.keymap.set('n', 'gr', function() vim.lsp.buf.references() end)
vim.keymap.set("n", "<C-d>", function()
    local params = vim.lsp.util.make_position_params()

    vim.lsp.buf_request(0, "textDocument/definition", params, function(_, result)
        if not result or vim.tbl_isempty(result) then
            vim.notify("No definition found", vim.log.levels.INFO)
            return
        end

        local location = result[1] or result
        local uri = location.uri or location.targetUri
        local range = location.range or location.targetSelectionRange

        local def_bufnr = vim.uri_to_bufnr(uri)

        -- Ensure buffer is loaded
        if not vim.api.nvim_buf_is_loaded(def_bufnr) then
            vim.fn.bufload(def_bufnr)
        end

        ----------------------------------------------------------------------
        -- Look for an existing tab that already shows this buffer
        ----------------------------------------------------------------------
        local target_tab = nil

        for _, tab in ipairs(vim.api.nvim_list_tabpages()) do
            for _, win in ipairs(vim.api.nvim_tabpage_list_wins(tab)) do
                if vim.api.nvim_win_get_buf(win) == def_bufnr then
                    target_tab = tab
                    break
                end
            end
            if target_tab then break end
        end

        if target_tab then
            -- Jump to existing tab
            vim.api.nvim_set_current_tabpage(target_tab)
        else
            -- Open in a new tab
            vim.cmd("tabnew")
            vim.api.nvim_win_set_buf(0, def_bufnr)
        end

        -- Move cursor to definition
        vim.api.nvim_win_set_cursor(0, {
            range.start.line + 1,
            range.start.character,
        })
    end)
end, { desc = "Go to definition (reuse tab if exists)" })



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
