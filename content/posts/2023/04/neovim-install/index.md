---
title: "Neovim のインストール"
date: 2023-04-27T08:29:24+09:00
tags: ["neovim"]
---

## 目的

Neovim を使いたい。

## 対応方法

[Homebrew](https://brew.sh/) でインストールする。


```console
brew install neovim

```

開発バージョンをインストールする。

```console
brew install --HEAD neovim

```
開発バージョンをアップデートする。

```console
brew upgrade neovim --fetch-HEAD
```

## 参考サイト

- [Installing Neovim · neovim/neovim Wiki](https://github.com/neovim/neovim/wiki/Installing-Neovim#macos--os-x)

## 環境

```console
% nvim --version
NVIM v0.9.0
Build type: Release
LuaJIT 2.1.0-beta3

% sw_vers
ProductName:            macOS
ProductVersion:         13.3
BuildVersion:           22E252
```
