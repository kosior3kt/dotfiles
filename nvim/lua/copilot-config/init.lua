
vim.cmd[[highlight CopilotSuggestion guifg=#a550bf gui=bold]]
vim.g.copilot_no_tab_map = true;


-- vim.api.nvim_set_keymap("i", "<C-a>", ":copilot#Accept(/<CR>)<CR>", { silent = true })

vim.cmd[[imap <silent><script><expr> <C-/> copilot#Accept("\<CR>")]]




