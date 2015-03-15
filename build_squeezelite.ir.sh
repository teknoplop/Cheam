cd "$(dirname ${BASH_SOURCE[0]})"

docker build --file=build/Dockerfile.squeezelite.ir --tag=armv7/armhf-archlinux-cheamsqueezeliteir build
