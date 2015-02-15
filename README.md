# Cheam

Platform H/W:
  Raspberry PI2 
  Hifiberry DAC

Platform S/W:
  Archlinux
  Docker

Setup plaform:
  Install archlinux for RPI2 onto microSD (http://archlinuxarm.org/platforms/armv7/broadcom/raspberry-pi-2)
  Boot and login as root
  install docker
  set Hifiberry DAC overlay (https://www.hifiberry.com/guides/configuring-linux-3-18-x)
  
Create base archlinux image (https://registry.hub.docker.com/u/armv7/armhf-archlinux/)

curl -L http://archlinuxarm.org/os/ArchLinuxARM-utilite-latest.tar.gz | gunzip | docker import - armv7/armhf-archlinux-cheambase:latest

Build AUR packages


Build Shairport-sync image


Build Squeezebox image


Run Shairport/Squeezebox containers






