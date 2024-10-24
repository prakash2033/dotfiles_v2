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
    lock = 'i3lock-fancy',
    quake = 'alacritty --title QuakeTerminal',
    screenshot = 'flameshot screen -p ~/Pictures/Screenshots',
    region_screenshot = 'flameshot gui -p ~/Pictures/Screenshots',
    delayed_screenshot = 'flameshot screen -p ~/Pictures/Screenshots -d 5000',
    browser = 'brave-browser'
  },
  -- List of apps to start once on start-up
  run_on_start_up = {
    'picom -b --experimental-backends',
    'ibus-daemon --xim --daemonize', -- Ibus daemon for keyboard
    'numlockx on', -- enable numlock
    'xfce4-power-manager',
    '/usr/lib/polkit-gnome/polkit-gnome-authentication-agent-1 & eval $(gnome-keyring-daemon -s --components=pkcs11,secrets,ssh,gpg)',
    'flameshot',
    'sxhkd',
    'geary --hidden',
    'blueman-applet',
    'nm-applet --indicator',
    'redshift-gtk -l 57.708870:11.974560 -t 6500:3600 -g 0.8 -m randr -v',
    'xfce4-clipman',
    'volumeicon',
    '/usr/bin/variety --profile ~/.config/variety/',
    '~/.config/awesome/configuration/awspawn'
  }
}
