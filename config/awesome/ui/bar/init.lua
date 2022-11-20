local awful = require('awful')
local beautiful = require('beautiful')
local wibox = require('wibox')
local gettaglist = require "ui.bar.modules.tags"
local helpers = require 'helpers'
local margin = wibox.container.margin
local dpi = beautiful.xresources.apply_dpi
local color = require("gears.color")
local gfs = require("gears.filesystem")
local image_path = gfs.get_configuration_dir() .. "assets/"
local vicious = require("vicious")
require('../../user_likes')

screen.connect_signal("request::desktop_decoration", function(s)

  awful.tag(
        {'1', '2', '3', '4', '5'},
        s, awful.layout.layouts[1]
    )

  local function make_launcher(opts)
    local launcher = wibox.widget {
        markup = opts.markup,
        align = 'center',
        font = opts.font,
        widget = wibox.widget.textbox,
    }

    launcher:add_button(awful.button({}, 1, function ()
        if opts.onclick then
            opts.onclick()
        end
    end))

    return launcher
  end

  local launcher = make_launcher {
    markup = '<span foreground="#1793d1"> </span>',
    font = "JetBrainsMono Nerd Font 20",
    align = "center",
    valign = "center",
    onclick = function ()
      awful.spawn.with_shell('~/.config/awesome/ui/bar/scripts/rofi')
    end
  }

  clock = wibox.widget({
		widget = wibox.widget.textclock,
		format = "%I\n%M %p",
		align = "center",
		valign = "center",
		font = "SauceCodePro Nerd Font Bold 19",
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
    position = "left",
    screen = s, 
    margins = 5,
    width = 45,
    height = awful.screen.focused().workarea.height - beautiful.useless_gap * 4,
    -- shape = helpers.mkroundedrect(10),
    widget = {
      layout = wibox.layout.align.vertical,
      {
        layout = wibox.container.place,
        -- margin(s.mylayouts, 0, 0, 10, 0),
        -- s.mylayouts,
        -- launcher,
        margin(launcher, 5, 0, 10, 0),
      },
      {
        -- layout = wibox.layout.fixed.vertical, 
        gettaglist(s),
        -- forced_width = 24,
        -- forced_height = 24,
        valign = 'center',
        layout = wibox.container.place,
      },

      {
       layout = wibox.layout.fixed.vertical,
        -- margin(volume_widget, 5, 5, 3, 5),
        margin(s.mylayouts, 5, 0, 0, 10),
        margin(clock, 0, 0, 0, 10),
      },
    }
  }

end)
