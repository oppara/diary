---
title: "mysqldump で PROCESS 権限を要求される場合"
date: 2022-03-26T13:13:31+09:00
draft: true
tags: ["mysql", "mysqldump"]
---

## 問題

mysqldump を実行すると以下のエラーを吐くようになってしまった。

```consele
mysqldump: Error: 'Access denied; you need (at least one of) the PROCESS privilege(s) for this operation' when trying to dump tablespaces
```


## 対応方法

テーブルスペースの情報が必要なければ`--no-tablespaces`オプションを付けて実行する。

```console
% mysqldump --no-tablespaces -h <DB_HOST> -u <DB_USER> -p <DB_NAME>
```

## 参考サイト

- [MySQL :: MySQL 5.7 Release Notes :: Changes in MySQL 5.7.31 (2020-07-13, General Availability)](https://dev.mysql.com/doc/relnotes/mysql/5.7/en/news-5-7-31.html)

## 環境

```console
$ mysql --version
mysql  Ver 8.0.28 for Linux on x86_64 (MySQL Community Server - GPL)
```

