# Contributing

感谢关注这个项目。

为了减少无效 PR、降低 Review 成本，也为了避免把账号隐私和不稳定的自动化逻辑带进主分支，提交 PR 前请先看完这份说明。

---

## Workflow

推荐流程：

1. Fork 本仓库
2. 新建一个清晰的功能分支
3. 本地完成开发、验证和截图/录屏
4. 提交 PR，并写清楚改了什么、为什么改、怎么验证

---

## PR rules

### 1. One PR, one change

一个 PR 最好只做一件事：

- 一个功能
- 或一个修复
- 或一次文档更新

不要把多个无关改动揉在一个 PR 里。

### 2. Verify before submitting

即使代码是 AI 辅助生成的，也必须先在本地验证。

提交前至少确认：

- 能编译 / 能运行
- 核心流程没有明显退化
- 不是“我觉得差不多能跑”

**未验证的 PR 可能会被直接关闭。**

### 3. Provide evidence

涉及功能改动时，请尽量附上：

- 截图
- 录屏
- 控制台输出
- 或最小复现步骤

这样 Reviewer 才能快速判断改动是否靠谱。

> 隐私提醒：如果演示里出现账号、cookie、二维码、昵称、头像或个人路径，请先打码再提交。

### 4. No excessive JS injection

本项目使用浏览器自动化能力时，优先走稳定、可维护的方式。

**不要用大量注入 JavaScript 的方式硬操控页面。**

优先原则：

- 先用框架本身提供的元素 API
- 再考虑可解释、可维护的最小补充逻辑
- 避免一长串脆弱的页面注入脚本

如果一个 PR 主要靠大段注入脚本撑起来，通常不适合合并。

### 5. Keep it simple

请尽量保持改动：

- 小而清楚
- 命名正常
- 注释简洁
- 结构可维护

不要过度设计，也不要为了“看起来高级”把项目搞复杂。

---

## Code style

### Go

- 提交前运行 `gofmt`
- 尽量保持已有代码风格一致
- 不要混入无关重构

### Comments

- 注释优先写“为什么”，少写废话式“做了什么”
- 中文注释可以接受，专业术语保留英文也没问题
- 保持短、准、可读

### Shell / scripts

- 尽量保证脚本可读
- 不要无意义堆一大串难维护命令
- 涉及路径、环境变量、端口时写清楚默认值和用途

---

## Privacy & security

提交任何内容前，请先确认没有把这些东西一起交上来：

- 登录态文件
- `cookies.json`
- token / secret / api key
- 本机私有路径
- 运行日志
- 真实账号截图（未打码）
- 可复用的敏感配置

如果你不确定某个文件该不该提交，宁可先不要提交。

---

## PR checklist

提交前请自查：

- [ ] 改动只解决一个明确问题
- [ ] 本地已经运行 / 验证过
- [ ] 代码已格式化（例如 Go 使用 `gofmt`）
- [ ] 没有把敏感信息一起提交
- [ ] 提供了必要的截图、录屏或验证说明
- [ ] 没有引入大量难维护的 JS 注入逻辑
- [ ] PR 描述写清楚了改动内容和验证方式

---

## Good PR description example

可以参考这种写法：

```text
### What
Fix login status check after startup

### Why
The previous script could report success even when the login state was expired.

### How
- add explicit login status check after service startup
- return non-zero exit code on failed status check
- update healthcheck script output

### Verified
- tested on local macOS environment
- tested with logged-in state
- tested with expired login state
```

---

## Final note

如果你的改动是：

- 更稳定
- 更容易维护
- 更少脆弱魔法
- 更少泄露风险

那它大概率就是一个好 PR。