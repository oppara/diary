---
title: "メール送信ワンライナー"
date: 2022-04-08T13:04:15+09:00
tags: ["mail", "shell"]
---

## 目的

mail コマンドで対話的にメールを送るのが面倒だったので備忘録。

## 対応方法

```console
% echo "本文" | mail -s "件名" -r no-replay@example.com foo@oppara.tv bar@oppara.tv
```

## 環境

```console
$ mail -V
12.5 7/5/10

$ cat /etc/os-release
NAME="Rocky Linux"
VERSION="8.5 (Green Obsidian)"
ID="rocky"
ID_LIKE="rhel centos fedora"
VERSION_ID="8.5"
PLATFORM_ID="platform:el8"
PRETTY_NAME="Rocky Linux 8.5 (Green Obsidian)"
ANSI_COLOR="0;32"
CPE_NAME="cpe:/o:rocky:rocky:8:GA"
HOME_URL="https://rockylinux.org/"
BUG_REPORT_URL="https://bugs.rockylinux.org/"
ROCKY_SUPPORT_PRODUCT="Rocky Linux"
ROCKY_SUPPORT_PRODUCT_VERSION="8"
```
