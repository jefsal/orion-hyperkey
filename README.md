# orion-hyperkey

Cycle Orion windows with Hyper+3 in Hammerspoon. If only one Orion window exists, a second press hides the app. A menu bar icon will flash (λ) each cycle.

## Why

Working across multiple windows in the same app can get slow with mouse or Cmd+` alone. This script keeps the flow fast: one key to rotate through Orion windows, and a quick hide when there's only one. This enables speed for users.

## Install

1. Install Hammerspoon and enable Accessibility. More [here](https://hammerspoon.org/faq/) 
2. Put `orion-hyperkey.lua` in `~/.hammerspoon/` or anywhere hammerspoon can see 
3. Add this to your `~/.hammerspoon/init.lua`:

```lua
local orion = require("orion-hyperkey")
orion.setup()
```

4. Reload Hammerspoon config.

## Notes

- Hyper key: Cmd + Option + Ctrl + Shift + 3
- If you have a tool like raycast bound to the application, unbind it

## License

MIT
