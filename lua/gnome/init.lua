local cmd = [[
gsettings get org.gnome.desktop.interface color-scheme;
gsettings monitor org.gnome.desktop.interface color-scheme
]]

local function on_stdout(options)
  return function(_, data, _)
    if string.match(data[1], "dark") then
      options.on_dark()
    else
      options.on_light()
    end
  end
end

local function setup(options)
  setmetatable(options, { __index = {
    on_light = function()
      vim.api.nvim_set_option("background", "light")
    end,
    on_dark = function()
      vim.api.nvim_set_option("background", "dark")
    end,
  } })

  vim.fn.jobstart(cmd, { on_stdout = on_stdout(options) })
end

return { setup = setup }
