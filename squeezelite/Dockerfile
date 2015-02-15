# Set base image
FROM armv7/armhf-archlinux-cheambase:latest

# Update pacman and install packages
RUN pacman-db-upgrade
RUN pacman -Syyu --noconfirm
RUN pacman -S --noconfirm --needed alsa-utils  

COPY squeezelite-git/squeezelite-git-1.8.r0.g8b8dfe6-1-armv7h.pkg.tar.xz /root/squeezelite-git-1.8.r0.g8b8dfe6-1-armv7h.pkg.tar.xz

RUN pacman -U --noconfirm /root/squeezelite-git-1.8.r0.g8b8dfe6-1-armv7h.pkg.tar.xz

CMD /usr/sbin/squeezelite -n $SLNAME
