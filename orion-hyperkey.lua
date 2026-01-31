-- Orion Hyper+3 window cycling for Hammerspoon
-- Usage: require this file from your ~/.hammerspoon/init.lua and call setup()

local M = {}

function M.setup()
  -- Hyper key (Cmd+Alt+Ctrl+Shift)
  local hyper = {"cmd", "alt", "ctrl", "shift"}
  local appName = "Orion"

  local menuItem = hs.menubar.new()
  local clearTimer = nil

  if menuItem then
    menuItem:setTitle("")
  end

  local function flashMenuBar()
    if not menuItem then
      return
    end
    menuItem:setTitle("λ")
    if clearTimer then
      clearTimer:stop()
    end
    clearTimer = hs.timer.doAfter(0.3, function()
      menuItem:setTitle("")
    end)
  end

  local function cycleOrion()
    local app = hs.application.get(appName)
    if not app then
      hs.application.launchOrFocus(appName)
      return
    end

    local windows = hs.fnutils.filter(app:allWindows(), function(w)
      return w:isStandard() and w:isVisible() and not w:isMinimized()
    end)

    if #windows == 0 then
      hs.application.launchOrFocus(appName)
      return
    end

    local focused = hs.window.focusedWindow()
    if not focused or focused:application() ~= app then
      windows[1]:focus()
      return
    end

    if #windows == 1 then
      app:hide()
      return
    end

    -- Cycle to next Orion window
    local idx = 1
    for i, w in ipairs(windows) do
      if w:id() == focused:id() then
        idx = i
        break
      end
    end
    local nextWin = windows[(idx % #windows) + 1]
    flashMenuBar()
    nextWin:focus()
  end

  hs.hotkey.bind(hyper, "3", cycleOrion)
end

return M
