FROM scratch

ADD ArchLinuxARM-utilite-latest.tar.gz /


# Update pacman and install packages
RUN pacman-db-upgrade
RUN pacman -Syyu --noconfirm tree htop lsb-release

CMD ["/bin/bash"]
