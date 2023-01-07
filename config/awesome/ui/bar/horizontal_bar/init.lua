local awful = require('awful')
local beautiful = require('beautiful')
local wibox = require('wibox')
local taglist = require "ui.bar.horizontal_bar.modules.tags"
local helpers = require 'helpers'
local margin = wibox.container.margin
local dpi = beautiful.xresources.apply_dpi
local color = require("gears.color")
local gfs = require("gears.filesystem")
local image_path = gfs.get_configuration_dir() .. "assets/"
require('../../../user_likes')
require('ui.bar.horizontal_bar.modules.tag_preview')

screen.connect_signal("request::desktop_decoration", function(s)

  awful.tag(
        {'1', '2', '3', '4', '5'},
        s, awful.layout.layouts[1]
    )

  launcher = awful.widget.button {
    image = image_path.."arch_logo.png",
    buttons = {
      awful.button({}, 1, nil, function ()
        awful.spawn.with_shell("~/.config/awesome/apps/rofi/launch.sh")
      end)
    }
  }

  systray = wibox.widget({
    widget = wibox.widget.systray,
    visible = true,
  })

  clock = wibox.widget({
		widget = wibox.widget.textclock,
		format = "%I:%M %p",
		align = "center",
		valign = "center",
		font = "SauceCodePro Nerd Font Bold 14",
	})

  s.mylayouts = awful.widget.layoutbox {
        screen  = s,
        forced_height = 30,
        -- forced_width = 30,
        valign = "center",
        buttons = {
            awful.button({ }, 1, function () awful.layout.inc( 1) end),
            awful.button({ }, 3, function () awful.layout.inc(-1) end),
            awful.button({ }, 4, function () awful.layout.inc(-1) end),
            awful.button({ }, 5, function () awful.layout.inc( 1) end),
        }
    }

  s.bar = awful.wibar {
    position = "top",
    screen = s, 
    margins = 5,
    -- width = 45,
    height = 50,
    -- height = awful.screen.focused().workarea.height - beautiful.useless_gap * 4,
    -- shape = helpers.mkroundedrect(10),
    widget = {
      layout = wibox.layout.align.horizontal,
      {
        layout = wibox.container.place,
        -- margin(s.mylayouts, 0, 0, 10, 0),
        -- s.mylayouts,
        margin(launcher, 10, 0, 10, 10),
        -- margin(launcher, 5, 0, 10, 0),
      },
      {
        layout = wibox.layout.fixed.horizontal, 
        margin(taglist(s), 230, 0, 0, 0),
        -- forced_width = 24,
        -- forced_height = 24,
        valign = 'center',
        layout = wibox.container.place,
      },

      {
       layout = wibox.layout.fixed.horizontal,
        -- margin(volume_widget, 5, 5, 3, 5),
        -- margin(systray, 5, 5, 0, 10),
        -- margin(s.mylayouts, 5, 0, 0, 10),
        -- margin(clock, 0, 0, 0, 10),
        -- margin(systray, 0, 5, 10, 10),
        margin(s.mylayouts, 0, 5, 0, 0),
        margin(clock, 20, 5, 0, 0),
        margin(systray, 5, 10, 15, 15),
      },
    }
  }

end)
