# Cheam (This document is Work In Progress)

## Platform

* Raspberry PI2 
* Hifiberry Amp+
* Archlinux
* Docker

###Install archlinux for RPI2
http://archlinuxarm.org/platforms/armv7/broadcom/raspberry-pi-2
Boot and login as root

###Install docker and tools

```bash
pacman-db-upgrade 
pacman -Syyu --noconfirm  git docker htop lsb-release tree vim
echo "alias vi=/usr/bin/vim" > ~/.bashrc
echo '[[ -r ~/.bashrc ]] && . ~/.bashrc' > ~/.bash_profile
systemctl enable docker
mkdir /home/squeezebox
echo `hostname` > /home/squeezebox/name
```

### Setup HiFiBerry 

https://www.hifiberry.com/guides/configuring-linux-3-18-x

Enable AMP+ overlay and remove onboard sound

```bash
sed -i 's/#device_tree_overlay=hifiberry-amp/device_tree_overlay=hifiberry-amp/' /boot/config.txt
sed -i 's/snd-bcm2835//' /etc/modules-load.d/raspberrypi.conf
reboot
```

### Clone Cheam Repo, build and run containers

```bash
git clone https://github.com/teknoplop/Cheam.git
./Cheam/buildall_run_clean.sh
