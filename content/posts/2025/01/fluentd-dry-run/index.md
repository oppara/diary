---
title: "Fluentd で dry-run"
date: 2025-01-12T10:08:21+09:00
tags: [fluentd, dry-run]
---

## はじめに

[Fluentd](https://www.fluentd.org/) で設定ファイルを確認する方法についての備呆録。

## CLI

```console
% fluentd --dry-run -c /etc/fluentd/fluent.conf
```

## Docker

プラグイン使っている場合は、あらかじめインストールしておく必要がある。

```console
% docker run \
-ti --rm \
--platform linux/x86_64 \
-v ./:/fluentd/etc -v ./:/var/log \
fluent/fluentd:v1.8-debian-1 --dry-run -c /fluentd/etc/hoge.conf

fluentd --dry-run -c /fluentd/etc/hoge.conf
2025-01-12 09:07:29 +0000 [info]: parsing config file is succeeded path="/fluentd/etc/hoge.conf"
2025-01-12 09:07:29 +0000 [info]: gem 'fluentd' version '1.8.1'
2025-01-12 09:07:29 +0000 [info]: starting fluentd-1.8.1 as dry run mode ruby="2.6.5"
2025-01-12 09:07:29 +0000 [info]: using configuration file: <ROOT>
  <source>
    @type tail
    path "/var/log/httpd-access.log"
    pos_file "/var/log/td-agent/httpd-access.log.pos"
    tag "s3.apache.access"
    <parse>
      @type "apache2"
    </parse>
  </source>
  <match log.**>
    @type file
    path "/var/log/fluent/myapp"
    compress gzip
    <buffer>
      timekey 1d
      timekey_use_utc true
      timekey_wait 10m
      path "/var/log/fluent/myapp"
    </buffer>
  </match>
</ROOT>
2025-01-12 09:07:29 +0000 [info]: finsihed dry run mode
```

## 環境

```console
% sw_vers
ProductName:            macOS
ProductVersion:         15.2
BuildVersion:           24C101

% docker --version
Docker version 27.4.0, build bde2b89
```
