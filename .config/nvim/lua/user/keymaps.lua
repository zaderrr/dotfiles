local opts = { noremap = true, silent = true }

local term_opts = { silent = true }

-- Shorten function name
local keymap = vim.api.nvim_set_keymap

--Remap space as leader key
keymap("", "<Space>", "<Nop>", opts)
vim.g.mapleader = " "
vim.g.maplocalleader = " "
local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', builtin.find_files, { desc = 'Telescope find files' })
vim.keymap.set('n', '<leader>D', vim.lsp.buf.type_definition, opts)
keymap("n", "<leader>e", ":Neotree toggle<CR>", opts)
vim.keymap.set('n', '<leader>fs', function()
    builtin.grep_string({ search = vim.fn.input("Grep > ") })
end)
keymap("n", "<leader>gs", ":Telescope git_status", opts)
--vim.keymap.set("n", "<C-d>", function()
--vim.cmd("tab split")
-- vim.lsp.buf.declaration()
--end, { desc = "Go to definition (new tab)" })

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






vim.keymap.set("n", "<leader>nf", function()
    local dir = vim.fn.expand("%:p:h")
    local filename = vim.fn.input("New file: ", dir .. "/")
    if filename ~= "" then
        vim.cmd("edit " .. vim.fn.fnameescape(filename))
    end
end, { desc = "New file in current directory" })
