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
pacman -Syyu --noconfirm 
pacman -S --noconfirm --needed git docker htop lsb-release tree
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
./Cheam/build.sh

cd base
curl -OL http://archlinuxarm.org/os/ArchLinuxARM-utilite-latest.tar.gz
docker build armv7/armhf-archlinux-cheambase base

cd ../build
docker build --file=Dockerfile.build --tag=armv7/armhf-archlinux-cheambuild .
docker run -ti -v ${PWD}/artifacts:/artifacts armv7/armhf-arch-cheambuild
docker build --file=Dockerfile.shairport -t armv7/armhf-arch-cheamshairport .
docker build --file=Dockerfile.squeezelite -t armv7/armhf-arch-cheamsqueezelight .

```

## Run Shairport/Squeezebox containers

```bash
docker run --privileged=true --net=host -d --restart='always' -e SPNAME=RPI2ARCH armv7/armhf-arch-cheamshairport
docker run --privileged=true --net=host -d --restart='always' -e SLNAME=RPI2ARCH armv7/armhf-arch-cheamsqueezelight
```

## clean up intermediate images/containers



# Build script does this

## Create base archlinux image 

https://registry.hub.docker.com/u/armv7/armhf-archlinux

```bash


curl -L http://archlinuxarm.org/os/ArchLinuxARM-utilite-latest.tar.gz | gunzip | docker import - armv7/armhf-archlinux-cheambase:latest
```

## Build AUR packages

```bash
docker build -t armv7/armhf-arch-cheambuild .
docker run -ti -v ${PWD}/artifacts:/artifacts armv7/armhf-arch-cheambuild
```

## Build Shairport-sync image
copy libsoxr pkg

```bash
docker build -t armv7/armhf-arch-cheamshairport .
```

## Build Squeezebox image
copy libsoxr and shairport sync pkg

```bash
docker build -t armv7/armhf-arch-cheamsqueezelight .
```




