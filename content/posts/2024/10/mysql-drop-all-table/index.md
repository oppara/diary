---
title: "MySQL ですべてのテーブルを削除する"
date: 2024-10-31T23:07:37+09:00
tags: ["mysql"]
---

## はじめに

MySQL でデータベース内のすべてのテーブルを削除する方法の備忘録。

## 手順

DROP 文を作成して実行する。

```console
$ echo "SET FOREIGN_KEY_CHECKS = 0;" > /patht/to/tmp.sql
$ mysqldump -h $DB_HOST --single-transaction --add-drop-table --no-data -u $DB_USER -p $DB_NAME | grep 'DROP TABLE' >> /path/to/tmp.sql
$ echo "SET FOREIGN_KEY_CHECKS = 1;" >> /path/to/tmp.sql

$ mysql -h $DB_HOST -u $DB_USER -p $DB_NAME < /path/to/tmp.sql
```
