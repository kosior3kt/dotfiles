require'shade'.setup({
  overlay_opacity = 100,
  opacity_step = 1,
  -- state.active = false,
  state = {
     active = true 
  },
  keys = {
    brightness_up    = '<C-Up>',
    brightness_down  = '<C-Down>',
    toggle           = '<Leader>s',
  }
})
require'shade'.toggle()   ---- immidiately toggles after start

-- vim.cmd[[<Leader>s <CR>]]
