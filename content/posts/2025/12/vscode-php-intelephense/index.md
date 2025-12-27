---
title: "VSCode で PHP Intelephense"
date: 2025-12-27T21:48:13+09:00
tags: ["vscode", "php", "intelephense"]
---

## はじめに

VSCode に PHP Intelephense をインストールした際の備呆録。

## 手順

1. [PHP Intelephense](https://marketplace.visualstudio.com/items?itemName=bmewburn.vscode-intelephense-client) をインストール
2. 組込みの VSCode PHP 言語機能を無効にする
    - 機能拡張 (Extensions) を開く
    - @builtin php で検索
    - 「PHP 言語機能」(PHP Language Features) を無効化する
3. ライセンスキーの設定
    - Ctrl + Shift + P (Cmd + Shift + P) でコマンドパレットを開いて、licence key で検索。
    - ライセンスキーを入力する

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
