#!/bin/sh

function run () {
    local cmd=$@
    if ! pgrep -x $cmd; then
        $cmd &
    fi
}

run picom --config ~/.config/awesome/apps/picom/picom_better_animations.conf
run xsetroot -cursor_name left_ptr
xinput --set-prop 'Glorious Model O' 'libinput Accel Profile Enabled' 0, 1 &
/usr/lib/polkit-gnome/polkit-gnome-authentication-agent-1 &
