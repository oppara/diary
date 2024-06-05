---
title: "1 秒に 1 回サーバにアクセスするコマンド"
date: 2024-06-06T08:18:07+09:00
tags: ["curl", "web"]
---

## 使いどころ

例えば、サーバのアップグレード時に、実際に通信が途切れてないか 1 秒に 1 回サーバにアクセスして接続を確認したい時とか。

## 手順


```console
url=https://oppara.tv/
while true; do TZ=JST-9 date; curl -I "$url"; sleep 1s; done
```

Mac の場合
```console
url=https://oppara.tv/
while true; do TZ=JST-9 date; curl -I $url; sleep 1; done
```

## 環境

```console
% sw_vers
ProductName:            macOS
ProductVersion:         14.4.1
BuildVersion:           23E224
```
