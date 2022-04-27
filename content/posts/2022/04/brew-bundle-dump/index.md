---
title: "Brewfile を上書きしたい"
date: 2022-04-27T22:58:54+09:00
tags: ["macos", "homebrew"]
---


## 目的

Brewfile コメント付きで上書きしたい。

## やり方

```console
% brew bundle dump --force --describe
```

## ヘルプ表示

```console
% brew bundle --help
```

## 環境

```console
% brew --version
Homebrew 3.4.8-11-g96e8796
Homebrew/homebrew-core (git revision 44fc63c8cca; last commit 2022-04-25)
Homebrew/homebrew-cask (git revision 659584ba8c; last commit 2022-04-26)

% sw_vers
ProductName:    macOS
ProductVersion: 12.3.1
BuildVersion:   21E258
```
