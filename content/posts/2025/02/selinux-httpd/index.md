---
title: "SELinux で httpd からのファイルへのアクセスを許可する"
date: 2025-02-20T22:19:08+09:00
tags: ["selinux", "httpd"]
---

## はじめに

SELinux で httpd からのファイルへのアクセスを許可する方法の備忘録。

## 前提

`/var/app/tmp` に httpd からアクセスする場合を想定する。

## 対応方法

```
# chcon -R -t httpd_sys_rw_content_t /var/app/tmp
```

永続化
```
# semanage fcontext -a -t httpd_sys_rw_content_t /var/app/tmp
```

確認
```
# ls -alFZ /var/app/tmp
```

## 参考サイト

- [SELinuxでApacheからのファイルへのアクセスを許可する - tech-notes](https://scrapbox.io/tech-notes/SELinux%E3%81%A7Apache%E3%81%8B%E3%82%89%E3%81%AE%E3%83%95%E3%82%A1%E3%82%A4%E3%83%AB%E3%81%B8%E3%81%AE%E3%82%A2%E3%82%AF%E3%82%BB%E3%82%B9%E3%82%92%E8%A8%B1%E5%8F%AF%E3%81%99%E3%82%8B)


## 環境

```console
$ cat /etc/system-release
Amazon Linux release 2023.6.20250123 (Amazon Linux)
```
