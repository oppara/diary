---
title: "Web ページを取得、確認、抽出するスキル"
date: 2026-08-30T11:26:05+09:00
tags: ["claude code", "web", "curl"]
---

## はじめに

Web ページを取得、確認、抽出するスキルをインストールしたので備呆録。

## 手順

ax をインストール。

```shell
curl -fsSL https://ax.yusuke.run/install | sh
```

スキルに追加。

```shell
npx skills add yusukebe/ax -g -a claude-code
```

## 参考サイト

yusukebe gear だった。

- [yusukebe/ax: The AI-era curl](https://github.com/yusukebe/ax)
- [AIを使っているなら全員入れるべきAgent Skill 4選【ChatGPT / Codex / Claude Code】 | セカヤサAIブログ](https://ai.itokoba.com/archives/861/#4-webax)

## 環境

```console
❯ sw_vers
ProductName:        macOS
ProductVersion:     26.5.2
BuildVersion:       25F84

❯ claude -v
2.1.231 (Claude Code)
```
