cd "$(dirname ${BASH_SOURCE[0]})"

docker build --file=build/Dockerfile.build --tag=armv7/armhf-archlinux-cheambuild build
docker run -ti -v ${PWD}/build/artifacts:/artifacts armv7/armhf-archlinux-cheambuild
