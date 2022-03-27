---
title: "Bash 変数文字列置換"
date: 2022-03-24T22:45:36+09:00
tags: ["bash"]
---

## はじめに

よく使う変数内文字列置換を忘れるのでのメモ。

## 例

`~/tmp/hoge.sh`
```bash
#!/bin/bash

echo "$0"

# basename
echo "${0##*/}"

# 拡張子取得
echo "${0##*\.}"

# dirname
echo "${0%/*}"

# 拡張子以外
echo "${0%.*}"
```

output
```console
/Users/oppara/tmp/hoge.sh
hoge.sh
sh
/Users/oppara/tmp
/Users/oppara/tmp/hoge
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
