#!/bin/bash


export PLATFORM_VERSION=11
export ANDROID_MAJOR_VERSION=r
export ARCH=arm64
export CROSS_COMPILE=$PWD/toolchain/gcc/linux-x86/aarch64/aarch64-gcc-4.9-brillo-m10-release/bin/aarch64-linux-android-

mkdir $PWD/out

make ARCH=arm64 O=$PWD/out gta3xlwifi_defconfig
make ARCH=arm64 O=$PWD/out -j8
