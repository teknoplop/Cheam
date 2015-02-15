cd "$(dirname ${BASH_SOURCE[0]})"

curl -o base/ArchLinuxARM-utilite-latest.tar.gz -L http://archlinuxarm.org/os/ArchLinuxARM-utilite-latest.tar.gz 
docker build -t armv7/armhf-archlinux-cheambase base
