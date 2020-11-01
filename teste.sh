#!/usr/bin/env bash

# variaveis e password
pass_user='123'
vermelho='\033[0;31m'
verde='\033[0;32m'
amarelo='\033[0;33m'
ciano='\033[0;36m'
fim='\033[0m'
seta='\e[32;1m-->\e[m'

# Tela de boas vindas
clear
echo -e "${seta} ${ciano}Bem vindo a instalação do bspwm${fim}"
sleep 2s
clear

# Atualizando os pacotes
echo -e "${seta} ${ciano}Atualizando os pacotes...${fim}"
sleep 2s
echo $pass_user | sudo -S pacman -Syu --noconfirm
clear

echo -e "${seta} ${ciano}Instalando o driver de vídeo virt-manager${fim}"
sleep 2s
echo $pass_user | sudo -S pacman -S --noconfirm
clear

# Instalando pacotes ----------------------------------------------------
echo -e "${seta} ${ciano}Instalando pacotes necessários${fim}"
sleep 2s
echo $pass_user | sudo -S pacman -S xf86-video-qxl xorg xorg-xinit bspwm sxhkd xfce4-terminal nitrogen picom pacmanfm dmenu archlinux-wallpaper chromium --noconfirm
clear

# Configurações iniciais
mkdir -p .config/bspwm
mkdir -p .config/sxhkd
mkdir -p .config/polybar
#cp /usr/share/doc/bspwm/examples/bspwmrc .config/bspwm/
#cp /usr/share/doc/bspwm/examples/sxhkdrc .config/sxhkd/

