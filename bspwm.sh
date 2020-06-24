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

## instalando pacotes ---------------------------------------------------------------

## instalando build-essential
echo -e "${seta} ${azul}build-essential${fim}"
sleep 2s
sudo apt install gcc make -y
sudo apt install build-essential -y
clear

## instalando bspwm
echo -e "${seta} ${azul}instalando bspwm${fim}"
sleep 2s
sudo apt install bspwm -y
clear
## instalando compton
echo -e "${seta} ${azul}instalando compton${fim}"
sleep 2s
sudo apt install compton -y
clear
## instalando feh
echo -e "${seta} ${azul}instalando feh${fim}"
sleep 2s
sudo apt install feh -y
clear
## instalando rofi
echo -e "${seta} ${azul}instalando rofi${fim}"
sleep 2s
sudo apt install rofi -y
clear

## Dependências -------------------------------------------------------------------

## Dependências Ubuntu/Debian
echo -e "${seta} ${azul}instalando ubuntu dependencies${fim}"
sleep 2s
sudo apt install libxcb-xinerama0-dev libxcb-icccm4-dev libxcb-randr0-dev libxcb-util0-dev libxcb-ewmh-dev libxcb-keysyms1-dev libxcb-shape0-dev -y
echo -e "${seta} ${azul}Aperte enter para continuar${fim}"
read
clear

## Arch Linux
# echo "instalando archlinux dependencias"
# sleep 2s
# sudo pacman -S libxcb xcb-util xcb-util-wm xcb-util-keysyms
# clear

## Baixando e instalando 
echo -e "${seta} ${azul}Building and instalandoing${fim}"
sleep 2s
git clone https://github.com/baskerville/bspwm.git
git clone https://github.com/baskerville/sxhkd.git
cd bspwm && make && sudo make install
cd ../sxhkd && make && sudo make install
echo -e "${seta} ${azul}Aperte enter para continuar${fim}"
read
clear

## Rodando ------------------------------------------------------------------------

## Rodando bspwm
echo -e "${seta} ${azul}Rodando o bspwm${fim}"
sleep 2s
mkdir -p ~/.config/{bspwm,sxhkd}
cp /usr/local/share/doc/bspwm/examples/bspwmrc ~/.config/bspwm/
cp /usr/local/share/doc/bspwm/examples/sxhkdrc ~/.config/sxhkd/
chmod u+x ~/.config/bspwm/bspwmrc
echo -e "${seta} ${azul}Aperte enter para continuar${fim}"
read
clear

## Iniciando o bspwm no login
echo -e "${seta} ${azul}Iniciando o bspwm no login${fim}"
sleep 2s
echo "sxhkd &" >> ~/.xinitrc
echo "exec bspwm" >> ~/.xinitrc
echo -e "${seta} ${azul}Aperte enter para continuar${fim}"
read
clear

## configuração --------------------------------------------------------------------
echo -e "${seta} ${azul}Configurando o bspwmrc${fim}"
sleep 2s
sed -i '/sxhkd &/a wmname LG3D &' ~/.bspwmrc
sed -i '/wmname LG3D &/a bspc config pointer_modifier mod1' ~/.bspwmrc
echo -e "${seta} ${azul}Aperte enter para continuar${fim}"
read
clear
## --------------------------------------------------------------------------------
echo -e "${seta} ${azul}Configurando o sxhkdrc${fim}"
sleep 2s
sed -i 's/urxvt/xfce4-terminal' ~/.config/sxhkd/sxhkdrc
sed -i '/@space/d' ~/.config/sxhkd/sxhkdrc
sed -i 's/dmenu-run/rofi -show run' ~/.config/sxhkd/sxhkdrc
sed -i 's/{h,j,k,l}/{Left,Down,Up,Right}/' ~/.config/sxhkd/sxhkdrc
echo -e "${seta} ${azul}Aperte enter para continuar${fim}"
read
clear
##---------------------------------------------------------------------------------

