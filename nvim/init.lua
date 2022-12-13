require("settings")
require("mappings")
require("nvim-commenter-config") --turns out it doesn't really work :<
require("lsp-config")
require("cmp-config")
require("colorschemes-config.tokyoNight")
require("packer-config")
require("nvim-tree-config")
require("clangd-config") --this is the guy responsible for linting!!!
require("lsp-config.null-ls")
require("lualine").setup()
require("dap-config")
require("ale-config")  --must have fucked sth up really badly, because after my customization it workes only when not included xD
require("indent-blankline-config")
require("rainbow-config")
require("shade-config")
require("tree-sitter-config")
require("telescope-config")
require("comment-config")
require("toggleterm-config")
require("alpha-config")
require("vimtex-config")
require("bufferline-config")
require("close-buffers-config")
require("rust-tools-config")
require("copilot-config")
require("marks-config")
require("modal-colors-config")



-- Lua
vim.cmd([[colorscheme tokyonight]])
vim.cmd [[hi LineNr guibg=none guifg=#009dff]] --has to be here otherwise is being destroyed by this pesky tokyo (prolly can include it in tokyo style but cant be bothered by this...grep -nr 'yourString*' .grep -nr 'yourString*' .)
vim.cmd([[hi! CursorLineNr gui=bold guifg=lightred]]) --middle color 

