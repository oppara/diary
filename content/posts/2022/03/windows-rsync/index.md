---
title: "Windows で rsync を使いたい"
date: 2022-03-28T23:48:44+09:00
tags: ["windows", "rsync"]
---

## 問題

Windows で rsync を使いたい。
でも WSL を使うほどでもない。

## 対応方法

Git for Windows に rsync をインストールする。


1. スタートメニューの「Git Bash」を右クリックして、「管理者として実行」する。
1. 以下のシェルスクリプトを実行する。

```bash
#!/usr/bin/bash
set -eu

curl -L http://repo.msys2.org/msys/x86_64/zstd-1.4.5-2-x86_64.pkg.tar.xz |tar CvxJf / -
curl -L http://repo.msys2.org/msys/x86_64/rsync-3.2.2-2-x86_64.pkg.tar.zst |tar Cxvf / - --zstd
curl -L http://repo.msys2.org/msys/x86_64/libzstd-1.4.5-2-x86_64.pkg.tar.xz |tar CxvJf / -
curl -L http://repo.msys2.org/msys/x86_64/libxxhash-0.8.0-1-x86_64.pkg.tar.zst  |tar Cvxf / - --zstd
```

## 参考サイト

- [Git for Windows に rsync を追加する](https://zenn.dev/miwarin/articles/14a10b3278e7a6)

<!--

## 環境

```console
% sw_vers
ProductName:    macOS
ProductVersion: 12.2
BuildVersion:   21D49
```
-->
