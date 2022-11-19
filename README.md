# gnome.nvim

A tiny Neovim plugin that switches between `background=light` and
`background=dark` based on your GNOME settings.

Integrates well with the [GNOME Night Theme Switcher
extension](https://extensions.gnome.org/extension/2236/night-theme-switcher/).

```lua
-- packer.nvim
use {
  "willmcpherson2/gnome.nvim",
  config = function()
    require("gnome").init()
  end
}
```
