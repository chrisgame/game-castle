local g = vim.g       -- Global variables
local opt = vim.opt   -- Set options (global/buffer/windows-scoped)

-----------------------------------------------------------
-- General
-----------------------------------------------------------
opt.clipboard = 'unnamedplus'                   -- Copy/paste to system clipboard
opt.completeopt = 'menuone,noinsert,noselect'   -- Autocomplete options
opt.spelllang = 'en_gb'                         -- Spell check lang

-----------------------------------------------------------
-- Neovim UI
-----------------------------------------------------------
opt.number = true           -- Show line number
opt.splitright = true       -- Vertical split to the right
opt.splitbelow = true       -- Horizontal split to the bottom
opt.ignorecase = true       -- Ignore case letters when search
opt.smartcase = true        -- Ignore lowercase for the whole pattern
opt.termguicolors = true    -- Enable 24-bit RGB colors
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

-----------------------------------------------------------
-- Plugin management
-----------------------------------------------------------
require("config.lazy")

-----------------------------------------------------------
-- Key Bindings
-----------------------------------------------------------
g.mapleader = ","
vim.keymap.set('n', '<C-F>', '<cmd>NvimTreeFindFileToggle<CR>', { noremap = true })

-- tabs
vim.keymap.set('n', '<leader>tt', ':tabnew<CR>', { noremap = true })
vim.keymap.set('n', '<leader>te', ':tabedit<CR>', { noremap = true })
vim.keymap.set('n', '<leader>tc', ':tabclose<CR>', { noremap = true })
vim.keymap.set('n', '<leader>to', ':tabonly<CR>', { noremap = true })
vim.keymap.set('n', '<leader>tn', ':tabnext<CR>', { noremap = true })
vim.keymap.set('n', '<leader>tp', ':tabprevious<CR>', { noremap = true })
vim.keymap.set('n', '<leader>tf', ':tabfirst<CR>', { noremap = true })
vim.keymap.set('n', '<leader>tl', ':tablast<CR>', { noremap = true })
vim.keymap.set('n', '<leader>tm', ':tabmove<CR>', { noremap = true })

--spell check
local function toggle_spell_check()
    vim.opt.spell = not(vim.opt.spell:get())
end

vim.keymap.set('n', '<leader>s', toggle_spell_check, { noremap = true })

-----------------------------------------------------------
-- Colorscheme
-----------------------------------------------------------
require("onedarker").setup()
vim.cmd [[colorscheme onedarker]]

-----------------------------------------------------------
-- Package management
-----------------------------------------------------------
require("mason").setup();

-----------------------------------------------------------
-- File Search
-----------------------------------------------------------
local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})
vim.keymap.set('n', '<leader>fb', builtin.buffers, {})
vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})

require('telescope').setup{
  defaults = {
    -- Default configuration for telescope goes here:
    -- config_key = value,
    layout_config = {
      height = 0.99,
      width = 0.99,
      prompt_position = 'top',
    },
    sorting_strategy = 'ascending',
    mappings = {
      i = {
        -- map actions.which_key to <C-h> (default: <C-/>)
        -- actions.which_key shows the mappings for your picker,
        -- e.g. git_{create, delete, ...}_branch for the git_branches picker
        ["<C-h>"] = "which_key"
      }
    }
  },
  pickers = {
    -- Default configuration for builtin pickers goes here:
    -- picker_name = {
    --   picker_config_key = value,
    --   ...
    -- }
    -- Now the picker_config_key will be applied every time you call this
    -- builtin picker
  },
  extensions = {
    -- Your extension configuration goes here:
    -- extension_name = {
    --   extension_config_key = value,
    -- }
    -- please take a look at the readme of the extension you want to configure
  }
}

require('telescope').load_extension('fzf')

-----------------------------------------------------------
-- Completion
-----------------------------------------------------------
local cmp = require'cmp'

cmp.setup({
  window = {
    -- completion = cmp.config.window.bordered(),
    -- documentation = cmp.config.window.bordered(),
  },
  mapping = cmp.mapping.preset.insert({
    ['<C-b>'] = cmp.mapping.scroll_docs(-4),
    ['<C-f>'] = cmp.mapping.scroll_docs(4),
    ['<C-Space>'] = cmp.mapping.complete(),
    ['<C-e>'] = cmp.mapping.abort(),
    ['<CR>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
    ["<Tab>"] = cmp.mapping(function(fallback)
			if cmp.visible() then
				cmp.select_next_item()
			else
				fallback()
			end
		end, {"i", "s"}),
    ["<S-Tab>"] = cmp.mapping(function(fallback)
			if cmp.visible() then
				cmp.select_prev_item()
			else
				fallback()
			end
		end, {"i", "s"}),
  }),
  sources = cmp.config.sources({
    { name = 'nvim_lsp' },
  }, {
    { name = 'buffer' },
  })
})

-- Use buffer source for `/` and `?` (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline({ '/', '?' }, {
  mapping = cmp.mapping.preset.cmdline(),
  sources = {
    { name = 'buffer' }
  }
})

-- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline(':', {
  mapping = cmp.mapping.preset.cmdline(),
  sources = cmp.config.sources({
    { name = 'path' }
  }, {
    { name = 'cmdline' }
  }),
  matching = { disallow_symbol_nonprefix_matching = false }
})

-----------------------------------------------------------
-- Manual format
-----------------------------------------------------------
vim.keymap.set("n", "<leader>gf", vim.lsp.buf.format, {})

-----------------------------------------------------------
-- File tree
-----------------------------------------------------------
local function tree_attach(bufnr)
  local api = require "nvim-tree.api"

  local function opts(desc)
    return { desc = "nvim-tree: " .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
  end

  -- default mappings
  api.config.mappings.default_on_attach(bufnr)

  -- custom mappings
  vim.keymap.set('n', 't', api.node.open.tab,        opts('Open in new tab'))
  vim.keymap.set('n', 'i', api.node.open.horizontal, opts('Open in split'))
  vim.keymap.set('n', 's', api.node.open.vertical,   opts('Open in vsplit'))
end

require("nvim-tree").setup {
  actions = {
    open_file = {
      quit_on_open = true,
    }
  },
  on_attach = tree_attach,
}

-----------------------------------------------------------
-- Status line, tab line, win bar styling
-----------------------------------------------------------
require('lualine').setup {
  options = {
    theme = 'auto',
    component_separators = { left = '', right = ''},
    section_separators = { left = '', right = ''},
    always_divide_middle = false,
  },
  sections = {
    lualine_a = {'mode'},
    lualine_b = {'branch', 'diff', 'diagnostics'},
    lualine_c = {
      {
        'filename',
        path = 1, -- relative path
        shorting_target = 40, -- truncate at 40 characters
      }
    },
    lualine_x = {'encoding', 'fileformat', 'filetype'},
    lualine_y = {'progress'},
    lualine_z = {'location'}
  },
  inactive_sections = {
    lualine_a = {},
    lualine_b = {},
    lualine_c = {'filename'},
    lualine_x = {'location'},
    lualine_y = {},
    lualine_z = {}
  },
  tabline = {
    lualine_a = {
      {
        'tabs',
        tab_max_length = 100,  -- Maximum width of each tab. The content will be shorten dynamically (example: apple/orange -> a/orange)
        mode = 2, -- show tab_nr + tab_name
        path = 1, -- show the relative path and shorten $HOME to ~
      }
    }
  },
  winbar = {},
  inactive_winbar = {},
  extensions = {}
}

-----------------------------------------------------------
-- Comment toggling
-----------------------------------------------------------
require('Comment').setup()
