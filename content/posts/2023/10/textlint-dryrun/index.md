---
title: "textlint で dry run"
date: 2023-10-19T07:33:30+09:00
tags: ["textlint"]
---

## はじめに

[textlint](https://textlint.github.io/) の dry-run をよく忘れるので覚書。
そもそもデフォルトが dry-run だった。

## Usage

```console
npx textlint /path/to/target
```


キャッシュなし、設定ファイル指定の場合。

```console
npx textlint --no-cache -c /path/to/textlintrc /path/to/target
```


自動修正時の場合。

```console
npx textlint --dry-run --fix /path/to/target
```



## 環境

```console
% npx textlint --version
v13.3.3

% sw_vers
ProductName:		macOS
ProductVersion:		14.0
BuildVersion:		23A344
```
