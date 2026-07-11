# FanchmWrt for Nokia XG-040G-MD

专为诺基亚贝尔 XG-040G-MD 万兆光猫定制的 FanchmWrt 固件，基于官方 FanchmWrt 源码，设备支持来自 ImmortalWrt 官方。

## ✨ 特性

- 🚀 基于 FanchmWrt 官方最新源码（内核 6.12）
- 📱 完整的 LuCI 中文界面
- 🔒 FanchmWrt 核心上网行为管理功能（fwx）
- 🔌 完整硬件支持：2.5G 网口、USB、LED、按键
- ⚡ GitHub Actions 云编译，自动更新
- 💾 完善的缓存机制，编译快速

## 🚀 怎么使用

1. 点击右上角的 `Star` 开始第一次编译
2. 或者到 Actions 页面，选择 `Build FanchmWrt for XG-040G-MD`，点击 `Run workflow`
3. 等待约 2-3 小时，编译完成后在 Releases 页面下载固件

## ⚙️ 自定义配置

- 要修改编译选项：编辑 `config/xg-040g-md.config`
- 要加第三方插件：编辑 `scripts/custom.sh`，把要加的插件取消注释
- 要修改默认配置文件：在 `files/etc/` 目录下添加自定义文件

## 📦 刷机说明

1. 下载 `squashfs-sysupgrade.bin` 文件
2. 在现有 OpenWrt 系统的升级页面直接升级即可
3. 第一次启动建议不保留配置

## ❓ 常见问题

**Q: 第一次编译要多久？**
A: 第一次约 3-4 小时，后续有缓存约 1-2 小时。

**Q: 怎么 SSH 连接到 Actions 调试？**
A: 触发编译时勾选 `SSH connection to Actions` 选项。

**Q: 怎么加插件？**
A: 编辑 `scripts/custom.sh`，把要加的插件 git clone 到 package 目录即可。

## 📄 开源协议

MIT
