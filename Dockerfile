FROM ubuntu:22.04

LABEL \
maintainer="Prajval Raval <ravalprajval@gmail.com>"

ARG OPENWRT_ARCH
ARG OPENWRT_HOST
ARG OPENWRT_TARGET
ARG OPENWRT_SUBTARGET
ARG OPENWRT_VERSION

ENV \
OPENWRT_ARCH="${OPENWRT_ARCH:-arm_cortex-a7_neon-vfpv4}" \
OPENWRT_HOST="${OPENWRT_HOST:-Linux-x86_64}" \
OPENWRT_TARGET="${OPENWRT_TARGET:-ipq40xx}" \
OPENWRT_SUBTARGET="${OPENWRT_SUBTARGET:-generic}" \
OPENWRT_VERSION="${OPENWRT_VERSION:-22.03.1}"

# Disable Prompt During Packages Installation
ARG DEBIAN_FRONTEND=noninteractive

ENV \
IMAGEBUILDER_NAME="openwrt-imagebuilder-22.03.1-ipq40xx-generic.Linux-x86_64"

ENV \
IMAGEBUILDER_URL="https://runners-cache-sturdynet.s3.us-west-2.amazonaws.com/imagebuilder/openwrt-imagebuilder-22.03.1-ipq40xx-generic.Linux-x86_64.tar.xz" \
IMAGEBUILDER_HOME="/opt/${IMAGEBUILDER_NAME}"

RUN true \
&& apt update \
&& apt install -y build-essential xsltproc libncursesw5-dev clang flex g++ gawk gcc-multilib gettext \
git libncurses5-dev libssl-dev python3-distutils rsync unzip zlib1g-dev wget file curl \
&& echo "Downloading ${IMAGEBUILDER_URL} ..." && mkdir -p "${IMAGEBUILDER_HOME%/*}" && wget -qO - "${IMAGEBUILDER_URL}" | tar xJ -C "${IMAGEBUILDER_HOME%/*}" && echo "OpenWrt Image Builder downloaded and extracted" \
&& cd "${IMAGEBUILDER_HOME}" \
&& apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*
