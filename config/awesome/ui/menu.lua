local hotkeys_popup = require('awful.hotkeys_popup')
local awful = require('awful')
local beautiful = require('beautiful')
local menubar = require('menubar')
local helpers = require('helpers')
local wibox = require('wibox')
require('../user_likes')

-- {{{ Menu
-- Create a launcher widget and a main menu
myawesomemenu = {
   { "Edit Config", editor_cmd .. " " .. awesome.conffile },
   { "Restart", awesome.restart },
   { "Exit Awesome", function() awesome.quit() end },
}

mymainmenu = awful.menu {
  items = {
  { "Terminal", function () awful.spawn.with_shell(terminal) end, },
  { "File Manager", file_manager },
  { "Browser", browser },
  { "Editor", editor },
  { "Screenshot", screenshot_tool },
  { "Awesome", myawesomemenu, beautiful.awesome_icon },
  }
}

mylauncher = awful.widget.launcher({ image = beautiful.awesome_icon,
                                     menu = mymainmenu })

-- Menubar configuration
menubar.utils.terminal = terminal -- Set the terminal for applications that require it
-- }}}

-- Round corners even when picom is not available

mymainmenu.wibox.shape = helpers.mkroundedrect()
mymainmenu.wibox:set_widget(wibox.widget({
  mymainmenu.wibox.widget,
  shape = helpers.mkroundedrect(20),
  widget = wibox.container.background,
}))
