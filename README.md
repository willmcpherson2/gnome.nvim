# gnome.nvim

A Neovim plugin for switching themes based on GNOME settings.

Integrates well with the [GNOME Night Theme Switcher
extension](https://extensions.gnome.org/extension/2236/night-theme-switcher/).

```lua
-- packer.nvim
use {
  "willmcpherson2/gnome.nvim",
  config = function()
    require("gnome").init {
      -- these are the default options and can be omitted
      on_light = function()
        vim.api.nvim_set_option("background", "light")
      end,
      on_dark = function()
        vim.api.nvim_set_option("background", "dark")
      end,
    }
  end
}
```
