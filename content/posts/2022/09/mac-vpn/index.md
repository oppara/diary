---
title: "VPN 接続しても IP アドレスが変わらない件"
date: 2022-09-04T09:14:43+09:00
tags: ["mac", "vpn"]
---


## 問題

Mac で会社の VPN 設定をしても、IP アドレスが会社のものに切り替わらない。

## 対応方法

1. 「システム環境設定」 -> 「ネットワーク」で設定した VPN 設定の [詳細...] ボタンをクリック
1. 「オプション」タブ内の「すべてのトラフィックを VPN 接続経由で送信」をチェック

![](./vpn.png)

## 環境

```console
% sw_vers
ProductName:    macOS
ProductVersion: 12.4
BuildVersion:   21F79
```
