---
title: "stree を使ってみる"
date: 2023-10-09T10:24:59+09:00
tags: ['aws', 's3', 'tree', 'golang']
---

## はじめに

便利そうなので使ってみる。
- [orangekame3/stree: 📁Directory trees of AWS S3 Bucket](https://github.com/orangekame3/stree)
- [stree：S3バケットをtreeするCLIコマンド | フューチャー技術ブログ](https://future-architect.github.io/articles/20230926a/)

## インストール

Homebrew でインストールする。
```console
% brew install orangekame3/tap/stree
```

## ちょい、はまる。

```console
% stree my-bucket
ignoring argument my-bucket (path check I)
No Git or Mercurial URLs found in arguments or current working path, see stree --help
```

は？

```console
% which stree
/opt/homebrew/bin/stree

% ll /opt/homebrew/bin | grep stree
lrwxr-xr-x  1 oppara  admin    53B Oct 28  2022 stree -> /Applications/Sourcetree.app/Contents/Resources/stree
```

Sourcetree の CLI がインストールされていたので削除する。

```console
% rm /opt/homebrew/bin/stree
```


## 設定

config と credentials をよしなに設定する。

~/.aws/config
```toml
[oppara]
region = ap-northeast-1
output = json
```

~/.aws/credentials
```toml
[oppara]
aws_access_key_id = XXXXXXXXXXXXXXXXXXXXX
aws_secret_access_key = XXXXXXXXXXXXXXXXX
```


## 実行

```console
% stree opp-my-bucket --profile oppara --no-color
opp-my-bucket
├── foo
│   └── bar
│       └── baz.toml
└── hoge.md

2 directories, 2 files
```


## 環境

```console
% sw_vers
ProductName:		macOS
ProductVersion:		14.0
BuildVersion:		23A344
```
