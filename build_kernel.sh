#!/bin/bash


export PLATFORM_VERSION=11
export ANDROID_MAJOR_VERSION=r
export ARCH=arm64

make ARCH=arm64 O=../out mrproper
make ARCH=arm64 O=../out exynos9810-r7_defconfig
make ARCH=arm64 O=../out -j$(nproc --all)

python /home/ondrej/kernel/idk/src/mkdtboimg.py create /home/ondrej/kernel/out/arch/arm64/boot/dts/samsung/dtbo.img /home/ondrej/kernel/out/arch/arm64/boot/dts/samsung/*.dtbo

python /home/ondrej/kernel/idk/src/mkdtboimg.py create /home/ondrej/kernel/out/arch/arm64/boot/dts/exynos/dtb.img --id=0 --rev=0 --custom1=0xff000000 /home/ondrej/kernel/out/arch/arm64/boot/dts/exynos/exynos9810.dtb
