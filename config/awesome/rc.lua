-- If LuaRocks is installed, make sure that packages installed through it are
-- found (e.g. lgi). If LuaRocks is not installed, do nothing.
pcall(require, "luarocks.loader")

-- Standard awesome library
local gears = require("gears")
local beautiful = require('beautiful')
local awful = require("awful")

require("awful.autofocus")
require("awful.hotkeys_popup.keys")
require("./user_likes")
require('configuration')
require('ui')

beautiful.init(theme)
local bling = require('bling')

awful.spawn.with_shell("~/.config/awesome/autostart.sh")
