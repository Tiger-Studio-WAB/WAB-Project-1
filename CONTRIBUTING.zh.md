# 参与贡献

[English](CONTRIBUTING.md) · [中文](CONTRIBUTING.zh.md) · [Deutsch](CONTRIBUTING.de.md)

感谢你为 WAB 2D 平台跳跃模板做贡献。

## 重要：许可与访问

本仓库为 **保留所有权利（All Rights Reserved）**（见 [LICENSE](LICENSE)）。这里的贡献指南适用于与 Tiger Studio / Wab 合作的**受邀协作者**。不要默认你可以在工作室约定范围之外分叉、再分发或复用项目素材。

如果你不是受邀协作者，请在提交更改前先联系维护者。

## 行为准则

参与须遵守 [CODE_OF_CONDUCT.zh.md](CODE_OF_CONDUCT.zh.md)。

## 开发环境

1. 克隆仓库（见 [docs/GETTING_STARTED.zh.md](docs/GETTING_STARTED.zh.md)）。
2. 在 Godot **4.7+** 中打开项目。
3. 运行可选验证脚本：

```bash
godot --headless --path . --script res://tests/validate_load.gd
```

## 分支

- 基础分支：`main`
- 功能分支：`feature/<short-description>`
- 缺陷修复：`fix/<short-description>`

每个 pull request 只聚焦一件事。

## GDScript 风格

- 尽量使用带类型的 GDScript（`var speed: float = 220.0`）
- 设计师可调的玩法数值优先用 `@export`
- 使用 Input Map 动作；不要在玩法代码里写死按键常量
- 与现有缩进保持一致（`.gd` 文件使用 Tab）
- 对外的自动加载 API 和可复用类加简短文档注释

## 场景与素材规范

- 场景保持小而可组合
- 脚本尽量与主场景放在一起
- 新的玩法角色放在 `entities/`
- 新关卡放在 `levels/`
- 不要提交 `.godot/` 编辑器缓存或导出二进制文件

## Pull request 检查清单

- [ ] 项目能在 Godot 4.7 中打开且无报错
- [ ] 主菜单 → 游戏 → 暂停 → 继续 流程正常
- [ ] 玩家可以奔跑、跳跃，并能落在地面和单向平台上
- [ ] 没有无关文件（系统垃圾、本地编辑器设置、密钥）
- [ ] 若文件夹结构、操作或架构有变，已更新文档

## 提交说明

使用清晰的祈使语气标题：

- `Add double-jump prototype to player controller`
- `Fix pause menu input when tree is paused`
- `Document physics layer setup in ARCHITECTURE.md`

## 报告问题

使用提供的模板在 GitHub Issues 中报告：

- 缺陷报告：写明 Godot 版本、操作系统、复现步骤、预期与实际行为
- 功能请求：先描述问题，再提出方案

## 安全

不要为安全漏洞开公开 Issue。见 [SECURITY.zh.md](SECURITY.zh.md)。

## 提问

开一个带 **Question** 标签的 GitHub Issue，或直接联系 Tiger Studio 维护者。
