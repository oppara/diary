---
title: "WP-CLI でテーブル内の文字列を置換する"
date: 2022-04-11T21:52:05+09:00
tags: ["wordpress", "wp", "cli"]
---

## はじめに

[WP-CLI](https://wp-cli.org/ja/) でテーブル内の文字列を置換する。

## やり方

プレフィックスが`wp_`のテーブル内の`search`を`replace`に置換して`out`に書き出す。

```bash
#!/bin/bash
set -eu

path="wp-config.php があるディレクトリまでのパス"
search="https://stg.example.com"
replace="https://www.example.com"
out="export.sql"

/path/to/wp search-replace --path="${path}" "${search}" "${replace}" wp_* \
--export="${out}" \
--report-changed-only \
--all-tables-with-prefix
```

`--export`をつけない場合はテーブルのデータをじかに置換するので、実行前に`--dry-run`を忘れない。

## 参考サイト

- [wp search-replace | WP-CLI Command | WordPress Developer Resources](https://developer.wordpress.org/cli/commands/search-replace/)

## 環境

```console
% php wp --version
WP-CLI 2.6.0
```
