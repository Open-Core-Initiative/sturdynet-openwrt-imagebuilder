# OpenWrt Image Builder Docker Image

[![pipeline status](https://gitlab.com/rychly-edu/docker/docker-openwrt-imagebuilder/badges/master/pipeline.svg)](https://gitlab.com/rychly-edu/docker/docker-openwrt-imagebuilder/commits/master)
[![coverage report](https://gitlab.com/rychly-edu/docker/docker-openwrt-imagebuilder/badges/master/coverage.svg)](https://gitlab.com/rychly-edu/docker/docker-openwrt-imagebuilder/commits/master)

## Run

~~~sh
docker pull registry.gitlab.com/rychly-edu/docker/docker-openwrt-imagebuilder:latest
docker run -it --rm registry.gitlab.com/rychly-edu/docker/docker-openwrt-imagebuilder:latest
~~~

### Usage

~~~sh
cd ${IMAGEBUILDER_HOME}
GOAL=manifest
#GOAL=image
make ${GOAL} BIN_DIR=/openwrt-images/bin FILES=/openwrt-images/root PROFILE=tl-wdr3600-v1 \
PACKAGES="-dnsmasq -odhcpd-ipv6only unbound odhcpd \
 kmod-usb-storage kmod-fs-ext4 e2fsprogs block-mount \
 kmod-usb-serial-option usb-modeswitch \
 6in4  openvpn-openssl  xl2tpd \
 acme  uhttpd-mod-lua libuhttpd-openssl"
~~~

## Build

### The Latest Version by Docker

~~~sh
docker build --pull -t "registry.gitlab.com/rychly-edu/docker/docker-openwrt-imagebuilder:latest" .
~~~

### All Versions by the Build Script

~~~sh
./build.sh --build "registry.gitlab.com/rychly-edu/docker/docker-openwrt-imagebuilder" "latest"
~~~

For the list of versions to build see [docker-tags.txt file](docker-tags.txt).
