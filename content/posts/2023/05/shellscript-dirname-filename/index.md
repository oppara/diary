---
title: "シェルスクリプトでディレクトリ名やファイル名を取得したい"
date: 2023-05-02T00:43:57+09:00
tags: ["shell"]
---

## 目的

よく忘れるので備忘録。

よく使うのは `##*/`, `%/*`

## パターン

| パターン | 説明                               |
|------|----------------------------------|
| ${var#pattern}    | var の先頭から pattern の最短一致を削除する。 |
| ${var##pattern}    | var の先頭から pattern の最長一致を削除する。 |
| ${var%pattern}    | var の末尾から pattern の最短一致を削除する。 |
| ${var%%pattern}    | var の末尾から pattern の最長一致を削除する。 |

```shell
#!/bin/sh

path="/etc/httpd/httpd.conf"

# ファイル名
echo ${path##*/}

# ディレクトリ名
echo ${path%/*}

# 拡張子を除いたファイル名
echo ${path%.*}

# 拡張子
echo ${path##*.}
```

