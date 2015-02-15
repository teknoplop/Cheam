#
# Shairport-sync for archlinux
# uses supervisord like https://github.com/jonathanhickford/docker-ubuntu-shairport-sync
#

# Set base image
FROM armv7/armhf-archlinux-cheambase:latest

# Update pacman and install packages
RUN pacman-db-upgrade
RUN pacman -Syy --noconfirm 
RUN pacman -S --noconfirm --needed alsa-utils libdaemon avahi nss-mdns supervisor

COPY libsoxr/libsoxr-0.1.1-2-armv7h.pkg.tar.xz /root/libsoxr-0.1.1-2-armv7h.pkg.tar.xz
COPY shairport-sync-PKGBUILD-master/shairport-sync-git-2.2.1.r0.g4fb4ec4-1-armv7h.pkg.tar.xz /root/shairport-sync-git-2.2.1.r0.g4fb4ec4-1-armv7h.pkg.tar.xz

RUN pacman -U --noconfirm /root/libsoxr-0.1.1-2-armv7h.pkg.tar.xz
RUN pacman -U --noconfirm /root/shairport-sync-git-2.2.1.r0.g4fb4ec4-1-armv7h.pkg.tar.xz

# dbus
RUN mkdir /run/dbus

COPY supervisord.conf /etc/supervisor.d/shairport.ini

CMD ["/usr/bin/supervisord"]
