# xiaohongshu-mcp-clean

这是一个**适合发到 GitHub 的干净导出版本**，基于你当前本地使用的小红书 MCP 源码整理而来。

它的目标不是保留你本机所有运行痕迹，而是提供一份：
- 可公开分享的源码目录
- 不包含登录态/本地隐私文件
- 带基础启动脚本和 MCP 配置样例
- 适合别人 clone 后继续部署或二次开发

## 这个导出版本做了什么清理

已经移除/不包含：
- `cookies.json`
- `notifications_replied.json`
- 运行日志（如 `mcp-production.log`）
- 锁定构建残留、备份二进制
- 本机私有路径硬编码运行脚印
- 编辑器/本地开发残留（`.cursor` / `.vscode` / `.github` / `.kimi-agent.yml`）

## 这个版本额外补了什么

### 1. 改成了更适合开源仓库的启动方式
原本你本机是直接调现成二进制。这个仓库版本改成：
- `build.sh`：从源码构建
- `start-production.sh`：自动构建并启动服务
- `start-login.sh`：启动服务后提示二维码获取地址
- `healthcheck.sh`：快速检查登录状态

### 2. 增加了 `.gitignore`
避免后续运行时把 cookie、日志、临时状态又推回 GitHub。

### 3. 保留了 MCP 客户端样例配置
位置：`config/mcporter.json`

## 目录说明

- `main.go` / `service.go` / `mcp_server.go`：服务入口与 MCP 主逻辑
- `xiaohongshu/`：登录、搜索、推荐流、详情、发布、互动等平台能力
- `config/mcporter.json`：MCP 客户端接入样例
- `build.sh`：源码构建脚本
- `start-production.sh`：本地运行脚本
- `start-login.sh`：登录辅助脚本
- `healthcheck.sh`：健康检查
- `UPSTREAM_README.md`：上游原始 README（保留参考）

## 使用教程（从零开始）

### 1. 环境准备
你至少需要：
- Go（建议与 `go.mod` 兼容版本）
- 一台能打开浏览器的小红书登录环境
- macOS / Linux 的 shell 环境（脚本目前按 zsh 写）

### 2. 构建
```bash
./build.sh
```
构建完成后会生成：
```bash
./bin/xiaohongshu-mcp
```

### 3. 启动服务
```bash
./start-production.sh
```
默认会：
- 构建（如果还没构建）
- 用 `cookies.json` 作为登录态文件
- 启动到 `:18060`
- 立即做一次登录状态检查

### 4. 登录
首次登录时：
```bash
./start-login.sh
```
然后访问：
```bash
http://127.0.0.1:18060/api/v1/login/qrcode
```
拿二维码完成登录。

### 5. 健康检查
```bash
./healthcheck.sh
```

### 6. 给 MCP 客户端接入
如果你用的是 `mcporter`，可以参考：
```json
{
  "mcpServers": {
    "xiaohongshu-mcp": {
      "baseUrl": "http://127.0.0.1:18060/mcp"
    }
  },
  "imports": []
}
```

## 适合什么场景

这份仓库适合：
- 想自己部署小红书 MCP
- 想二次开发小红书自动化能力
- 想把 OpenClaw / MCP 客户端接到小红书能力上

不适合：
- 直接拿你本机 cookie 去跑别人的生产环境
- 把仓库当成“打包即开箱的成品 SaaS”

## 修改亮点（适合放 GitHub 首页）

- 做了**公开仓库级脱敏**，把本地登录态和运行垃圾剥掉了
- 把启动方式改成**源码仓库友好版**，不依赖你本机私有二进制布局
- 保留了 MCP 接入样例，方便别人接 `mcporter` / OpenClaw / 其他客户端
- 保留上游 README 为 `UPSTREAM_README.md`，避免原始文档信息丢失

## 发布前建议你再检查一遍

- README 里的仓库名、作者名、联系方式要不要改
- 是否要补 License 说明和致谢说明
- 是否要补一段“本仓库基于上游项目整理”的声明
