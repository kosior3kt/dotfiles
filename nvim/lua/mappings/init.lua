local map = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }

vim.g.mapleader = ' '

map('n', '<leader>e', ':NvimTreeToggle<CR>', opts)
map('n', '<TAB>', 'o<ESC>', opts)

-- usefull for commenter
map("n", "m£", "gb", opts)

-- this is for buffer control!
map('n', '<leader>j', ':bprevious<CR>', opts)
map('n', '<leader>;', ':bnext<CR>', opts)
map('n', '<leader>c', ':BDelete this<CR>', opts)
map('n', '<leader>l', ':buffers<CR>', opts)
map('n', '<leader>k', ':badd', opts)
map('n', '<leader>v', ':vs<CR>', opts)
map('n', '<leader>h', ':sp<CR>', opts)
map('n', '<leader>q', ':q<CR>', opts)
map('n', '\\t', ':lua require("dapui").toggle()<CR>', opts)




-- making this thing usable - who thought h j k l was good idea in the first place??
map('n', 'j', 'h', opts)
map('n', 'k', 'j', opts)
map('n', 'l', 'k', opts)
map('n', ';', 'l', opts)

-- same as above but in visual mode as well (usefull)
map('v', 'j', 'h', opts)
map('v', 'k', 'j', opts)
map('v', 'l', 'k', opts)
map('v', ';', 'l', opts)

-- same as above v2 but for visual block mode (?)
map('x', 'j', 'h', opts)
map('x', 'k', 'j', opts)
map('x', 'l', 'k', opts)
map('x', ';', 'l', opts)

-- better panes navigation (current one is useless)
map('n', '<C-j>', '<C-w>h', opts)
map('n', '<C-k>', '<C-w>j', opts)
map('n', '<C-l>', '<C-w>k', opts)
map('n', '<C-;>', '<C-w>l', opts)

-- This thing may work!!!
-- map <C-K> :pyf <path-to-this-file>/clang-format.py<cr>
map('n', '<C-`>', ':lua vim.lsp.buf.formatting_seq_sync()<cr>', opts)


 -- mapping for debugger -- 
local M = {}

local whichkey = require "which-key"

local function keymap(lhs, rhs, desc)
  vim.keymap.set("n", lhs, rhs, { silent = true, desc = desc })
end

function M.setup()
  local keymap = {
    d = {
      name = "Debug",
      R = { "<cmd>lua require'dap'.run_to_cursor()<cr>", "Run to Cursor" },
      E = { "<cmd>lua require'dapui'.eval(vim.fn.input '[Expression] > ')<cr>", "Evaluate Input" },
      C = { "<cmd>lua require'dap'.set_breakpoint(vim.fn.input '[Condition] > ')<cr>", "Conditional Breakpoint" },
      U = { "<cmd>lua require'dapui'.toggle()<cr>", "Toggle UI" },
      b = { "<cmd>lua require'dap'.step_back()<cr>", "Step Back" },
      c = { "<cmd>lua require'dap'.continue()<cr>", "Continue" },
      d = { "<cmd>lua require'dap'.disconnect()<cr>", "Disconnect" },
      e = { "<cmd>lua require'dapui'.eval()<cr>", "Evaluate" },
      g = { "<cmd>lua require'dap'.session()<cr>", "Get Session" },
      h = { "<cmd>lua require'dap.ui.widgets'.hover()<cr>", "Hover Variables" },
      S = { "<cmd>lua require'dap.ui.widgets'.scopes()<cr>", "Scopes" },
      i = { "<cmd>lua require'dap'.step_into()<cr>", "Step Into" },
      o = { "<cmd>lua require'dap'.step_over()<cr>", "Step Over" },
      p = { "<cmd>lua require'dap'.pause.toggle()<cr>", "Pause" },
      q = { "<cmd>lua require'dap'.close()<cr>", "Quit" },
      r = { "<cmd>lua require'dap'.repl.toggle()<cr>", "Toggle Repl" },
      s = { "<cmd>lua require'dap'.continue()<cr>", "Start" },
      t = { "<cmd>lua require'dap'.toggle_breakpoint()<cr>", "Toggle Breakpoint" },
      x = { "<cmd>lua require'dap'.terminate()<cr>", "Terminate" },
      u = { "<cmd>lua require'dap'.step_out()<cr>", "Step Out" },
    },
  }

  whichkey.register(keymap, {
    mode = "n",
    prefix = "<leader>",
    buffer = nil,
    silent = true,
    noremap = true,
    nowait = false,
  })

  local keymap_v = {
    name = "Debug",
    e = { "<cmd>lua require'dapui'.eval()<cr>", "Evaluate" },
  }
  whichkey.register(keymap_v, {
    mode = "v",
    prefix = "<leader>",
    buffer = nil,
    silent = true,
    noremap = true,
    nowait = false,
  })
end

return M



