---
title: "シェルスクリプトで Usage 表示"
date: 2023-10-05T22:22:24+09:00
tags: ["shellscript", "usage", "bash", "sh"] 
---

## はじめに

簡易敵な Usage 表示

## 実装


```bash
#!/usr/bin/env bash
#/ Usage:
#/     awsome-script [-h | -help] <name> [<count>]
#/
#/ Example
#/     awsome-script foo
#/     awsome-script foo 3
#/

set -e

usage () {
  grep '^#/' < "$0" | cut -c4-
  exit 0
}

if [ "$1" = "--help" ] || [ "$1" = "-h" ]; then
  usage
fi

NAME=$1
COUNT=${2:-0}

echo "$NAME" "$COUNT"
```

## 実行

```
% /path/to/awsome-script -h 
Usage:
    awsome-script [-h | -help] <name> [<count>]

Example
    awsome-script foo
    awsome-script foo 3

% /path/to/awsome-script foo
foo 0
```
