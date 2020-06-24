#!/usr/bin/env bash

clear
# variaveis
azul='\e[34;1m'                                                                         
verde='\e[32;1m'
vermelho='\e[31;1m'
amarelo='\e[33;1m'
fim='\e[m'
seta='\e[32;1m-->\e[m'

echo -e "${seta} ${azul}Bem vindo a instalação e configuração do bspwm${fim}"
sleep 2s
clear

## Install packages ---------------------------------------------------------------

## Install bspwm
echo -e "${seta} ${azul}Install bspwm${fim}"
sleep 2s
sudo apt install bspwm -y
clear
## Install compton
echo -e "${seta} ${azul}Install compton${fim}"
sleep 2s
sudo apt install compton -y
clear
## Install feh
echo -e "${seta} ${azul}Install feh${fim}"
sleep 2s
sudo apt install feh -y
clear
## Install rofi
echo -e "${seta} ${azul}Install rofi${fim}"
sleep 2s
sudo apt install rofi -y
clear

## Dependencies -------------------------------------------------------------------

## Ubuntu/Debian
echo -e "${seta} ${azul}Install ubuntu dependencies${fim}"
sleep 2s
sudo apt-get install libxcb-xinerama0-dev libxcb-icccm4-dev libxcb-randr0-dev libxcb-util0-dev libxcb-ewmh-dev libxcb-keysyms1-dev libxcb-shape0-dev -y
clear

## Arch Linux
# echo "Install archlinux dependencies"
# sleep 2s
# sudo pacman -S libxcb xcb-util xcb-util-wm xcb-util-keysyms
# clear

## building and Instalaling -------------------------------------------------------

## Building and Installing
echo -e "${seta} ${azul}Building and Installing${fim}"
sleep 2s
git clone https://github.com/baskerville/bspwm.git
git clone https://github.com/baskerville/sxhkd.git
cd bspwm && make && sudo make install
cd ../sxhkd && make && sudo make install
clear

## Uninstaling --------------------------------------------------------------------

## Uninstalling
# cd bspwm && sudo make uninstall
# cd ../sxhkd && sudo make uninstall

## Running ------------------------------------------------------------------------

## Running bspwm
echo -e "${seta} ${azul}Running bspwm${fim}"
sleep 2s
mkdir -p ~/.config/{bspwm,sxhkd}
cp /usr/local/share/doc/bspwm/examples/bspwmrc ~/.config/bspwm/
cp /usr/local/share/doc/bspwm/examples/sxhkdrc ~/.config/sxhkd/
chmod u+x ~/.config/bspwm/bspwmrc
clear

## To start bspwm at login add exec bspwm to the bottom of your ~/.xinitrc or ~/.xprofile (depending on how your launch your X/Display manager). The example bspwmrc launches sxhkd for you.
echo -e "${seta} ${azul}To start bspwm at login${fim}"
sleep 2s
echo "sxhkd &" >> ~/.xinitrc
echo "exec bspwm" >> ~/.xinitrc
clear

## config -------------------------------------------------------------------------
echo -e "${seta} ${azul}Config bspwmrc${fim}"
sleep 2s
sed -i '/sxhkd &/a wmname LG3D &' ~/.bspwmrc
sed -i '/wmname LG3D &/a bspc config pointer_modifier mod1' ~/.bspwmrc
clear
## --------------------------------------------------------------------------------
echo -e "${seta} ${azul}Config sxhkdrc${fim}"
sleep 2s
sed -i 's/urxvt/xfce4-terminal' ~/.config/sxhkd/sxhkdrc
sed -i '/@space/d' ~/.config/sxhkd/sxhkdrc
sed -i 's/dmenu-run/rofi -show run' ~/.config/sxhkd/sxhkdrc
sed -i 's/{h,j,k,l}/{Left,Down,Up,Right}/' ~/.config/sxhkd/sxhkdrc
clear
##---------------------------------------------------------------------------------

