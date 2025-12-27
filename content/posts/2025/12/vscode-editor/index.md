---
title: "VSCode エディタ関連の設定"
date: 2025-12-27T10:46:38+09:00
tags: ["vscode"]
---

## はじめに

VSCode エディタ関連の設定の備呆録。

## テーマの変更

1. [kanagawa-vscode-theme](https://github.com/metapho-re/kanagawa-vscode-theme) をインストール
2. Cmd + K から Cmd + T で Kanagawa Wave を選択

## フォントの設定

1. Cmd + ,
2. 検索窓に font と入力
3. Editor: Font Size を 13 に変更
4. Editor: Font Family に [HackGen Console NF](https://github.com/yuru7/HackGen) を設定
5. 検索窓に terminal font と入力
6. Terminal › Integrated: Font Size を 14 に変更

## 文字コードの自動判別

1. Cmd + ,
2. 検索窓に encoding と入力
3. Files: Auto Guess Encoding にチェック

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
