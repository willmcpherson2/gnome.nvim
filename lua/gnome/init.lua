local cmd = [[
test $(dconf read /org/gnome/desktop/interface/color-scheme) = "'prefer-dark'"
]]

local function on_exit(_, exit_code, _)
  local is_dark_mode = exit_code == 0
  if is_dark_mode then
    vim.api.nvim_set_option('background', 'dark')
  else
    vim.api.nvim_set_option('background', 'light')
  end
end

local function update()
  vim.fn.jobstart(cmd, { on_exit = on_exit })
end

local function init()
  vim.fn.timer_start(1000, update, { ['repeat'] = -1 })
end

return { init = init }
