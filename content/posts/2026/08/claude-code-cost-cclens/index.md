---
title: "Claude Code の「無駄」を確認"
date: 2026-08-18T01:24:56+09:00
tags: ["claude code", "cost", "claude"]
---

## はじめに

Claude Code の「無駄」を可視化するツール [cclens](https://zenn.dev/lambdalisue/articles/introduce-cclens) をインストールしたので備忘録。

## インストール

```console
brew install lambdalisue/cclens/cclens
```

## 使い方

全体の健康状態を確認する。

```console
cclens doctor --scope global  
```

直す（最適化する）。

```console
cclens optimize --scope global
```


## 環境

```console
❯ sw_vers
ProductName:        macOS
ProductVersion:     26.5.2
BuildVersion:       25F84

❯ claude -v
2.1.224 (Claude Code)
```
