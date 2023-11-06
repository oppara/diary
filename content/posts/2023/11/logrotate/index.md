---
title: "ログローテートの覚書"
date: 2023-11-06T10:53:51+09:00
tags: ["logrotate"]
---

## はじめに

ログローテートの dry-run、実行方法についての覚書。

## Usage

dry-run 実行
```shell
logrotate -d /etc/logrotate.conf
```

実行
```shell
logrotate -f /etc/logrotate.conf
```

設定ファイルを指定して実行
```shell
logrotate -f /etc/logrotate.d/httpd
```
