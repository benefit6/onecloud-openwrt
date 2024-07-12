#!/bin/bash
#
# Copyright (c) 2019-2020 P3TERX <https://p3terx.com>
#
# This is free software, licensed under the MIT License.
# See /LICENSE for more information.
#
# https://github.com/P3TERX/Actions-OpenWrt
# File name: diy-part1.sh
# Description: OpenWrt DIY script part 1 (Before Update feeds)
#

# Uncomment a feed source
#sed -i 's/^#\(.*helloworld\)/\1/' feeds.conf.default

# Add a feed source
echo "src-git passwall_packages https://github.com/xiaorouji/openwrt-passwall-packages.git;main" >> "feeds.conf.default"
echo "src-git passwall https://github.com/xiaorouji/openwrt-passwall.git;main" >> "feeds.conf.default"
echo 'src-git dns https://github.com/sbwml/luci-app-mosdns' >>feeds.conf.default
echo 'src-git xd https://github.com/shiyu1314/openwrt-packages' >>feeds.conf.default
echo "src-git kiddin9 https://github.com/kiddin9/openwrt-packages.git;master" >> "feeds.conf.default"

git clone https://github.com/sbwml/luci-app-alist package/alist
git clone https://github.com/rufengsuixing/luci-app-onliner package/onliner
git clone -b js https://github.com/UnblockNeteaseMusic/luci-app-unblockneteasemusic package/luci-app-unblockneteasemusic
git clone -b 18.06 https://github.com/jerrykuku/luci-theme-argon package/luci-theme-argon