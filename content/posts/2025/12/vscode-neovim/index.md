---
title: "VSCode に Neovim プラグインをインストール"
date: 2025-12-27T15:08:41+09:00
tags: ["vscode", "neovim"]
---

## はじめに

VSCode に Neovim プラグインをインストールした際の備呆録。

## 手順

1. [VSCode Neovim](https://marketplace.visualstudio.com/items?itemName=asvetliakov.vscode-neovim) をインストールして VSCode を再起動する。
2. 以下のダイアログが表示されるので[Yes]をクリックする。
{{< figure src="neovim_01.png" alt="" >}}
3. 再起動しろとダイアログが表示されるので[Restart]をクリックする。
{{< figure src="neovim_02.png" alt="" >}}
4. 何も起こらなかったので手動で VSCode を再起動する。

以下の設定がされていた。
{{< figure src="vscode_affinity.png" alt="" >}}

## キーリピートできない問題の対応

以下を実行し Mac を再起動する。

```shell
defaults write -g ApplePressAndHoldEnabled -bool false
```

設定されているか確認するには、以下を実行し、0 か false が表示されれば OK。

```shell
defaults read -g ApplePressAndHoldEnabled
```

## 環境

```console
% code --version
1.107.1
994fd12f8d3a5aa16f17d42c041e5809167e845a
arm64

% nvim --version
NVIM v0.11.5
Build type: Release
LuaJIT 2.1.1765228720

% sw_vers
ProductName:            macOS
ProductVersion:         15.6
BuildVersion:           24G84
```
