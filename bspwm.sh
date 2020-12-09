#!/usr/bin/env bash
#----------------------------------------------------------------------
# Script : [bspwm.sh]
# Descrição :
# Versão : 0.1
# Autor : Fabio Junior Ribeiro <rib3iro@live.com>
# Data : 08/12/2020
# Licença : GNU/GPL v3.0
#----------------------------------------------------------------------
# Uso :
#----------------------------------------------------------------------
clear

# variaveis e password
pass_user='123'
vermelho='\033[0;31m'
verde='\033[0;32m'
amarelo='\033[0;33m'
ciano='\033[0;36m'
fim='\033[0m'
seta='\e[32;1m-->\e[m'
# --------------------------------------------------------------------

# Tela de boas vindas
echo -e "${seta} ${ciano}Bem vindo a instalação do bspwm${fim}"
sleep 2s
clear


echo -e "${seta} ${ciano}Instalando o driver da nvidia${fim}"
sleep 3s
echo $pass_user | sudo -S pacman -S nvidia nvidia-utils intel-ucode --noconfirm
clear

# Atualizando os espelhos
echo -e "${seta} ${ciano}Atualizando...${fim}"
sleep 2s
echo $pass_user | sudo -S pacman -Syu --noconfirm
clear

# Instalando pacotes ----------------------------------------------------
echo -e "${seta} ${ciano}Instalando pacotes necessários${fim}"
sleep 2s
echo $pass_user | sudo -S pacman -S arch-wiki-docs arch-wiki-lite alsa-utils dconf-editor grub-customizer archlinux-keyring archlinux-wallpaper bash-completion bluez bluez-utils chrome-gnome-shell cmatrix cronie cups dialog dosfstools efibootmgr git gedit gimp gnome-tweaks gnupg gst-libav gufw htop libreoffice libreoffice-fresh-pt-br lolcat man-db man-pages-pt_br mtools neofetch os-prober pass rsync speedtest-cli totem ufw unrar xclip xcursor-vanilla-dmz-aa xdg-user-dirs xdg-utils youtube-dl pulseaudio pulseaudio-bluetooth bspwm sxhkd xfce4-terminal nitrogen picom lightdm lightdm-gtk-greeter dmenu nautilus --noconfirm
clear

# Fontes ----------------------------------------------------------------
echo -e "${seta} ${ciano}Instalando as fontes${fim}"
sleep 2s
echo $pass_user | sudo -S pacman -S ttf-jetbrains-mono ttf-dejavu ttf-hack --noconfirm
clear

# YAY -------------------------------------------------------------------
echo -e "${seta} ${ciano}Instalando o yay${fim}"
sleep 2s
git clone https://aur.archlinux.org/yay.git
cd yay
makepkg -si --noconfirm
clear

# Mintstick ---------------------------------------------------------------
echo -e "${seta} ${ciano}Instalando o Mintstick${fim}"
sleep 2s
yay -S mintstick --noconfirm
clear

# Downgrade---------------------------------------------------------------
echo -e "${seta} ${ciano}Instalando o downgrade${fim}"
sleep 2s
yay -S downgrade --noconfirm
clear

# Virt-manager ----------------------------------------------------------
echo -e "${seta} ${ciano}Instalando o virt-manager${fim}"
sleep 2s
echo $pass_user | sudo -S pacman -S qemu virt-manager dnsmasq libvirt ebtables bridge-utils ovmf spice-vdagent --noconfirm
clear

echo -e "${seta} ${ciano}Iniciando o daemon libvirt${fim}"
sleep 2s
echo $pass_user | sudo -S systemctl enable libvirtd.service
echo $pass_user | sudo -S systemctl start libvirtd.service
clear

echo -e "${seta} ${ciano}Inserindo o usuário no grupo libvirt${fim}"
sleep 2s
echo $pass_user | sudo -S usermod -aG libvirt $user
clear

echo -e "${seta} ${ciano}Configurando a network do virt-manager para iniciar automáticamente${fim}"
sleep 2s
echo $pass_user | sudo -S virsh net-autostart --network default
clear

# Timeshift ------------------------------------------------------------
echo -e "${seta} ${ciano}Instalando o timeshift${fim}"
sleep 2s
yay -S timeshift --noconfirm
clear

# lollypop-stable-git --------------------------------------------------
echo -e "${seta} ${ciano}Instalando o lollypop-stable-git${fim}"
sleep 2s
yay -S lollypop-stable-git kid3-cli --noconfirm
clear

# Hackerman ------------------------------------------------------------
echo -e "${seta} ${ciano}Instalando aircrack-ng e usbutils${fim}"
sleep 2s
echo $pass_user | sudo -S pacman -S aircrack-ng usbutils tcpdump --noconfirm
clear

echo -e "${seta} ${ciano}Instalando o crunch${fim}"
sleep 2s
yay -S crunch --noconfirm
clear

# Firmwares -------------------------------------------------------------
echo -e "${seta} ${ciano}Instalando os${fim} ${amarelo}firmwares warnigs${fim} ${ciano}do archlinux${fim}"
sleep 2s
yay -S aic94xx-firmware wd719x-firmware upd72020x-fw --noconfirm
clear

# Cava -------------------------------------------------------------------
echo -e "${seta} ${ciano}Instalando o cava${fim}"
sleep 2s
yay -S cava --noconfirm
clear

# Sardi-icons ------------------------------------------------------------
echo -e "${seta} ${ciano}Instalando o sardi-icons${fim}"
sleep 2s
yay -S sardi-icons --noconfirm
clear

# Ant-dracula-theme-git ------------------------------------------------------------
echo -e "${seta} ${ciano}Instalando o ant-dracula-theme-git${fim}"
sleep 2s
yay -S ant-dracula-theme-git --noconfirm
clear

# Debtap ----------------------------------------------------------------
echo -e "${seta} ${ciano}Instalando o debtap${fim}"
sleep 2s
yay -S debtap --noconfirm
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
yay -S ttf-roboto --noconfirm
yay -S ttf-ubuntu-font-family --noconfirm
clear

# xdg-user-dirs ---------------------------------------------------------
echo -e "${seta} ${ciano}Iniciando o xdg-update${fim}"
sleep 2s
xdg-user-dirs-update
clear

echo -e "${seta} ${ciano}Configurando o bspwm${fim}"
mkdir -p ~/.config/{bspwm,sxhkd,polybar}
cp /usr/share/doc/bspwm/examples/bspwmrc ~/.config/bspwm
cp /usr/share/doc/bspwm/examples/sxhkdrc ~/.config/sxhkd
sed -i 's/urxvt/xfce4-terminal/' .config/sxhkd/sxhkdrc
sed -i 's/super + @space/super + d/' .config/sxhkd/sxhkdrc

echo -e "${seta} ${ciano}Iniciando o bluez${fim}"
sleep 2s
echo $pass_user | sudo -S systemctl status bluetooth
echo $pass_user | sudo -S systemctl enable bluetooth
echo $pass_user | sudo -S systemctl start bluetooth
echo $pass_user | sudo -S systemctl enable org.cups.cupsd
clear

echo -e "${seta} ${ciano}Iniciando o lightdm${fim}"
sleep 2s
echo $pass_user | sudo -S systemctl enable lightdm
clear
