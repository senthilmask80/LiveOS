#Outside chroot

apt-get update

apt-get install live-build

mkdir live

cd live

lb clean

lb config \

--mode debian \

--system live \

--interactive shell \

--distribution bullseye \

--debian-installer live \

--architecture amd64 \

--archive-areas "main contrib non-free" \

--security true \

--updates true \

--binary-images iso-hybrid \

--memtest memtest86+

 

find . -name "*.jpg" -exec mogrify -format png {} \;

mv pic.png desktop-grub.png

mv pic.jpg splash.jpg

#copy splash.jpg into each folder

cp /root/Pictures/splash.jpg /usr/share/live/build/bootloaders/

cp /root/Pictures/splash.jpg /usr/share/live/build/bootloaders/extlinux/

cp /root/Pictures/splash.jpg /usr/share/live/build/bootloaders/grub-legacy/

cp /root/Pictures/splash.jpg /usr/share/live/build/bootloaders/grub-pc/

cp /root/Pictures/splash.jpg /usr/share/live/build/bootloaders/isolinux/

cp /root/Pictures/splash.jpg /usr/share/live/build/bootloaders/pxelinux/

cp /root/Pictures/splash.jpg /usr/share/live/build/bootloaders/syslinux/

cp /root/Pictures/splash.jpg /usr/share/live/build/bootloaders/syslinux_common/

cp -R /usr/share/live/build/bootloaders/ /root/live/config/

chmod +x /root/live/config/

lb build

nano /etc/apt/sources.list

deb http://security.debian.org/debian-security bullseye-security main non-free

deb-src http://security.debian.org/debian-security bullseye-security main non-free

deb http://deb.debian.org/debian/ bullseye main contrib non-free non-free

deb-src http://deb.debian.org/debian/ bullseye main contrib non-free non-free

deb http://deb.debian.org/debian/ bullseye-updates main contrib non-free non-free

deb-src http://deb.debian.org/debian/ bullseye-updates main contrib non-free non-free

apt-get clean

apt-get update && apt-get upgrade && apt-get dist-upgrade -y

cp /root/Downloads/install.sh /root/live/chroot/opt/

#inside chroot install packages

apt-get install -y xorg xserver-xorg-input-evdev xserver-xorg-input-libinput xserver-xorg-input-kbd xserver-xorg-core xserver-xorg xserver-xorg-video-vesa xserver-xorg-input-all lightdm-gtk-greeter-settings figlet --no-install-recommends nano wget nautilus aptitude gpm vim ssh gdebi telnet wpasupplicant tilda binutils network-manager net-tools wpagui curl openssh-client xinit libterm-readline-gnu-perl systemd-sysv build-essential resolvconf locales software-properties-common dialog perl git apt-transport-https task-ssh-server kmod systemd tor numlockx dconf-editor openvpn samba vinagre hardinfo gparted gdebi synaptic xrdp tango-icon-theme xfce4 task-xfce-desktop mousepad open-vm-tools live-config live-build grub-pc gedit xfce4-terminal

apt-get install open-vm-tools

apt-get remove xterm

apt-get remove gnome-terminal

update-alternatives --config x-terminal-emulator

apt-get autoremove -y

aptitude -y install pip

aptitude -y install gnupg2

curl -sSL https://rvm.io/mpapis.asc | gpg2 --import -

curl -sSL https://rvm.io/pkuczynski.asc | gpg2 --import -

curl -sSL https://get.rvm.io | bash -s stable

echo progress-bar >> ~/.curlrc

echo 'export PATH=$PATH:/usr/local/rvm/bin' >> ~/.bashrc

echo '[[ -s "$HOME/.rvm/scripts/rvm" ]] && . "$HOME/.rvm/scripts/rvm"' >> ~/.bashrc

echo '[[ -s /usr/local/rvm/scripts/rvm ]] && source /usr/local/rvm/scripts/rvm' >> ~/.bashrc

source /etc/profile.d/rvm.sh

wget https://dl.google.com/go/go1.13.3.linux-amd64.tar.gz

tar -xvf go1.13.3.linux-amd64.tar.gz

mv go /usr/local

rm go1.13.3.linux-amd64.tar.gz

echo 'export GOROOT=/usr/local/go' >> ~/.bashrc

echo 'export PATH=$GOPATH/bin:$GOROOT/bin:$PATH' >> ~/.bashrc

usermod -a -G rvm root

mkdir /root/.nvm

curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.34.0/install.sh | bash

export NVM_DIR="$HOME/.nvm"

[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" # This loads nvm

[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion" # This loads nvm bash_completion

cd /opt

git clone https://github.com/s-h-3-l-l/katoolin3

cd katoolin3/

wget -q -O - https://archive.kali.org/archive-key.asc | apt-key add

nano install.sh

comment

#apt-key adv -qq --keyserver pool.sks-keyservers.net --recv-keys ED444FF07D8D0BF6 || apt-key adv -qq --keyserver hkp://pool.sks-keyservers.net:80 --recv-keys ED444FF07D8D0BF6 || die "This m>

chmod +x ./install.sh

./install.sh

touch ~/.hushlogin

katoolin3

#Install all then...

exit

cd

#Remove useless packages...

apt-get remove --purge libreoffice*

apt purge --autoremove "libreoffice*"

apt-get purge --auto-remove greenbone-security-assistant

apt-get purge --auto-remove gvm*

systemctl disable nginx.service

apt-get purge --auto-remove nginx*

apt-get purge cryptsetup

apt-get purge kismet

apt-get purge plymouth

apt-get update && apt-get upgrade && apt autoremove

apt-get autoclean

nano ~/.bashrc

figlet REDHAWK

export PATH=$PATH:/usr/local/rvm/bin

[[ -s "$HOME/.rvm/scripts/rvm" ]] && . "$HOME/.rvm/scripts/rvm"

[[ -s /usr/local/rvm/scripts/rvm ]] && source /usr/local/rvm/scripts/rvm

export GOROOT=/usr/local/go

export PATH=$GOPATH/bin:$GOROOT/bin:$PATH

export NVM_DIR="$HOME/.nvm"

[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" # This loads nvm

[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion" # This loads nvm bash_completion

nano /etc/default/useradd

SHELL=/bin/bash

adduser redhawk

passwd redhawk

usermod -aG sudo redhawk

nano /etc/sudoers

root   ALL=(ALL:ALL) ALL

redhawk ALL=(ALL:ALL) ALL

mkdir -p /home/redhawk/Desktop

mkdir -p /home/redhawk/Downloads

mkdir -p /home/redhawk/Templates

mkdir -p /home/redhawk/Public

mkdir -p /home/redhawk/Documents

mkdir -p /home/redhawk/Music

mkdir -p /home/redhawk/Pictures

mkdir -p /home/redhawk/Pictures/Wallpapers

mkdir -p /home/redhawk/Videos

#outside chroot

rm /root/live/chroot/usr/share/desktop-base/active-theme/login/background.svg

rm /root/live/chroot/usr/share/desktop-base/active-theme/login/background-nologo.svg

cp /root/Pictures/desktop-grub.png /root/live/chroot/usr/share/desktop-base/homeworld-theme/grub/grub-4x3.png

cp /root/Pictures/desktop-grub.png /root/live/chroot/usr/share/desktop-base/homeworld-theme/grub/grub-16x9.png

cp /root/Pictures/splash.png /root/live/chroot/boot/

cp /root/Pictures/desktop-grub.png /root/live/chroot/usr/share/desktop-base/

cp /root/Pictures/splash.png /root/live/chroot/home/redhawk/Pictures/Wallpapers/

cp /root/Pictures/desktop-grub.png /root/live/chroot/home/redhawk/Pictures/Wallpapers/

cp /root/Pictures/splash.png /root/live/chroot/home/redhawk/Pictures/

cp /root/Pictures/desktop-grub.png /root/live/chroot/home/redhawk/Pictures/

cp /root/Pictures/desktop-grub.png /root/live/chroot/usr/share/images/desktop-base/

cp /root/Pictures/desktop-grub.png /root/live/chroot/usr/share/images/desktop-base/splash.png

cp /root/Pictures/desktop-grub.png /root/live/chroot/usr/share/backgrounds/xfce/

cp /root/Pictures/desktop-grub.png /root/live/chroot/usr/share/desktop-base/active-theme/wallpaper/contents/images/

cp /root/Pictures/desktop-grub.png /root/live/chroot/usr/share/desktop-base/active-theme/wallpaper/

cp /root/Pictures/desktop-grub.png /root/live/chroot/usr/share/desktop-base/active-theme/lockscreen/contents/images/

cp /root/Pictures/desktop-grub.png /root/live/chroot/usr/share/desktop-base/active-theme/login/

cp /root/Pictures/desktop-grub.png /root/live/chroot/usr/share/desktop-base/active-theme/plymouth/plymouth_background_homeworld.png

cp /root/Pictures/desktop-grub.png /root/live/chroot/usr/share/desktop-base/active-theme/login/background.png

cp /root/Pictures/desktop-grub.png /root/live/chroot/usr/share/desktop-base/active-theme/login/background-nologo.png

cp /root/Pictures/grub-4x3.png /root/live/chroot/usr/share/desktop-base/homeworld-theme/grub/

cp /root/Pictures/grub-16x9.png /root/live/chroot/usr/share/desktop-base/homeworld-theme/grub/

cp /root/Pictures/desktop-grub.png /root/live/chroot/usr/share/desktop-base/homeworld-theme/lockscreen/contents/images/

cp /root/Pictures/desktop-grub.png /root/live/chroot/usr/share/desktop-base/homeworld-theme/login/background.png

cp /root/Pictures/desktop-grub.png /root/live/chroot/usr/share/desktop-base/homeworld-theme/login/background-nologo.png

cp /root/Pictures/desktop-grub.png /root/live/chroot/usr/share/desktop-base/homeworld-theme/plymouth/plymouth_background_homeworld.png

cp /root/Pictures/desktop-grub.png /root/live/chroot/usr/share/desktop-base/homeworld-theme/wallpaper/contents/images/

cp /root/Pictures/splash.png /root/live/chroot/boot/

cp /root/Pictures/desktop-grub.png /root/live/chroot/usr/share/desktop-base/

chmod +x /root/live/chroot/boot/

chmod +x -R /root/live/chroot/usr/share/desktop-base/

#inside chroot

nano /etc/skel/.bashrc

prompt_color='\[\033[;32m\]'

   info_color='\[\033[1;34m\]'

   prompt_symbol=㉿

   if [ "$EUID" -eq 0 ]; then # Change prompt colors for root user

       prompt_color='\[\033[;94m\]'

       info_color='\[\033[1;31m\]'

       prompt_symbol=💀

figlet REDHAWK

export PATH=$PATH:/usr/local/rvm/bin

[[ -s "$HOME/.rvm/scripts/rvm" ]] && . "$HOME/.rvm/scripts/rvm"

[[ -s /usr/local/rvm/scripts/rvm ]] && source /usr/local/rvm/scripts/rvm

export GOROOT=/usr/local/go

export PATH=$GOPATH/bin:$GOROOT/bin:$PATH

export NVM_DIR="$HOME/.nvm"

[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" # This loads nvm

[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion" # This loads nvm bash_completion

passwd root

New password: toor

Retype new password: toor

passwd: password updated successfully

update-alternatives --install /usr/share/images/desktop-base/desktop-background desktop-background /usr/share/images/desktop-base/desktop-grub.png 0

update-alternatives --set desktop-background /usr/share/images/desktop-base/desktop-grub.png

update-alternatives --config desktop-background

nano /etc/lightdm/lightdm-gtk-greeter.conf

[greeter]

background=/usr/share/images/desktop-base/desktop-grub.png

user-background=true

nano /etc/default/grub

GRUB_DEFAULT=0

GRUB_TIMEOUT=5

GRUB_DISTRIBUTOR="RedHawk"

GRUB_CMDLINE_LINUX_DEFAULT="quiet"

GRUB_GFXMODE=640x480

GRUB_BACKGROUND=/usr/share/images/desktop-base/splash.png

GRUB_CMDLINE_LINUX="net.ifnames=0 biosdevname=0"

rm /etc/resolv.conf

apt-get clean

rm -rf /tmp/* ~/.bash_history

history -c

exit

mv live-image-amd64.hybrid.iso redhawk.iso

md5sum redhawk.iso >> md5sum.txt

sha1sum redhawk.iso >> sha1sum.txt

sha256sum redhawk.iso >> sha256sum.txt
