---
title: "VSCode の日本語化と言語の切り替え"
date: 2025-12-27T10:17:57+09:00
tags: ["vscode"]
---

## はじめに

VSCode の日本語化と言語の切り替えの備呆録。

## 日本語化

以下をインストールして再起動。

[Japanese Language Pack for Visual Studio Code](https://marketplace.visualstudio.com/items?itemName=MS-CEINTL.vscode-language-pack-ja)

## 言語の切り替え

1. Ctlr + Shift + P でコマンドパレットを開き、`disp` と入力
2. "Configure Display Language" を表示して Enter をたたく
3. 切り替えたい言語を選択して Enter をたたく

## 環境

```console
% code --version
1.107.1
994fd12f8d3a5aa16f17d42c041e5809167e845a
arm64

% sw_vers
ProductName:            macOS
ProductVersion:         15.6
BuildVersion:           24G84
```
