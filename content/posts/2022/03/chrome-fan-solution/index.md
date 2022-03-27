---
title: "Chrome を使っているとファンがうるさい"
date: 2022-03-27T10:01:24+09:00
tags: ['chrome']
---

## 問題

Chrome を使うとファンがうなりを上げる。

## 対応方法

1. `chrome://flags/#enhanced-bookmarks-experiment`を開く。
1. `bookmark`で検索。
1. 以下の機能を Disabled に変更する。
    - Omnibox short bookmark suggestions
    - Omnibox Bookmark Paths
    - Omnibox Site Search Starter Pack
    - Reading List
1. Chrome を再起動する。

## 参考サイト

- [2022年 重たいChromeを軽くする意外な解決方法とは？ | オランダで生きていく](https://nldot.info/chrome-slow-fix/)

## 環境

```console

% /Applications/Google\ Chrome.app/Contents/MacOS/Google\ Chrome --version
Google Chrome 99.0.4844.83

% sw_vers
ProductName:    macOS
ProductVersion: 12.2
BuildVersion:   21D49
```
