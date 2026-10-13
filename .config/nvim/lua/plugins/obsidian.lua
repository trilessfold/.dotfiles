-- obsidian.nvim v3: links are followed through its in-process LSP (obsidian-ls).
-- Keys inside the vault:
--   gd          follow [[link]] (also creates the note if it does not exist yet)
--   <CR>        toggle checkbox on the line / visual selection, nothing else
--   <leader>nn  vimwiki-like: turn the word under cursor (or selection) into a [[link]],
--               create the note file next to the current one and open it

-- Create a note named `label` next to the current note, return the link text.
local function create_note(label)
    local note = require("obsidian.note").create({ id = label, title = label, should_write = true })
    return note, note:format_link({ label = label })
end

local function new_note_from_word()
    local word = vim.fn.expand("<cword>")
    if word == "" then
        return
    end
    local note, link = create_note(word)
    vim.cmd({ cmd = "normal", args = { '"_ciw' .. link }, bang = true })
    vim.cmd("silent! write")
    vim.cmd("edit " .. vim.fn.fnameescape(tostring(note.path)))
end

-- Called from a `:` command, so the '< '> marks hold the selection.
local function new_note_from_selection()
    local s, e = vim.fn.getpos("'<"), vim.fn.getpos("'>")
    if s[2] ~= e[2] then
        vim.notify("Only single-line selections are supported", vim.log.levels.WARN)
        return
    end
    local row = s[2] - 1
    local line = vim.api.nvim_buf_get_lines(0, row, row + 1, false)[1] or ""
    -- '> points at the first byte of the last char; extend to the end of that (multibyte) char.
    local last_char = vim.fn.matchstr(line, ".", e[3] - 1)
    local end_col = math.min(e[3] - 1 + #last_char, #line)
    local label = vim.trim(line:sub(s[3], end_col))
    if label == "" then
        return
    end
    local note, link = create_note(label)
    vim.api.nvim_buf_set_text(0, row, s[3] - 1, row, end_col, { link })
    vim.cmd("silent! write")
    vim.cmd("edit " .. vim.fn.fnameescape(tostring(note.path)))
end

local gd_registered = false

return {
    "obsidian-nvim/obsidian.nvim",
    version = "*",
    -- Always loaded: :Obsidian commands (search, new, today...) must work before any markdown buffer is open.
    lazy = false,
    dependencies = { "nvim-lua/plenary.nvim" },
    opts = {
        -- The same vault lives at different paths: Mac ~/Documents/Abrakadabra, work host ~/vault.
        -- Only existing directories are passed, otherwise obsidian.nvim refuses to set up.
        workspaces = (function()
            local ws = {}
            for _, path in ipairs({ "~/Documents/Abrakadabra", "~/vault" }) do
                if vim.fn.isdirectory(vim.fn.expand(path)) == 1 then
                    table.insert(ws, { name = vim.fs.basename(path), path = path })
                end
            end
            return ws
        end)(),
        daily_notes = {
            folder = "dailies",
            template = "daily.md",
            default_tags = { "daily-notes" },
        },
        templates = {
            folder = "templates",
        },
        -- New notes are named by their title (vimwiki-like), not by a generated timestamp id.
        note_id_func = function(title)
            if title and title ~= "" then
                return title
            end
            return tostring(os.time())
        end,
        checkbox = {
            -- <CR> only toggles " " <-> "x"; other states ([!], [>], [~]) are typed by hand.
            -- To cycle through all of them instead: order = { " ", "~", "!", ">", "x" }
            order = { " ", "x" },
            -- Do not turn plain paragraphs into checkboxes on <CR>; only list items toggle.
            create_new = false,
        },
        ui = { enable = false },
        legacy_commands = false,
        callbacks = {
            enter_note = function(_)
                local map = function(mode, lhs, rhs, desc)
                    vim.keymap.set(mode, lhs, rhs, { buffer = true, desc = desc })
                end
                -- <CR> never follows links: it only toggles the checkbox on the line / selection.
                map("n", "<CR>", "<cmd>Obsidian toggle_checkbox<cr>", "Toggle checkbox")
                map("v", "<CR>", ":Obsidian toggle_checkbox<cr>", "Toggle checkboxes")
                map("n", "<leader>nn", new_note_from_word, "New note from word")
                map("v", "<leader>nn", ":<C-u>lua require('plugins.obsidian')._new_note_from_selection()<cr>",
                    "New note from selection")

                -- gd: LazyVim registers its LSP `gd` (lsp_definitions picker) through
                -- Snacks.keymap, which re-applies on every LSP event; the newest registration
                -- wins, so register ours the same way, once, after LazyVim's.
                if not gd_registered and Snacks and Snacks.keymap then
                    gd_registered = true
                    Snacks.keymap.set("n", "gd", "<cmd>Obsidian follow_link<cr>",
                        { lsp = { name = "obsidian-ls" }, desc = "Follow Obsidian link" })
                end
            end,
        },
    },
    -- exported for the visual-mode mapping above
    _new_note_from_selection = new_note_from_selection,
}
