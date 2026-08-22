---
title: "自然な日本語に直すAgent Skill"
date: 2026-08-22T13:37:08+09:00
tags: ["claudecode", "skills"]
---

## はじめに

AI が書いた日本語を自然な日本語に直すスキル [natural-japanese](https://github.com/coji/natural-japanese/tree/main) をインストールしたので備呆録。

- [AI臭は語彙よりリズムに出る - 自然な日本語を書くAgent Skillと7モデル×406本の実測](https://zenn.dev/coji/articles/natural-japanese-ai-smell-lint)

## インストール

```console
npx openskills install coji/natural-japanese
npx openskills sync
```

## ヘルプ

```console
/natural-japanese  help
```


## 使用例

- 「議事録を整えて」→  quick モードで書き直し
- 「このレポート、AI っぽいか採点して」→  score モード(書き換えなし)
- 「note の記事を新しく書いて」→  write モード
- 「自分の文体を学ばせたい」→ 過去文章から style-profile.md を作成

## 環境

```console
❯ sw_vers
ProductName:        macOS
ProductVersion:     26.5.2
BuildVersion:       25F84

❯ claude -v
2.1.231 (Claude Code)
```
