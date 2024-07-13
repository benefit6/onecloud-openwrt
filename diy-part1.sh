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

function git_sparse_clone() {
  branch="$1" repourl="$2" && shift 2
  git clone --depth=1 -b $branch --single-branch --filter=blob:none --sparse $repourl
  repodir=$(echo $repourl | awk -F '/' '{print $(NF)}')
  cd $repodir && git sparse-checkout set $@
  mv -f $@ ../
  cd .. && rm -rf $repodir
}

# Uncomment a feed source
#sed -i 's/^#\(.*helloworld\)/\1/' feeds.conf.default

# Add a feed source
echo "src-git passwall_packages https://github.com/xiaorouji/openwrt-passwall-packages.git;main" >> "feeds.conf.default"
echo "src-git passwall https://github.com/xiaorouji/openwrt-passwall.git;main" >> "feeds.conf.default"
echo 'src-git dns https://github.com/sbwml/luci-app-mosdns' >>feeds.conf.default
echo 'src-git xd https://github.com/shiyu1314/openwrt-packages' >>feeds.conf.default
echo "src-git kenzok8 https://github.com/kenzok8/small-package;master" >> "feeds.conf.default"

git_sparse_clone master https://github.com/kiddin9/openwrt-packages alist
git_sparse_clone master https://github.com/kiddin9/openwrt-packages luci-app-alist
git_sparse_clone master https://github.com/vernesong/OpenClash luci-app-openclash

git clone -b master --depth 1 --single-branch https://github.com/rufengsuixing/luci-app-onliner package/onliner
git clone -b main --depth 1 --single-branch https://github.com/sirpdboy/luci-app-advancedplus package/advancedplus
git clone -b js --depth 1 --single-branch https://github.com/UnblockNeteaseMusic/luci-app-unblockneteasemusic package/luci-app-unblockneteasemusic
git clone -b 18.06 --depth 1 --single-branch https://github.com/jerrykuku/luci-theme-argon package/luci-theme-argon

./scripts/feeds update -a
cp -rf luci-app-alist package
cp -rf alist package
cp -rf luci-app-openclash package