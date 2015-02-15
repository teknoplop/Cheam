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
pacman -Syyu --noconfirm  git docker htop lsb-release tree
systemctl enable docker
```

### set Hifiberry DAC overlay (https://www.hifiberry.com/guides/configuring-linux-3-18-x)

```bash
sed -i 's/#device_tree_overlay=hifiberry-amp/device_tree_overlay=hifiberry-amp/' config.txt
reboot
```

### Clone Cheam Repo, build and run containers

```bash
git clone https://github.com/teknoplop/Cheam.git
./Cheam/buildall_run_clean.sh
