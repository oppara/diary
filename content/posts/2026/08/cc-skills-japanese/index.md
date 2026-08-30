---
title: "日本語の質を上げるスキル"
date: 2026-08-30T11:59:25+09:00
tags: ["claude code", "skills", "japanese"]
---

## はじめに

日本語の質を上げるスキルをインストールしたので備呆録。

## 手順

以下を claude code にお願いする。

```prompt
下記の2つのスキルをグローバルにインストールしてください。
https://gist.githubusercontent.com/k16shikano/fd287c3133457c4fd8f5601d34aa817d/raw/209db7d6d19bc4727139844c0e8d786542e9ff68/SKILL.md
https://gist.githubusercontent.com/k16shikano/eb2929f13ed19c97188393d297be8432/raw/a3b1e26beced71d582e13314fb6f5b179b023c76/SKILL.md
```

## 参考サイト

- [japanese-tech-writing/SKILL](https://gist.github.com/k16shikano/fd287c3133457c4fd8f5601d34aa817d)
- [cognitive-rhythm-writing/SKILL.md](https://gist.github.com/k16shikano/eb2929f13ed19c97188393d297be8432)
- [AIを使っているなら全員入れるべきAgent Skill 4選【ChatGPT / Codex / Claude Code】 | セカヤサAIブログ](https://ai.itokoba.com/archives/861/#1-japanese-tech-writingcognitive-rhythm-writing)

## 環境

```console
❯ sw_vers
ProductName:        macOS
ProductVersion:     26.5.2
BuildVersion:       25F84

❯ claude -v
2.1.231 (Claude Code)
```
