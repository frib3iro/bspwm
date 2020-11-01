#!/usr/bin/env bash

# variaveis e password
pass_user='123'
vermelho='\033[0;31m'
verde='\033[0;32m'
amarelo='\033[0;33m'
ciano='\033[0;36m'
fim='\033[0m'
seta='\e[32;1m-->\e[m'

# Funções ------------------------------------------------------------
gdm(){
    echo $pass_user | sudo -S pacman -S gdm --noconfirm
    echo $pass_user | sudo -S systemctl enable gdm
    echo $pass_user | sudo -S systemctl start gdm
}

bluez(){
    echo $pass_user | sudo -S systemctl status bluetooth
    echo $pass_user | sudo -S systemctl enable bluetooth
    echo $pass_user | sudo -S systemctl start bluetooth
    echo $pass_user | sudo -S systemctl enable org.cups.cupsd
}
# ---------------------------------------------------------------------

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
echo $pass_user | sudo -S pacman -S xf86-video-qxl --noconfirm
clear

# Instalando pacotes ----------------------------------------------------
echo -e "${seta} ${ciano}Instalando pacotes necessários${fim}"
sleep 2s
echo $pass_user | sudo -S pacman -S bspwm sxhkd xfce4-terminal nitrogen picom pacmanfm dmenu arch-wiki-docs arch-wiki-lite grub-customizer archlinux-wallpaper bluez bluez-utils chrome-gnome-shell cmatrix cronie cups dialog dosfstools git gimp gnupg gst-libav htop libreoffice libreoffice-fresh-pt-br lolcat man-db neofetch os-prober pass rsync speedtest-cli ufw unrar xclip xcursor-vanilla-dmz-aa xdg-user-dirs xdg-utils xf86-input-synaptics youtube-dl pulseaudio pulseaudio-bluetooth vim wget --noconfirm
clear

# Configurações iniciais
mkdir -p .config/bspwm
mkdir -p .config/sxhkd
mkdir -p .config/polybar
cp /usr/share/doc/bspwm/examples/bspwmrc .config/bspwm/
cp /usr/share/doc/bspwm/examples/sxhkdrc .config/sxhkd/

sed -i 's/urxvt/xfce4-terminal/' .config/sxhkd/sxhkdrc
sed -i 's/@space/d/' .config/sxhkd/sxhkdrc
vim .config/sxhkd/sxhkdrc

# Substitui a linha
#sed -i 's/#pt_BR ISO-8859-1/pt_BR ISO-8859-1/' /etc/locale.gen
# Substitui a linha abaixo
#echo -e "${seta} ${ciano}Substitui a linha abaixo${fim}"
#sleep 2s
#sed -i '/root ALL=(ALL) ALL/a fabio ALL=(ALL) ALL' /etc/sudoers
#clear
# Cola um texto formatado
#echo -e "${seta} ${ciano}Cola um texto formatado${fim}"
#sleep 2s
#cat >> '/etc/hosts' << EOF
#127.0.0.1   localhost.localdomain   localhost
#::1         localhost.localdomain   localhost
#127.0.1.1   archlinux.localdomain   archlinux
#EOF
#clear

# YAY -------------------------------------------------------------------
echo -e "${seta} ${ciano}Instalando o yay${fim}"
sleep 2s
git clone https://aur.archlinux.org/yay.git
cd yay
makepkg -si --noconfirm
clear

# Firmwares -------------------------------------------------------------
echo -e "${seta} ${ciano}Instalando os${fim} ${amarelo}firmwares warnigs${fim} ${ciano}do archlinux${fim}"
sleep 2s
yay -S aic94xx-firmware wd719x-firmware upd72020x-fw --noconfirm
clear

# Sardi-icons ------------------------------------------------------------
echo -e "${seta} ${ciano}Instalando o sardi-icons${fim}"
sleep 2s
yay -S sardi-icons --noconfirm
clear

# Glxinfo ----------------------------------------------------------------
echo -e "${seta} ${ciano}Instalando o glxinfo${fim}"
sleep 2s
yay -S glxinfo --noconfirm
clear

# Google-chrome ---------------------------------------------------------
echo -e "${seta} ${ciano}Instalando o google-chrome${fim}"
sleep 2s
yay -S google-chrome --noconfirm
clear

# Spotify ---------------------------------------------------------------
echo -e "${seta} ${ciano}Instalando spotify${fim}"
sleep 2s
yay -S spotify --noconfirm
clear

# Fontes ----------------------------------------------------------------
echo -e "${seta} ${ciano}Instalando as fontes${fim}"
sleep 2s
yay -S ttf-ms-fonts --noconfirm
clear

# xdg-user-dirs ---------------------------------------------------------
echo -e "${seta} ${ciano}Iniciando o xdg-update${fim}"
sleep 2s
xdg-user-dirs-update
clear

# Bluez -----------------------------------------------------------------
echo -e "${seta} ${ciano}Iniciando o bluez${fim}"
sleep 2s
bluez
clear

# GDM -------------------------------------------------------------------
echo -e "${seta} ${ciano}Instalando o gdm${fim}"
sleep 2s
gdm 
clear

