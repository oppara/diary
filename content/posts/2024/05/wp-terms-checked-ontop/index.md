---
title: "WordPress の管理画面でチェックされたカテゴリーが上に表示されるのを抑止する"
date: 2024-05-29T20:07:35+09:00
tags: ["wordpress"]
---

## 問題

WordPress の管理画面でカテゴリーをチェックすると、そのカテゴリーが上に表示されるのを止めたい。

## 対応方法


```php
add_filter('wp_terms_checklist_args', function($args) {
    $args['checked_ontop'] = false;
    return $args;
});
```

## 参考サイト

- [WordPressの設置の際に気を配りたい。カテゴリーの階層構造について | 株式会社LIG(リグ)｜DX支援・システム開発・Web制作](https://liginc.co.jp/programmer/archives/2931)

## 環境

```console
% wp core version
6.5.3
```
