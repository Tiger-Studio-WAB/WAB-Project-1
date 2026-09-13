# WAB 2D 平台跳跃模板

[English](README.md) · [中文](README.zh.md) · [Deutsch](README.de.md)

面向 Tiger Studio / Wab 的 Godot **4.7** 入门模板。这是一套可游玩的 2D 平台跳跃基础：移动、TileMapLayer 关卡、单向平台、镜头跟随、HUD 与暂停流程。

## 环境要求

- [Godot 4.7+](https://godotengine.org/download/)（已在 4.7.2 上测试）
- Git

## 功能

- 主菜单：开始 / 退出
- 玩家控制器（`CharacterBody2D`）：奔跑、跳跃、土狼时间、跳跃缓冲、可变跳跃高度
- 使用 `TileMapLayer` 与共享 `TileSet` 搭建的起始关卡
- 通过 Godot 4.7 的 `CollisionShape2D.one_way_collision` + `one_way_collision_direction` 实现单向平台
- 带平滑的 `Camera2D` 跟随
- HUD：操作提示与暂停状态
- 暂停菜单（继续 / 返回主菜单）

## 操作

| 动作 | 按键 |
|--------|------|
| 向左移动 | `A` 或 左方向键 |
| 向右移动 | `D` 或 右方向键 |
| 跳跃 | `Space`、`W` 或 上方向键 |
| 暂停 | `Esc` |

## 快速开始

```bash
git clone https://github.com/<org>/WAB-Project-1.git
cd WAB-Project-1
```

1. 安装 [Godot 4.7](https://godotengine.org/download/)。
2. 打开 Godot 项目管理器 → **Import** → 选择 `project.godot`。
3. 按 **F5**（Play）从主菜单运行。

克隆方式、首次打开注意事项和故障排除见 [docs/GETTING_STARTED.zh.md](docs/GETTING_STARTED.zh.md)。

## 项目结构

```
project.godot
autoloads/              # 全局单例（GameState）
entities/player/        # 玩家场景 + 控制器
levels/                 # 关卡场景 + 图块集
scenes/                 # 顶层游戏流程场景
ui/                     # 主菜单、HUD、暂停菜单
assets/tiles/           # 占位图块图集
docs/                   # 安装与架构说明
tests/                  # 轻量验证脚本
```

场景归属、物理层与命名规则见 [docs/ARCHITECTURE.zh.md](docs/ARCHITECTURE.zh.md)。

## 参与贡献

本仓库为 **保留所有权利（All Rights Reserved）**。贡献文档面向受邀的工作室协作者。

开 pull request 前请阅读 [CONTRIBUTING.zh.md](CONTRIBUTING.zh.md)。

## 许可

Copyright (c) Tiger Studio / Wab. All Rights Reserved.

详见 [LICENSE](LICENSE)。

## 安全

请私下报告安全问题。见 [SECURITY.zh.md](SECURITY.zh.md)。
