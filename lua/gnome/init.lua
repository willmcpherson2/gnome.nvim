local cmd = "gsettings monitor org.gnome.desktop.interface color-scheme"

local function on_stdout(_, data, _)
  if data[1] == "color-scheme: 'prefer-dark'" then
    vim.api.nvim_set_option("background", "dark")
  else
    vim.api.nvim_set_option("background", "light")
  end
end

local function init()
  vim.fn.jobstart(cmd, { on_stdout = on_stdout })
end

return { init = init }
