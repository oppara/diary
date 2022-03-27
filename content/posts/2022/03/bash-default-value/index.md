---
title: "Bash 変数のデフォルト値を設定する"
date: 2022-03-18T08:37:01+09:00
tags: ["bash"]
---

## はじめに

変数のデフォルト値の設定をを忘れるのでのメモ。

## 例

```bash
#!/bin/bash

# var には代入されない
echo "hello ${var:-world}"
echo "$var"

# デフォルト値を変数化するときは再代入した方が楽
var=${var:-foo}
echo "${var}"
```

output
```consle
hello world

foo
```

## 環境

```console
% sw_vers
ProductName:    macOS
ProductVersion: 12.2
BuildVersion:   21D49

% bash --version
GNU bash, version 3.2.57(1)-release (x86_64-apple-darwin21)
Copyright (C) 2007 Free Software Foundation, Inc.
```
