---------------------------
-- Default awesome theme --
---------------------------
require('../user_likes')

local theme_assets = require("beautiful.theme_assets")
local xresources = require("beautiful.xresources")
local rnotification = require("ruled.notification")
local dpi = xresources.apply_dpi
local gears = require('gears')

local gfs = require("gears.filesystem")
local themes_path = gfs.get_themes_dir()
local image_path = gfs.get_configuration_dir() .. "assets/"
local theme = require('themes.catppuccin-light')

theme.font          = "VictorMono Nerd Font Italic 10"

-- BORDER & GAPS
theme.useless_gap         = dpi(8)
theme.border_width        = dpi(0)
theme.border_color_normal = "#000000"
theme.border_color_active = "#89dceb"
theme.border_color_marked = "#f38ba8"

-- TAGLIST 
theme.taglist_bg = theme.text
theme.taglist_bg_focus = theme.blue
theme.taglist_bg_occupied = theme.red
theme.taglist_bg_empty = theme.text

-- TITLEBAR
theme.titlebar_font = "VictorMono Nerd Font Semibold Italic 11"

-- There are other variable sets
-- overriding the default one when
-- defined, the sets are:
-- taglist_[bg|fg]_[focus|urgent|occupied|empty|volatile]
-- tasklist_[bg|fg]_[focus|urgent]
-- titlebar_[bg|fg]_[normal|focus]
-- tooltip_[font|opacity|fg_color|bg_color|border_width|border_color]
-- prompt_[fg|bg|fg_cursor|bg_cursor|font]
-- hotkeys_[bg|fg|border_width|border_color|shape|opacity|modifiers_fg|label_bg|label_fg|group_margin|font|description_font]
-- Example:
--theme.taglist_bg_focus = "#ff0000"

-- Generate taglist squares:
local taglist_square_size = dpi(4)
theme.taglist_squares_sel = theme_assets.taglist_squares_sel(
    taglist_square_size, theme.fg_normal
)
theme.taglist_squares_unsel = theme_assets.taglist_squares_unsel(
    taglist_square_size, theme.fg_normal
)

-- Variables set for theming notifications:
-- notification_font
-- notification_[bg|fg]
-- notification_[width|height|margin]
-- notification_[border_color|border_width|shape|opacity]

theme.notification_bg = theme.base
theme.notification_fg = theme.sky
theme.notification_border_width = 0
theme.notification_width = 400
theme.notification_height = 100

-- Variables set for theming the menu:
-- menu_[bg|fg]_[normal|focus]
-- menu_[border_color|border_width]
theme.menu_height = dpi(60)
theme.menu_width  = dpi(180)
theme.menu_font = theme.font
theme.menu_fg_normal = theme.text
theme.menu_border_width = 0
-- You can add as many variables as
-- you wish and access them by using
-- beautiful.variable in your rc.lua
--theme.bg_widget = "#cc0000"

-- Define the image to load
theme.titlebar_close_button_normal = gears.color.recolor_image(image_path.."circle.png", theme.red)
theme.titlebar_close_button_focus = gears.color.recolor_image(image_path.."circle.png", theme.red)

theme.titlebar_minimize_button_normal = gears.color.recolor_image(image_path.."circle.png", theme.yellow)
theme.titlebar_minimize_button_focus  = gears.color.recolor_image(image_path.."circle.png", theme.yellow)

theme.titlebar_ontop_button_normal_inactive = themes_path.."default/titlebar/ontop_normal_inactive.png"
theme.titlebar_ontop_button_focus_inactive  = themes_path.."default/titlebar/ontop_focus_inactive.png"
theme.titlebar_ontop_button_normal_active = themes_path.."default/titlebar/ontop_normal_active.png"
theme.titlebar_ontop_button_focus_active  = themes_path.."default/titlebar/ontop_focus_active.png"

theme.titlebar_sticky_button_normal_inactive = themes_path.."default/titlebar/sticky_normal_inactive.png"
theme.titlebar_sticky_button_focus_inactive  = themes_path.."default/titlebar/sticky_focus_inactive.png"
theme.titlebar_sticky_button_normal_active = themes_path.."default/titlebar/sticky_normal_active.png"
theme.titlebar_sticky_button_focus_active  = themes_path.."default/titlebar/sticky_focus_active.png"

theme.titlebar_floating_button_normal_inactive = themes_path.."default/titlebar/floating_normal_inactive.png"
theme.titlebar_floating_button_focus_inactive  = themes_path.."default/titlebar/floating_focus_inactive.png"
theme.titlebar_floating_button_normal_active = themes_path.."default/titlebar/floating_normal_active.png"
theme.titlebar_floating_button_focus_active  = themes_path.."default/titlebar/floating_focus_active.png"

theme.titlebar_maximized_button_normal_inactive = gears.color.recolor_image(image_path.."circle.png", theme.green)
theme.titlebar_maximized_button_focus_inactive  = gears.color.recolor_image(image_path.."circle.png", theme.green)
theme.titlebar_maximized_button_normal_active = gears.color.recolor_image(image_path.."circle.png", theme.green)
theme.titlebar_maximized_button_focus_active  = gears.color.recolor_image(image_path.."circle.png", theme.green)

theme.wallpaper = wallpaper

-- You can use your own layout icons like this:
theme.layout_fairh = themes_path.."default/layouts/fairhw.png"
theme.layout_fairv = themes_path.."default/layouts/fairvw.png"
theme.layout_floating  = themes_path.."default/layouts/floatingw.png"
theme.layout_magnifier = themes_path.."default/layouts/magnifierw.png"
theme.layout_max = themes_path.."default/layouts/maxw.png"
theme.layout_fullscreen = themes_path.."default/layouts/fullscreenw.png"
theme.layout_tilebottom = themes_path.."default/layouts/tilebottomw.png"
theme.layout_tileleft   = themes_path.."default/layouts/tileleftw.png"
theme.layout_tile = themes_path.."default/layouts/tilew.png"
theme.layout_tiletop = themes_path.."default/layouts/tiletopw.png"
theme.layout_spiral  = themes_path.."default/layouts/spiralw.png"
theme.layout_dwindle = themes_path.."default/layouts/dwindlew.png"
theme.layout_cornernw = themes_path.."default/layouts/cornernww.png"
theme.layout_cornerne = themes_path.."default/layouts/cornernew.png"
theme.layout_cornersw = themes_path.."default/layouts/cornersww.png"
theme.layout_cornerse = themes_path.."default/layouts/cornersew.png"

-- Generate Awesome icon:
theme.awesome_icon = theme_assets.awesome_icon(
    theme.menu_height, theme.bg_focus, theme.fg_focus
)

-- Define the icon theme for application icons. If not set then the icons
-- from /usr/share/icons and /usr/share/icons/hicolor will be used.
theme.icon_theme = nil

-- Set different colors for urgent notifications.
rnotification.connect_signal('request::rules', function()
    rnotification.append_rule {
        rule       = { urgency = 'critical' },
        properties = { bg = theme.base, fg = theme.text }
    }
end)

return theme

-- vim: filetype=lua:expandtab:shiftwidth=4:tabstop=8:softtabstop=4:textwidth=80
