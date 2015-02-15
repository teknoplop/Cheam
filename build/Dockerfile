# Set base image
FROM armv7/armhf-archlinux:latest

# Update pacman and install packages
RUN pacman-db-upgrade
RUN pacman -Syyu --noconfirm
RUN pacman -S --noconfirm --needed git base-devel cmake alsa-lib libdaemon openssl avahi popt unzip

RUN useradd build
RUN mkdir /home/build
RUN chown 1000:1000 /home/build
RUN curl -L -o /home/build/libsoxr.tgz https://aur.archlinux.org/packages/li/libsoxr/libso
xr.tar.gz
RUN curl -L -o /home/build/shairport-sync.zip https://github.com/EliaCereda/shairport-sync
-PKGBUILD/archive/master.zip

USER build
RUN tar -zxf /home/build/libsoxr.tgz -C /home/build

WORKDIR /home/build/libsoxr
RUN makepkg

USER root
RUN pacman -U --needed --noconfirm /home/build/libsoxr/libsoxr-0.1.1-2-armv7h.pkg.tar.xz

USER build
WORKDIR /home/build/
RUN unzip shairport-sync.zip

WORKDIR /home/build/shairport-sync-PKGBUILD-master
RUN makepkg


USER root
CMD cp -t /artifacts /home/build/libsoxr/libsoxr-0.1.1-2-armv7h.pkg.tar.xz /home/build/sha
irport-sync-PKGBUILD-master/shairport-sync-git-2.2.1.r0.g4fb4ec4-1-armv7h.pkg.tar.xz 

~
