#!/bin/bash

# 获取当前脚本所在的绝对路径，并切换到该目录
SKILL_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
cd "$SKILL_DIR"

# 获取参数
VERSION=$1
CHANGELOG=$2

# 检查参数是否为空
if [ -z "$VERSION" ] || [ -z "$CHANGELOG" ]; then
    echo "❌ 错误：参数不完整"
    echo "用法: ./publish.sh <版本号> \"<更新说明>\""
    echo "示例: ./publish.sh 2.1.1 \"更新了 DMN 技能及文档规范\""
    exit 1
fi

echo "🚀 准备同步 dmn-default-mode-network 技能 (版本: $VERSION) ..."
echo "============================================================"

# 第一步：提交并推送到 GitHub
echo "📦 步骤 1: 提交并推送到 GitHub 仓库..."
git add -A
git commit -m "docs: $CHANGELOG"

if git push; then
    echo "✅ GitHub 同步成功！"
else
    echo "⚠️ 警告：推送到 GitHub 失败，请检查网络连接。"
fi

echo "============================================================"

# 第二步：发布到 ClawHub (根据原先 PUBLISH.md，需在上一级目录执行)
echo "🌐 步骤 2: 发布到 ClawHub 社区..."
cd "${SKILL_DIR}/../"

if clawhub publish ./dmn-default-mode-network --slug dmn-default-mode-network --version "$VERSION" --changelog "$CHANGELOG" --tags latest; then
    echo "✅ ClawHub 发布成功！"
else
    echo "⚠️ 警告：ClawHub 发布失败。"
    exit 1
fi

echo "============================================================"
echo "🎉 技能同步和发布已全部完成！"
