---
title: "Zabbix `Disk space is low` トリガーの条件"
date: 2024-05-02T17:00:19+09:00
tags: ["zabbix", "trigger"]
---

## はじめに

Zabbix のトリガー `/: Disk space is low` の条件の備呆録

## `/: Disk space is low` トリガーの条件


```
last(/oppara.tv/vfs.fs.size[/,pused])>{$VFS.FS.PUSED.MAX.WARN:"/"} and ((last(/oppara.tv/vfs.fs.size[/,total])-last(/oppara.tv/vfs.fs.size[/,used]))<{$VFS.FS.FREE.MIN.WARN:"/"} or timeleft(/oppara.tv/vfs.fs.size[/,pused],1h,100)<1d)
```

見やすく整形してみる。
```
last(/oppara.tv/vfs.fs.size[/, pused]) > {$VFS.FS.PUSED.MAX.WARN:"/"} 
and 
(
  (last(/oppara.tv/vfs.fs.size[/, total]) - last(/oppara.tv/vfs.fs.size[/, used])) < {$VFS.FS.FREE.MIN.WARN:"/"} 
  or 
  timeleft(/oppara.tv/vfs.fs.size[/, pused], 1h, 100) < 1d
)
```

日本語にしてみる。

```
ディスク使用率が $VFS.FS.PUSED.MAX.WARN より大きい
かつ 
(
  ディスク残量が $VFS.FS.FREE.MIN.WARN より小さい
  もしくは 
  1日以内にディスク使用率が100%となる
)
```


## 環境

```console
$ zabbix_server --version
zabbix_server (Zabbix) 6.0.23
```
