#!/bin/bash

green="\033[01;32m"
nocol="\033[0m"
TOOLCHAIN="$1"
PLATFORM=universal7904

export KBUILD_BUILD_USER="SamarV-121"
export PATH="$HOME/toolchains/proton-clang/bin:$PATH"
export PATH="$HOME/toolchains/arm64-gcc-10/bin:$PATH"
export PATH="$HOME/toolchains/arm32-gcc-10/bin:$PATH"

DEVICES=(m20lte m30lte a30 a30s a40)
KERNEL_DIR="$PWD"
KERNEL_IMAGE="$KERNEL_DIR/out/arch/arm64/boot/Image"
AK3_DIR="$HOME/tools/AnyKernel/$PLATFORM"
ZIPNAME="FuseKernel-test-$1-$(git rev-parse --short HEAD)-$(date -u +%Y%m%d_%H%M)-$PLATFORM.zip"

[ -e "$HOME/toolchains/proton-clang" ] || git clone --depth=1 https://github.com/kdrag0n/proton-clang "$HOME/toolchains/proton-clang"
[ -e "$HOME/toolchains/arm64-gcc-10" ] || git clone --depth=1 https://github.com/arter97/arm64-gcc "$HOME/toolchains/arm64-gcc-10"
[ -e "$HOME/toolchains/arm32-gcc-10" ] || git clone --depth=1 https://github.com/arter97/arm32-gcc "$HOME/toolchains/arm32-gcc-10"
[ -e "$AK3_DIR" ] || git clone --depth=1 https://github.com/SamarV-121/AnyKernel3 -b "$PLATFORM" "$AK3_DIR"

function compile-kernel {
	for DEVICE in "${DEVICES[@]}"; do

		make "${DEVICE}_defconfig" O=out
		echo -e "${green}Compiling kernel for ${DEVICE} with $TOOLCHAIN${nocol}"
		make -j "$(nproc)" O=out "$@" 2>&1 | tee build_"$DEVICE".log
		[ -e "$KERNEL_IMAGE" ] && cp -f "$KERNEL_IMAGE" "$AK3_DIR/Image_$DEVICE" && rm "$KERNEL_IMAGE" || exit 1

		echo -e "${green}Compiling kernel for ${DEVICE}-oneui with $TOOLCHAIN${nocol}"
		make -j "$(nproc)" O=out "$@" \
			CONFIG_USB_ANDROID_SAMSUNG_MTP=y 2>&1 | tee build_"$DEVICE".log
		[ -e "$KERNEL_IMAGE" ] && cp -f "$KERNEL_IMAGE" "$AK3_DIR/Image_$DEVICE-oneui" && rm "$KERNEL_IMAGE" || exit 1

	done
}

case "$TOOLCHAIN" in
proton-clang-13)
	compile-kernel CC="ccache clang" \
		CROSS_COMPILE=aarch64-linux-gnu- CROSS_COMPILE_ARM32=arm-linux-gnueabi- \
		AR=llvm-ar \
		NM=llvm-nm \
		OBJCOPY=llvm-objcopy \
		OBJDUMP=llvm-objdump \
		STRIP=llvm-strip
	;;
gcc-10)
	compile-kernel CROSS_COMPILE="ccache aarch64-elf-" CROSS_COMPILE_ARM32="ccache arm-eabi-"
	;;
esac

cd "$AK3_DIR"
zip -r "$ZIPNAME" * -x "*.zip"
