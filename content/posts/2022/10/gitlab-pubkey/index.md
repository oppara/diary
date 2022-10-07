---
title: "GitLab に登録している公開鍵を取得したい"
date: 2022-10-07T09:00:03+09:00
tags: ["gitlab", "ssh"]
---

## 目的

GitLab に登録している公開鍵を手軽に取得したい。

## 対応方法

GitLab のユーザーページの URL の後ろに `.keys` をつける。

### 例

- GitLab のホスト: gitlab.oppara.tv
- ユーザー名: oppara

```
% curl https://gitlab.oppara.tv/oppara.keys
```

## 参考サイト

- [GitHub に登録した SSH 公開鍵は全世界に公開されている | 774::Blog](https://blog.id774.net/entry/2013/12/16/441/)

```
% curl https://github.com/oppara.keys
```
