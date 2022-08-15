local filesystem = require('gears.filesystem')
local with_dpi = require('beautiful').xresources.apply_dpi
local get_dpi = require('beautiful').xresources.get_dpi

return {
  -- List of apps to start by default on some actions
  default = {
    terminal = 'alacritty',
    editor = 'code',
    explorer = 'nautilus',
    rofi = 'rofi -dpi ' .. get_dpi() .. ' -width ' .. with_dpi(400) .. ' -show drun -theme ' .. filesystem.get_configuration_dir() .. '/configuration/rofi.rasi',
    lock = 'i3lock-fancy-rapid 5 3 -k --timecolor=ffffffff --datecolor=ffffffff',
    quake = 'alacritty --title QuakeTerminal',
    screenshot = 'flameshot screen -p ~/Pictures/Screenshots',
    region_screenshot = 'flameshot gui -p ~/Pictures/Screenshots',
    delayed_screenshot = 'flameshot screen -p ~/Pictures/Screenshots -d 5000',
    browser = 'brave-browser'
  },
  -- List of apps to start once on start-up
  run_on_start_up = {
    -- 'compton --config ' .. filesystem.get_configuration_dir() .. '/configuration/compton.conf',
    'xcompmgr',
    -- 'blueberry-tray', -- Bluetooth tray icon
    'xfce4-power-manager', -- Power manager
    '/usr/lib/polkit-gnome/polkit-gnome-authentication-agent-1 & eval $(gnome-keyring-daemon -s --components=pkcs11,secrets,ssh,gpg)', -- credential manager
    'setxkbmap -layout "us,se"',
    'flameshot',
    'blueman-applet',
    'nm-applet',
    'redshift-gtk -l 57.708870:11.974560 -t 6500:3400',
    'xfce4-clipman',
    'pasystray',
    'feh --bg-fill -r -z ~/Pictures/wall',
    '/usr/bin/variety'
  }
}
