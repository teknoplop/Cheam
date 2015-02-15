# Cheam

## Platform

* Raspberry PI2 
* Hifiberry DAC
* Archlinux
* Docker

## Setup plaform

Install archlinux for RPI2 onto microSD (http://archlinuxarm.org/platforms/armv7/broadcom/raspberry-pi-2)
Boot and login as root
install docker
set Hifiberry DAC overlay (https://www.hifiberry.com/guides/configuring-linux-3-18-x)
  
## Create base archlinux image 

https://registry.hub.docker.com/u/armv7/armhf-archlinux

curl -L http://archlinuxarm.org/os/ArchLinuxARM-utilite-latest.tar.gz | gunzip | docker import - armv7/armhf-archlinux-cheambase:latest

## Build AUR packages
docker build -t armv7/armhf-arch-cheambuild .
docker run -ti -v ${PWD}/artifacts:/artifacts armv7/armhf-arch-cheambuild

## Build Shairport-sync image
copy libsoxr pkg
docker build -t armv7/armhf-arch-cheamshairport .

## Build Squeezebox image
copy libsoxr and shairport sync pkg
docker build -t armv7/armhf-arch-cheamsqueezelight .

## Run Shairport/Squeezebox containers

docker run --privileged=true --net=host -d --restart='always' -e SPNAME=RPI2ARCH armv7/armhf-arch-cheamshairport
docker run --privileged=true --net=host -d --restart='always' -e SLNAME=RPI2ARCH armv7/armhf-arch-cheamsqueezelight




