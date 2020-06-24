#!/usr/bin/env bash

## Install bspwm
echo "Install bspwm"
sleep 2s
sudo apt install bspwm -y
clear
## Install compton
echo "Install compton"
sleep 2s
sudo apt install compton -y
clear
## Install feh
echo "Install feh"
sleep 2s
sudo apt install feh -y
clear
## Install rofi
echo "Install rofi"
sleep 2s
sudo apt install rofi -y
clear

## Dependencies

## Ubuntu/Debian
echo "Install ubuntu dependencies"
sleep 2s
sudo apt-get install libxcb-xinerama0-dev libxcb-icccm4-dev libxcb-randr0-dev libxcb-util0-dev libxcb-ewmh-dev libxcb-keysyms1-dev libxcb-shape0-dev
clear

## Arch Linux
# echo "Install archlinux dependencies"
# sleep 2s
# sudo pacman -S libxcb xcb-util xcb-util-wm xcb-util-keysyms
# clear

## Building and Installing
echo "Building and Installing"
sleep 2s
git clone https://github.com/baskerville/bspwm.git
git clone https://github.com/baskerville/sxhkd.git
cd bspwm && make && sudo make install
cd ../sxhkd && make && sudo make install
clear

## Uninstalling
# cd bspwm && sudo make uninstall
# cd ../sxhkd && sudo make uninstall

## Running bspwm
echo "Running bspwm"
sleep 2s
mkdir -p ~/.config/{bspwm,sxhkd}
cp /usr/local/share/doc/bspwm/examples/bspwmrc ~/.config/bspwm/
cp /usr/local/share/doc/bspwm/examples/sxhkdrc ~/.config/sxhkd/
chmod u+x ~/.config/bspwm/bspwmrc
clear

## To start bspwm at login add exec bspwm to the bottom of your ~/.xinitrc or ~/.xprofile (depending on how your launch your X/Display manager). The example bspwmrc launches sxhkd for you.
echo ""
sleep 2s
echo "sxhkd &" >> ~/.xinitrc
echo "exec bspwm" >> ~/.xinitrc
clear

## config ------------------------------------------------------------
echo "Config bspwmrc"
sleep 2s
sed -i '/sxhkd &/a wmname LG3D &' ~/.bspwmrc
sed -i '/wmname LG3D &/a bspc config pointer_modifier mod1' ~/.bspwmrc
clear
## -------------------------------------------------------------------
echo "Config sxhkdrc"
sleep 2s
sed -i 's/urxvt/xfce4-terminal' ~/.config/sxhkd/sxhkdrc
sed -i '/@space/d' ~/.config/sxhkd/sxhkdrc
sed -i 's/dmenu-run/rofi -show run' ~/.config/sxhkd/sxhkdrc
? sed -i 's/{h,j,k,l}/{Left,Down,Up,Right}/' ~/.config/sxhkd/sxhkdrc
clear
##--------------------------------------------------------------------

