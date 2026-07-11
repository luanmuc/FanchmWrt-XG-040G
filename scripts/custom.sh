#!/bin/bash
# 自定义脚本：应用设备补丁、安装插件

set -e

# 颜色输出
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

info() { echo -e "${GREEN}[INFO]${NC} $1"; }
warn() { echo -e "${YELLOW}[WARN]${NC} $1"; }
error() { echo -e "${RED}[ERROR]${NC} $1"; exit 1; }

info "Applying XG-040G-MD device support from ImmortalWrt official..."

# 检查补丁文件是否存在
check_file() {
    if [ ! -f "$1" ]; then
        error "补丁文件不存在: $1"
    fi
}

# 1. 复制设备树文件
info "Copying device tree files..."
check_file patches/dts/an7581-nokia_xg-040g-md-common.dtsi
check_file patches/dts/an7581-nokia_xg-040g-md.dts
cp -f patches/dts/*.dts* $OPENWRT_PATH/target/linux/airoha/dts/
info "✅ Device tree files copied"

# 2. 复制网络配置
info "Copying network config..."
check_file patches/base-files/02_network
cp -f patches/base-files/02_network $OPENWRT_PATH/target/linux/airoha/an7581/base-files/etc/board.d/
chmod +x $OPENWRT_PATH/target/linux/airoha/an7581/base-files/etc/board.d/02_network
info "✅ Network config copied"

# 3. 添加设备定义
info "Adding device definition..."
check_file patches/image/device.mk
cat patches/image/device.mk >> $OPENWRT_PATH/target/linux/airoha/image/an7581.mk
info "✅ Image config appended"

info "All device patches applied successfully!"

# ==============================================
# 👇 要加第三方插件的话，把下面的注释去掉即可
# ==============================================

# info "Installing third-party packages..."
# cd $OPENWRT_PATH/package
# 
# # 示例：安装 Argon 主题
# git clone --depth 1 https://github.com/jerrykuku/luci-theme-argon.git
# git clone --depth 1 https://github.com/jerrykuku/luci-app-argon-config.git
# 
# # 示例：安装 HomeProxy
# # git clone --depth 1 https://github.com/immortalwrt/homeproxy.git
# 
# # 示例：安装 PassWall
# # git clone --depth 1 https://github.com/xiaorouji/openwrt-passwall.git
# # git clone --depth 1 https://github.com/xiaorouji/openwrt-passwall-packages.git
# 
# cd $OPENWRT_PATH
# ./scripts/feeds update -a
# ./scripts/feeds install -a -f

info "Custom script done!"
