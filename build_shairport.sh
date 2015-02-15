cd "$(dirname ${BASH_SOURCE[0]})"

docker build --file=build/Dockerfile.shairport --tag=armv7/armhf-archlinux-cheamshairport build

