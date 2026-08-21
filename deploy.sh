#!/usr/bin/env bash
# 一键部署到 GitHub Pages
# 用法: ./deploy.sh https://github.com/<你的用户名>/<仓库名>.git
# 前置: 在 GitHub 上新建一个「公开(Public)」仓库，然后把地址传给本脚本。
set -e
if [ -z "$1" ]; then
  echo "用法: $0 https://github.com/<用户名>/<仓库>.git"
  exit 1
fi
REMOTE="$1"
cd "$(dirname "$0")"
git remote remove origin 2>/dev/null || true
git remote add origin "$REMOTE"
git branch -M main
git push -u origin main
echo "✅ 已推送。下一步："
echo "   1. 打开 GitHub 仓库 → Settings → Pages"
echo "   2. Source 选 'Deploy from a branch'，Branch 选 'main'，目录选 '/ (root)'，点 Save"
echo "   3. 等 1~2 分钟，访问 https://<用户名>.github.io/<仓库名>/ 即可"
echo "   4. 把该地址加到知晓云控制台「设置→域名设置→安全域名」白名单"
