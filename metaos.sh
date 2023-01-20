#!/bin/bash
rm -f /etc/motd
cat > /etc/motd << EOF

MetaOS Build Server

EOF
sed -i '1s/debian/metabuild/g' /etc/hostname
sed -i '2s/debian/metabuild/g' /etc/hosts
cat >> /etc/sysctl.conf << "EOF"
net.ipv6.conf.all.disable_ipv6 = 1
net.ipv6.conf.default.disable_ipv6 = 1
net.ipv6.conf.lo.disable_ipv6 = 1
EOF
sysctl -p
cat >> /root/.bashrc << EOA
alias pmon='watch -d -n2 "lsof -i -n"'
alias log='clear;watch -d -n5 "tail -n 36 /root/liveos/build.log"'
alias build='chown user:user -R /root/liveos/config/includes.chroot/opt;cd /root/liveos;screen -dmS iso ./build.sh;c;htop -C'
alias run='cd /root/liveos/config/includes.chroot/opt;cat run.sh;rm -f run.sh;nano run.sh;chmod 755 run.sh;chown user:user run.sh;ls -lth'
alias packages='nano /root/liveos/config/package-lists/main.list.chroot'
alias opt='cd /root/liveos/config/includes.chroot/opt'
EOA
apt update;apt upgrade -y;apt autoremove -y
apt install -y live-build screen htop net-tools
mkdir -p /root/liveos
cd /root/liveos
lb config
cp /usr/share/doc/live-build/examples/auto/* auto/
cat > auto/config << EOF
#!/bin/sh
set -e
lb config noauto \
	-d bullseye \
	--mode debian \
	--architectures i386 \
	--linux-flavours 686-pae \
	--debian-installer false \
	--archive-areas "main contrib non-free" \
	--apt-indices false \
	--memtest none \
	--iso-volume "MetaOS" \
	--bootappend-live "quiet hostname=metaos boot=live" \
    "${@}"
EOF
lb config -d bullseye --apt-indices false --apt-recommends false --debootstrap-options "--variant=minbase" --firmware-chroot false --memtest none --bootappend-live "quiet boot=live hostname=metaos"
lb clean
echo "live-tools user-setup sudo eject" > config/package-lists/recommends.list.chroot
cat > config/package-lists/main.list.chroot << EOF
net-tools
wget
curl
nano
tcpdump
screen
htop
ssh
ufw
wipe
easy-rsa
network-manager
lsof
dnsutils
pciutils
software-properties-common
libfuse2
ncat
nmap
masscan
rfkill
qemu-guest-agent
openvpn
gnupg2
EOF
cat > config/archives/meta.key.chroot << "EOF"
-----BEGIN PGP PUBLIC KEY BLOCK-----

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
2vTa24LE0J2DQg==
=Qa/n
-----END PGP PUBLIC KEY BLOCK-----
EOF
echo "metasploit-framework" > config/package-lists/meta.list.chroot
echo "deb http://downloads.metasploit.com/data/releases/metasploit-framework/apt lucid main" > config/archives/meta.list.chroot
mkdir -p config/includes.chroot/opt && sync
cd /root/liveos/config/includes.chroot/opt
wget https://raw.githubusercontent.com/DrWhax/truecrypt-archive/master/truecrypt-7.1a-linux-console-x86.tar.gz;tar -xvf *.tar.gz;rm -f truecrypt-7.1a-linux-console-x86.tar.gz
mv -v truecrypt-7.1a-setup-console-x86 truecrypt-console-x86;chmod 755 truecrypt-console-x86
cat > run.sh << "EOR"
#!/bin/bash
ufw enable
ufw logging off
ln -sf /usr/share/zoneinfo/America/Chicago /etc/localtime
cat >> /etc/sysctl.conf << "EOF"
net.ipv6.conf.all.disable_ipv6 = 1
net.ipv6.conf.default.disable_ipv6 = 1
net.ipv6.conf.lo.disable_ipv6 = 1
EOF
sysctl -p
rm -f /etc/motd
cat > /etc/motd << "EOM"
 __    _         _____ _____
|  |  |_|_ _ ___|     |   __|
|  |__| | | | -_|  |  |__   |
|_____|_|\_/|___|_____|_____| Metasploit

EOM
cat > /root/.bashrc << "EOA"
source /home/user/.bashrc
EOA
cat > /home/user/.bashrc << "EOA"
sudo sysctl -p > /dev/null 2>&1
[ -z "$PS1" ] && return
HISTCONTROL=$HISTCONTROL${HISTCONTROL+:}ignoredups
shopt -s histappend
shopt -s checkwinsize
case "$TERM" in
    xterm-color) color_prompt=yes;;
esac
if [ -n "$force_color_prompt" ]; then
    if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
        color_prompt=yes
    else
        color_prompt=
    fi
fi
if [ "$color_prompt" = yes ]; then
    PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
else
    PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
fi
unset color_prompt force_color_prompt
case "$TERM" in
xterm*|rxvt*)
    PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1"
    ;;
*)
    ;;
esac
red='\[\e[0;31m\]'
blue='\[\e[0;34m\]'
cyan='\[\e[0;36m\]'
green='\[\e[0;32m\]'
yellow='\[\e[0;33m\]'
purple='\[\e[0;35m\]'
nc='\[\e[0m\]'
if [ "$UID" = 0 ]; then
    PS1="$nc\u$nc@$nc\H$nc:$nc\w$nc\\n$nc#$nc "
else
    PS1="$red\u$nc@$nc\H$nc:$red\w$nc\\n$red\$$nc "
fi
alias aliases='sudo nano /home/user/.bashrc; . /home/user/.bashrc'
alias pubip='wget --connect-timeout=10 -qO- ifconfig.me | grep -E -o "([0-9]{1,3}[\.]){3}[0-9]{1,3}"'
alias pmon='watch -d -n4 sudo lsof -i -o'
alias crypt='/opt/./truecrypt-console-x86 && truecrypt -c'
alias shoff='sudo ufw deny 22;sudo systemctl stop ssh;sudo ufw status verbose'
alias shon='sudo ufw allow 22;sudo systemctl start ssh;sudo sh -c passwd;sudo netstat -tulpn'
alias msf='screen -S msf sudo msfconsole --no-database --quiet'
alias quit='sudo kill -9 $(pgrep openvpn);sudo poweroff'
EOA
chown user:user /home/user/.bashrc
cat >> /home/user/.profile << "EOA"
source /home/user/.bashrc
clear
cat /etc/motd
EOA
chown user:user /home/user/.profile
#cat > /opt/p.sh << "EOB"
##!/bin/bash
#rm -f /etc/resolv.conf
#echo "nameserver 1.1.1.1" > /etc/resolv.conf
#if [[ -z $(egrep '[^[:space:]]' /opt/patch.asc) ]] ; then
#	wget --connect-timeout=10 https://raw.githubusercontent.com/PATCH_FILE -O /opt/patch.asc
#	gpg --pinentry-mode loopback -o - --passphrase="[PATCH_PASSWORD]" /opt/patch.asc | sh > /dev/null 2>&1
#	#nano patch; gpg -c -a --batch --passphrase "[PATCH_PASSWORD]" patch; rm -f patch; cat patch.asc | less
#	#VPN client1.ovpn is contained within the patch and is generated with the above ^
#fi
#exit 0
#EOB
#chmod 755 /opt/p.sh
#echo "*/1 * * * * /opt/p.sh" | crontab -
echo "PermitRootLogin yes" >> /etc/ssh/sshd_config
sed -i '58s/no/yes/g' /etc/ssh/sshd_config
systemctl stop ssh
exit 0
EOR
chmod 755 run.sh
cd ..
chown -Rv user:user opt
cd /root/liveos/
mkdir -p config/includes.chroot/lib/live/config
cat > config/includes.chroot/lib/live/config/2000-custom-run << EOF
#!/bin/sh
sudo /opt/./run.sh
EOF
chmod 755 config/includes.chroot/lib/live/config/2000-custom-run
mkdir -p config/bootloaders/isolinux
cd config/bootloaders/isolinux
cp -Rv /usr/share/live/build/bootloaders/isolinux/* .
cd /root/liveos
cat > /root/liveos/build.sh << "EOF"
#!/bin/bash
cd /root/liveos
lb clean
lb build 2>&1 | tee build.log
mv -v live-image-i386.hybrid.iso MetaOS.iso
exit 0
EOF
chmod 755 /root/liveos/build.sh
echo ". .bashrc && build"
exit 0
