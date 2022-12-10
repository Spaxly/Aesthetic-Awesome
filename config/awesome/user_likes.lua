APPS_PATH = "~/.config/awesome/apps/"
THEME_DIR = "~/.config/awesome/themes/"

modkey = "Mod4"

terminal = "alacritty --config-file " .. APPS_PATH .. "alacritty/alacritty.yml"
browser = "firefox"
powermenu = "rofi -show p -modi p:rofi-power-menu -theme " .. APPS_PATH .."rofi/themes/style-1.rasi"
file_manager = "thunar"
screenshot_tool = "flameshot gui"
rofi = "rofi -show drun -theme " .. APPS_PATH .. "rofi/themes/style-1.rasi"
editor = "nvim"
editor_cmd = terminal .. " -e " .. editor
theme = THEME_DIR .. "theme.lua"
wallpaper = "~/.config/awesome/wallpapers/clouds.png"
theme_changer = "~/.config/awesome/scripts/theme-changer.sh"
