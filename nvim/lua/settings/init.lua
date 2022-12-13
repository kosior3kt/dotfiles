local set = vim.opt
local api = vim.api

set.expandtab = true
set.shiftwidth = 3
set.softtabstop = 3
set.incsearch = true
set.syntax = on

set.splitbelow = true
set.splitright = true 
set.wrap = false
set.scrolloff = 5
set.fileencoding = 'utf-8'
set.termguicolors = true
set.number = true
set.relativenumber = true
set.cursorline = true
set.cursorcolumn = false 
set.updatetime = 1000

-- this thing is responsible for making my markers not disapear
-- set.viminfo = '1000,f1'

set.hidden = true

--vim.cmd["hi LineNr guibg=none guifg=#aa7799"]
vim.cmd [[hi LineNr guibg=none guifg=#aa7799]]

vim.cmd[["hi! CursorLineNr gui=bold guifg=red"]]
vim.api.nvim_command("hi! CursorLineNr gui=bold guifg=red")

-- here i assign an auto command (its gonna be wild!)

api.nvim_create_autocmd(
{"BufNewFile", "BufRead"},
{pattern = "*.cpp", 
command = "set formatprg=/Users/jk/Programming/programs/astyle/as-gcc-exe/astyle\\ -xg\\ -xe\\ -A4\\ -xV\\ -S\\ -L\\ -xf\\ -xb\\ -f "
})

api.nvim_create_autocmd(
{"BufNewFile", "BufRead"},
{pattern = "*.c", 
command = "set formatprg=/Users/jk/Programming/programs/astyle/as-gcc-exe/astyle\\ -xg\\ -xe\\ -A4\\ -xV\\ -S\\ -L\\ -xf\\ -xb\\ -f "
})


-- If im not wrong this should be working!!!!

--require "custom-cursor.lua"

vim.opt.undofile = true;




--
-- function Pain()
-- 	local colors = {
-- 		bg = "#202328",
-- 		fg = "#bbc2cf",
-- 		yellow = "#ECBE7B",
-- 		cyan = "#008080",
-- 		-- darkblue = "#081633",
-- 		darkblue = "#292e42",
-- 		green = "#3d5122",
-- 		-- orange = "#FF8800",
-- 		-- orange = "#ff9e64",
-- 		-- orange = "#e0af68",
-- 		orange = "#a16f27",
-- 		violet = "#a9a1e1",
-- 		magenta = "#c678dd",
-- 		blue = "#aa7799",
-- 		red = "#6f3328",
-- 	}
--
-- 	local mode_color = {
--             cursor_color={
-- 		n = colors.darkblue,
-- 		i = colors.green,
-- 		v = colors.yellow,
-- 		v = colors.blue,
-- 		V = colors.blue,
-- 		c = colors.orange,
-- 		no = colors.red,
-- 		s = colors.orange,
-- 		s = colors.orange,
-- 		ic = colors.yellow,
-- 		r = colors.violet,
-- 		rv = colors.violet,
-- 		cv = colors.red,
-- 		ce = colors.red,
-- 		r = colors.cyan,
-- 		rm = colors.cyan,
-- 		tr= colors.red,},
--          numbers_color={
--             -- n = colors.darkblue,
--           -- i = colors.green,
--              -- v = colors.yellow,
--             v = colors.blue,
--              -- c = colors.orange,
--             v = colors.yellow,
--             v = colors.blue,
--             no = colors.red,
--             s = colors.orange,
--             s = colors.orange,
--             ic = colors.yellow,
--             r = colors.violet,
--             rv = colors.violet,
--             cv = colors.red,
--             ce = colors.red,
--             r = colors.cyan,
--             rm = colors.cyan,
--             tr= colors.red,
--             -- n = "#0057e3",
--             n = "#009dff",
--             i = "#229c5f",
--             c = "#aa7799",
--             v = "#a234b3",
--             V = "#a234b3",
--          },
--          background_color={
--             -- n = colors.darkblue,
--           -- i = colors.green,
--              -- v = colors.yellow,
--             -- v = colors.blue,
--              -- c = colors.orange,
--             -- v = colors.yellow,
--             -- v = colors.blue,
--             no = colors.red,
--             s = colors.orange,
--             -- s = colors.orange,
--             ic = colors.yellow,
--             r = colors.violet,
--             rv = colors.violet,
--             v = colors.red,
--             -- ce = colors.red,
--             r = colors.cyan,
--             -- rm = colors.cyan,
--             -- tr = colors.red,
--             -- n = "#040c42",
--             n = "#040c42",
--             i = "#032f30",
--             c = "#403804",
--             v = "#400431",
--             cv = "#30032f",
--             ce = "#30032f",
--             tr = "#30032f",
--             rv = "#30032f",
--             V = "#30032f",
--          },
-- 	}
--   local color = mode_color.cursor_color[vim.api.nvim_get_mode().mode]
--   if color == nil then
--     color = "none"
--   end
--   print(vim.api.nvim_get_mode().mode)
--   vim.api.nvim_command("hi! cursorline guifg=none guibg=".. color)
--   local color = mode_color.numbers_color[vim.api.nvim_get_mode().mode]
--   if color == nil then
--     color = "none"
--   end
--   vim.api.nvim_command("hi linenr guibg=none guifg=" ..color) --makes some sense however needs to be configured further
--
--   ------------------------ EXPERYMENTALNE -----------------------------------------
--   -- local color = mode_color.background_color[vim.api.nvim_get_mode().mode]
--   -- vim.api.nvim_command("hi Normal guifg=none guibg=" ..color) --makes some sense however needs to be configured further
--    -- vim.cmd [[hi linenr guibg=none guifg=#aa7799]]
-- end
--
-- vim.api.nvim_command([[autocmd ModeChanged * lua Pain()]])
--
--
-- ----------------------------------niby dzila, ale wtedy nie ma przezroczystego tla-------------------------------
-- -- var option = true;
-- -- if(option){
-- --    vim.api.nvim_set_hl(0, "Chicken", {
-- --      bg = "#040c42",
-- --      fg = "none",
-- --    })
-- --    vim.api.nvim_set_hl(0, "Chicken2", {
-- --      bg = "#000000",
-- --      fg = "none",
-- --    })
-- -- 
-- --    vim.api.nvim_create_augroup("_terminal", { clear = true })
-- --    vim.api.nvim_create_autocmd("BufEnter",
-- --       {command = "setlocal winhighlight=Normal:Chicken", group = "_terminal",}
-- --       )
-- -- 
-- --    vim.api.nvim_create_autocmd("BufLeave",
-- --       {command = "setlocal winhighlight=Normal:Chicken2", group = "_terminal",}
-- --       )
-- --}
--
--
