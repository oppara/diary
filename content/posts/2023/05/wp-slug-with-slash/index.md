---
title: "WordPress でスラッグにスラッシュを含ませたい"
date: 2023-05-20T18:18:23+09:00
tags: ["wordpress"]
---


## 問題

WordPress でスラッグにスラッシュを含ませられない。  
スラッシュがハイフンに変換されてしまう。。。

## 対応方法

[sanitize_title_with_dashes](https://github.com/WordPress/WordPress/blob/6.2.2/wp-includes/formatting.php#L2258) という関数でフィルタしてるので削除する。

ただし、フィルタを削除すると、[URI エンコード](https://github.com/WordPress/WordPress/blob/6.2.2/wp-includes/formatting.php#L2267-L2272) されなくなるので自前でエンコードする。

```php
remove_filter('sanitize_title', 'sanitize_title_with_dashes');

// URI エンコードを行う
add_filter('sanitize_title', function ($title) {
    if (seems_utf8($title)) {
        if (function_exists('mt_strtolower')) {
            $title = mb_strtolower($title, 'UTF-8');
        }
        $title = utf8_uri_encode($title, 200);
    }

    return $title;
});
```
