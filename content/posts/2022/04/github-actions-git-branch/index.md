---
title: "GitHub Actions 時でなくてもブランチ名を利用したい"
date: 2022-04-03T00:04:44+09:00
draft: true
tags: ["github", "actions", "git"]
---

## 目的

Actions 時に呼び出すシェルスクリプト内で、Actions 時でなくてもブランチ名を利用したい。

## 対応方法

```bash
#!/bin/bash
set -Ceu

if [ "${GITHUB_REF_NAME:-UNDEF}" = "UNDEF" ]; then
  GITHUB_REF_NAME=$(git rev-parse --abbrev-ref HEAD)
fi
```

## 参考サイト

- [環境変数 - GitHub Docs](https://docs.github.com/ja/actions/learn-github-actions/environment-variables)
