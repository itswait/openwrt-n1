#!/bin/bash
#
# Copyright (c) 2019-2020 P3TERX <https://p3terx.com>
#
# This is free software, licensed under the MIT License.
# See /LICENSE for more information.
#
# https://github.com/P3TERX/Actions-OpenWrt
# File name: diy-part2.sh
# Description: OpenWrt DIY script part 2 (After Update feeds)
#

# Modify LAN IP
sed -i 's/192.168.1.1/10.10.10.10/' package/base-files/files/bin/config_generate

# Replace antfs to ntfs-3g
sed -i 's/antfs-mount/ntfs-3g/' package/lean/automount/Makefile
sed -i '/exit 0/i ln -sf \/usr\/bin\/ntfs-3g \/sbin\/mount.ntfs\n' package/lean/default-settings/files/zzz-default-settings

# Replace Argon theme
rm -rf package/lean/luci-theme-argon
git clone -b 18.06 https://github.com/jerrykuku/luci-theme-argon package/lean/luci-theme-argon

# Add eMMC flash script
git clone https://github.com/tuanqing/install-program package/install-program
