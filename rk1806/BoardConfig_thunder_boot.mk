#!/bin/bash

# Target arch
export RK_KERNEL_ARCH=arm64
# SPL defconfig
export RK_SPL_DEFCONFIG=rk1808
# Kernel defconfig
export RK_KERNEL_DEFCONFIG=rk1806_linux_thunder_boot_defconfig
# Kernel dts
export RK_KERNEL_DTS=rk1806-thunder-boot
# boot image type
export RK_BOOT_IMG=boot.img
# kernel image path
export RK_KERNEL_IMG=kernel/arch/arm64/boot/Image
# parameter for GPT table
export RK_PARAMETER=parameter-buildroot.txt
# Buildroot config
export RK_CFG_BUILDROOT=rockchip_rk1806_thunder_boot
# Recovery config
export RK_CFG_RECOVERY=rockchip_rk1806_recovery
# Pcba config
export RK_CFG_PCBA=rockchip_rk1806_pcba
# target chip
export RK_TARGET_PRODUCT=rk1806
# Set rootfs type, including ext2 ext4 squashfs
export RK_ROOTFS_TYPE=ext4
#misc image
export RK_MISC=wipe_all-misc.img
# <dev>:<mount point>:<fs type>:<mount flags>:<source dir>:<image size(M|K|auto)>:[options]
export RK_EXTRA_PARTITIONS="oem:/oem:ext2:defaults:oem_normal:auto:resize@userdata:/userdata:ext2:defaults:userdata_normal:auto:resize"
