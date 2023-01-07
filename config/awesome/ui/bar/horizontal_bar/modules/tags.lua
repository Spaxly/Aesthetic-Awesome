local wibox = require 'wibox'
local gears = require 'gears'
local awful = require 'awful'
local beautiful = require 'beautiful'
local helpers = require 'helpers'
local bling = require 'bling'
local rubato = require 'rubato'

local function get_taglist (s)
	return awful.widget.taglist {
		screen = s,
		filter = awful.widget.taglist.filter.all,
		layout = {
			spacing = 10,
			layout = wibox.layout.fixed.horizontal,
		},
		buttons = {
            awful.button({}, 1, function (t)
                t:view_only()
            end),
            awful.button({}, 4, function (t)
                awful.tag.viewprev(t.screen)
            end),
            awful.button({}, 5, function (t)
                awful.tag.viewnext(t.screen)
            end)
        },
		widget_template = {
			{
				id = 'bg_role',
				shape = gears.shape.circle,
			  bg = beautiful.crust,
				forced_height = 16,
				forced_width = 16,
				widget = wibox.container.background,
			},
			halign = 'center',
			layout = wibox.container.place,
			create_callback = function (self, tag)
				local bg = self:get_children_by_id('bg_role')[1]

				self.animate = rubato.timed { duration = 0.15 }

				self.animate:subscribe(function (pos)
					bg.forced_height = pos
				end)

				self.blue_transition = helpers.apply_transition {
					element = bg,
					prop = 'bg',
					-- bg = "#be9ff9",
          bg = beautiful.text,
					hbg = beautiful.blue
				}

				self.update = function ()
					if tag.selected then
						self.animate.target = 20
						self.blue_transition.on()
					elseif #tag:clients() > 0 then
						self.animate.target = 20
						self.blue_transition.off()
					else
						self.animate.target = 10
						self.blue_transition.off()
					end
				end

				self.update()
			end,
			update_callback = function (self)
				self.update()
			end
		},
    buttons = taglist_buttons
}
end

local function main (s)
	local bg = wibox.widget {
		{
			get_taglist(s),
			top = 8,
			bottom = 8,
      left = 10,
      right = 10,
			widget = wibox.container.margin,
		},
		bg = beautiful.surface0,
		shape = gears.shape.rounded_bar,
		widget = wibox.container.background,
	}

	helpers.add_hover(bg, beautiful.surface0, beautiful.surface0)

	local container = wibox.widget {
		bg,
    top = 8,
    bottom = 8,
		left = 10,
		right = 10,
		widget = wibox.container.margin,
	}

	return container
end

return main
