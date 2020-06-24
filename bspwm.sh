#!/usr/bin/env bash

## Dependencies

## Ubuntu/Debian
sudo apt-get install libxcb-xinerama0-dev libxcb-icccm4-dev libxcb-randr0-dev libxcb-util0-dev libxcb-ewmh-dev libxcb-keysyms1-dev libxcb-shape0-dev

## Arch Linux
sudo pacman -S libxcb xcb-util xcb-util-wm xcb-util-keysyms

## Building and Installing
git clone https://github.com/baskerville/bspwm.git
git clone https://github.com/baskerville/sxhkd.git
cd bspwm && make && sudo make install
cd ../sxhkd && make && sudo make install

## Uninstalling
cd bspwm && sudo make uninstall
cd ../sxhkd && sudo make uninstall

## Running bspwm
mkdir -p ~/.config/{bspwm,sxhkd}
cp /usr/local/share/doc/bspwm/examples/bspwmrc ~/.config/bspwm/
cp /usr/local/share/doc/bspwm/examples/sxhkdrc ~/.config/sxhkd/
chmod u+x ~/.config/bspwm/bspwmrc

## To start bspwm at login add exec bspwm to the bottom of your ~/.xinitrc or ~/.xprofile (depending on how your launch your X/Display manager). The example bspwmrc launches sxhkd for you.
echo "sxhkd &" >> ~/.xinitrc
echo "exec bspwm" >> ~/.xinitrc

## config ------------------------------------------------------------
sed -i '/sxhkd &/a wmname LG3D &' ~/.bspwmrc
sed -i '/wmname LG3D &/a bspc config pointer_modifier mod1' ~/.bspwmrc
## -------------------------------------------------------------------
sed -i 's/urxvt/xfce4-terminal' ~/.config/sxhkd/sxhkdrc
sed -i '/@space/d' ~/.config/sxhkd/sxhkdrc
sed -i 's/dmenu-run/rofi -show run' ~/.config/sxhkd/sxhkdrc
? sed -i 's/{h,j,k,l}/{Left,Down,Up,Right}/' ~/.config/sxhkd/sxhkdrc
##--------------------------------------------------------------------

## Install compton
sudo apt install compton -y
## Install feh
sudo apt install feh -y
## Install rofi
sudo apt install rofi -y



