cd "$(dirname ${BASH_SOURCE[0]})"

docker build --file=build/Dockerfile.squeezelite --tag=armv7/armhf-archlinux-cheamsqueezelite build
