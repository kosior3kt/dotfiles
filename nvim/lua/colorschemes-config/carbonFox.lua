require('nightfox').setup({
    modules = {
        native_lsp = {
            enable = true,
            background = true,
        },
    },
    groups = {
        all = {
           Normal = { "sp = pallete.cyan" }
        },
    },
    options={
        transparent = true,    -- Disable setting background
        dim_inactive = true,   -- Non focused panes set to alternative background
    }})

vim.cmd("colorscheme carbonfox")


