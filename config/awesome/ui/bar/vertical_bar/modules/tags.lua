---@diagnostic disable: undefined-global
local awful = require 'awful'
local wibox = require 'wibox'
local gears = require 'gears'
local rubato = require 'rubato'

-- local circle = function(cr, width, height)
  -- gears.shape.transform(gears.shape.circle) : scale(1, 1)(cr, 20, 20)
-- end

local function gettaglist(s)
    return awful.widget.taglist {
        screen = s,
        filter = awful.widget.taglist.filter.all,
        style = {
            shape = gears.shape.circle,
        },
        layout = {
            spacing = 10,
            layout = wibox.layout.fixed.vertical,
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
                markup = '',
                widget = wibox.widget.textbox,
            },
            id = 'background_role',
            forced_height = 24,
            forced_width = 24,
            widget = wibox.container.background,
            create_callback = function (self, tag)
                self.animate = rubato.timed {
                    duration = 0.15,
                    subscribed = function (h)
                        self:get_children_by_id('background_role')[1].forced_height = h
                    end
                }

                self.update = function ()
                    if tag.selected then
                        self.animate.target = 18
                    elseif #tag:clients() > 0 then
                        self.animate.target = 14
                    else
                        self.animate.target = 8
                    end
                end

                self.update()
            end,
            update_callback = function (self)
                self.update()
            end,
        }
    }
end

return gettaglist

