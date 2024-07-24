local g = vim.g       -- Global variables
local opt = vim.opt   -- Set options (global/buffer/windows-scoped)

-----------------------------------------------------------
-- General
-----------------------------------------------------------
opt.clipboard = 'unnamedplus'                   -- Copy/paste to system clipboard
opt.completeopt = 'menuone,noinsert,noselect'   -- Autocomplete options

-----------------------------------------------------------
-- Neovim UI
-----------------------------------------------------------
opt.number = true           -- Show line number
opt.splitright = true       -- Vertical split to the right
opt.splitbelow = true       -- Horizontal split to the bottom
opt.ignorecase = true       -- Ignore case letters when search
opt.smartcase = true        -- Ignore lowercase for the whole pattern
-- opt.termguicolors = true    -- Enable 24-bit RGB colors
opt.scrolloff = 3           -- Show N lines of context offset around the cursor
opt.belloff = ''            -- Silence the bell for all events
opt.visualbell = true       -- No beeping

-----------------------------------------------------------
-- Tabs, indent
-----------------------------------------------------------
opt.expandtab = true        -- Use spaces instead of tabs
opt.shiftwidth = 2          -- Shift N spaces when tab
opt.tabstop = 2             -- 1 tab == N spaces
opt.smartindent = true      -- Autoindent new lines

-----------------------------------------------------------
-- Memory, CPU
-----------------------------------------------------------
opt.hidden = true           -- Enable background buffers
opt.history = 10000         -- Remember N lines in history
opt.synmaxcol = 240         -- Max column for syntax highlight

-----------------------------------------------------------
-- Startup
-----------------------------------------------------------
-- Disable nvim intro
opt.shortmess:append "sI"

g.mapleader = ","
