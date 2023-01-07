local wibox = require('wibox')
local awful = require 'awful'
require('../../../user_likes')

local launchers = {}

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
  markup = '',
  onclick = function () 
    awful.spawn.with_shell(rofi)
  end
}
