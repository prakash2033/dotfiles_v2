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
    'xcompmgr',
    --'/home/pvishwa1/.screenlayout/home.sh',
    --'/usr/bin/autorandr -c --default default',
    -- '/home/pvishwa1/.screenlayout/home.sh',
    --'picom --config ' .. filesystem.get_configuration_dir() .. '/configuration/picom.conf',
    --'picom -b --experimental-backends --dbus --config ' .. filesystem.get_configuration_dir() .. '/configuration/picom.conf',
    --'compton --config ' .. filesystem.get_configuration_dir() .. '/configuration/compton.conf',
    'dropbox start -i',
    'xfce4-power-manager',
    '/usr/lib/polkit-gnome/polkit-gnome-authentication-agent-1 & eval $(gnome-keyring-daemon -s --components=pkcs11,secrets,ssh,gpg)',
    'setxkbmap -layout "us,se"',
    'flameshot',
    'geary --hidden',
    'blueman-applet',
    'nm-applet --indicator',
    --'redshift-gtk -l 57.708870:11.974560 -t 6500:3400 -g 0.8 -m randr -v',
    'redshift-gtk -l 57.708870:11.974560 -t 5700:3600 -g 0.8 -m randr -v',
    'xfce4-clipman',
    --'pasystray',
    'pnmixer',
    'feh --bg-fill -r -z ~/Pictures/wall',
    '/usr/bin/variety --profile /home/pvishwa1/.config/variety/',
    '~/.config/awesome/configuration/awspawn'
  }
}
