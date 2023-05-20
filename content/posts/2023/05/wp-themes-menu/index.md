---
title: "WordPress で外観メニュー内に「メニュー」表示されない件"
date: 2023-05-19T14:27:10+09:00
tags: ["wordpress"]
---

## 問題

自分で作成したテーマを使用した場合、サイドメニュー -> 外観メニュー内に「メニュー」が表示されない。

## 対応方法

```php
add_action('after_setup_theme', function(): void {
    register_nav_menu('primary', __('Primary Menu', 'theme-slug'));
});
```

