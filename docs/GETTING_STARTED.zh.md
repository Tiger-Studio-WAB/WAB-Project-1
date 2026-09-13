# 入门指南

[English](GETTING_STARTED.md) · [中文](GETTING_STARTED.zh.md) · [Deutsch](GETTING_STARTED.de.md)

本指南说明如何克隆仓库、在 Godot 4.7 中打开项目，并运行入门模板。

## 克隆仓库

### HTTPS

```bash
git clone https://github.com/<org>/WAB-Project-1.git
cd WAB-Project-1
```

### SSH

```bash
git clone git@github.com:<org>/WAB-Project-1.git
cd WAB-Project-1
```

将 `<org>` 替换为你的 GitHub 组织或用户名。

## 安装 Godot 4.7

1. 从 [godotengine.org/download](https://godotengine.org/download/) 下载 Godot **4.7**。
2. 使用 **Standard** 构建（不是 .NET），除非你之后打算加入 C#。
3. 这个 2D 模板使用 **GL Compatibility** 渲染器，以便兼容更多硬件。

## 打开项目

1. 启动 Godot。
2. 在项目管理器中点击 **Import**。
3. 浏览到克隆下来的文件夹，选择 `project.godot`。
4. 点击 **Import & Edit**。

首次打开时，Godot 会生成本地 `.godot/` 缓存文件夹。该文件夹已被 gitignore，不应提交。

## 运行游戏

- 按 **F5** 或点击 Play 按钮。
- 主场景：`res://ui/main_menu.tscn`
- 点击 **Start Game** 加载示例关卡。

## 首次打开注意事项

| 主题 | 说明 |
|-------|-------|
| `.godot/` 文件夹 | 编辑器缓存、导入数据和本地设置。在本地生成。 |
| `.uid` 文件 | Godot 4 资源 ID。可以提交；有助于团队间保持引用稳定。 |
| 导入时间 | 首次打开时纹理导入可能需要几秒。 |
| 输入映射 | 定义在 `project.godot` 的 `[input]` 中。请在那里扩展，不要在脚本里写死按键。 |

## 本地验证（可选）

如果 Godot 已在 PATH 中：

```bash
godot --headless --path . --script res://tests/validate_load.gd
godot --headless --path . --script res://tests/validate_gameplay.gd
```

预期输出：

```text
Validation passed: main menu, game scene, and player script load successfully.
Gameplay validation passed: tiles painted, player grounded, pause tree toggles.
```

在 macOS 上如果使用默认应用安装：

```bash
/Applications/Godot.app/Contents/MacOS/Godot --headless --path . --script res://tests/validate_load.gd
```

## 故障排除

### 纹理缺失或材质发粉

- 关闭 Godot，删除 `.godot/`，重新打开项目，等导入完成。

### 玩家掉穿地板

- 确认 `levels/tilesets/starter_tileset.tres` 已指定给 `Ground` 的 `TileMapLayer`。
- 确认地面碰撞已启用物理层 `world`（第 1 层）。

### 暂停菜单不出现

- 在游戏过程中按 `Esc`。
- 确认 `GameState` 自动加载已在 `project.godot` 中注册。

### Godot 版本不对

- 本模板面向 Godot **4.7+**。更早的 4.x 版本也许能打开项目，但不在支持范围内。

## 下一步

- 添加功能前先阅读 [ARCHITECTURE.zh.md](ARCHITECTURE.zh.md)。
- 扩展 `levels/level_01.gd`，或复制关卡场景来做新关。
- 在 `entities/player/player.gd` 的导出属性中调整手感。
