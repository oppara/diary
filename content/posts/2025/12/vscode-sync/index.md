---
title: "VSCode の同期設定"
date: 2025-12-27T17:44:36+09:00
tags: ["vscode"]
---

## はじめに

VSCode の同期設定の備呆録。

## 手順

1. 「Code」-> 「基本設定」-> 「バックアップと同期の設定」　を選択する。
{{< figure src="vscode_01.png" alt="" >}}
2. サインインを求められるので、GitHub アカウントでサインインする。
{{< figure src="vscode_02.png" alt="" >}}

## GitHub で確認

Settings -> Applications -> Authorized OAuth Apps

{{< figure src="vscode_03.png" alt="" >}}

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
