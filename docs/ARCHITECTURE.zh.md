# 架构

[English](ARCHITECTURE.md) · [中文](ARCHITECTURE.zh.md) · [Deutsch](ARCHITECTURE.de.md)

WAB 2D 平台跳跃模板的组织方式概览。

## 设计目标

- 以功能为先的文件夹结构，场景与脚本尽量放在一起
- 输入动作在项目设置中定义，而不是写死按键
- 自动加载面尽量小（入门套件只有 `GameState`）
- 场景所有权边界清晰，方便后续扩展

## 文件夹对照

| 路径 | 用途 |
|------|---------|
| `autoloads/` | 全局可用的单例 |
| `entities/` | 玩法角色（玩家，以及未来的敌人/道具） |
| `levels/` | 关卡场景、出生点、图块集 |
| `scenes/` | 顶层流程场景（游戏根） |
| `ui/` | 菜单与 HUD |
| `assets/` | 不绑定单一场景的原始美术/音频 |
| `tests/` | 轻量验证辅助 |
| `docs/` | 给人阅读的项目文档 |

## 场景所有权

| 场景 | 负责 |
|-------|------|
| `ui/main_menu.tscn` | 菜单导航，启动或退出应用 |
| `scenes/game.tscn` | 一局玩法接线（关卡、玩家、HUD、暂停） |
| `levels/level_01.tscn` | 关卡几何、绘制图块、单向平台、出生点 |
| `entities/player/player.tscn` | 移动、镜头跟随、本地玩家状态 |
| `ui/hud.tscn` | 屏幕状态与操作提示 |
| `ui/pause_menu.tscn` | 暂停遮罩以及继续/菜单操作 |

## 自动加载

### `GameState`（`autoloads/game_state.gd`）

职责：

- 暂停 / 取消暂停（`get_tree().paused`）
- 主菜单与游戏之间的场景切换
- 发出 `pause_changed`，供 UI 更新

新的全局系统保持精简。在多个场景需要同一份状态之前，优先把逻辑放在场景本地。

## 物理层

在 `project.godot` 的 `[layer_names]` 中配置：

| 层 | 位 | 名称 | 使用者 |
|-------|-----|------|---------|
| 1 | `1 << 0` | `world` | 地面图块（TileMapLayer 碰撞） |
| 2 | `1 << 1` | `player` | 玩家身体 |
| 3 | `1 << 2` | `platforms` | 可穿过的单向平台 |

玩家 `collision_mask = 5`（world + platforms）。

## 输入动作

| 动作 | 用途 |
|--------|---------|
| `move_left` | 水平向左移动 |
| `move_right` | 水平向右移动 |
| `jump` | 跳跃 / 跳跃缓冲 |
| `pause` | 切换暂停菜单 |

## 命名约定

| 对象 | 约定 | 示例 |
|------|------------|---------|
| 场景文件 | `snake_case.tscn` | `main_menu.tscn` |
| 脚本 | `snake_case.gd` | `player.gd` |
| 节点名 | `PascalCase` | `SpawnPoint` |
| 信号 | `snake_case` 动词 | `pause_changed` |
| 常量 | `UPPER_SNAKE_CASE` | `GROUND_TILE` |
| 导出属性 | `snake_case` | `move_speed` |

## 玩家移动说明

`entities/player/player.gd` 实现了：

- 基于加速度的水平移动（地面/空中数值分开）
- 离开平台后的土狼时间
- 落地前的跳跃缓冲
- 提前松开跳跃键（可变跳跃高度）

原型调参时，请在检查器中调整导出值，而不是改常量。

## 关卡搭建

`levels/level_01.gd` 通过 `TileMapLayer.set_cell()` 在运行时绘制图块，这样模板无需手改二进制图块数据也能保持可读。

单向平台是独立的 `StaticBody2D` 节点，用来演示 Godot 4.7 的定向单向碰撞 API：

```gdscript
collision_shape.one_way_collision = true
collision_shape.one_way_collision_direction = Vector2(0, 1)
```

## 应避免的做法

- 在玩法脚本里写死键盘扫描码
- 跨无关场景使用 `$"../../SomeNode"` 这类深层节点路径
- 把 `GameState` 膨胀成包揽所有功能的总管理器
- 把菜单逻辑混进玩家或关卡脚本

## 扩展方向

入门套件之后比较合理的下一步：

1. 把可收集物做成 `entities/` 下的 `Area2D` 场景
2. 把关卡数据拆成 `.tres` 资源，或增加更多 `TileMapLayer` 节点
3. 当音效/音乐要上线时，引入专门的 `AudioManager` 自动加载
4. 面向桌面/移动端构建时，在 `export/` 下添加导出预设
