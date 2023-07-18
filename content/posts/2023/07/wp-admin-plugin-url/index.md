---
title: "WordPress の管理画面でプラグインの URL を取得する"
date: 2023-07-18T09:31:09+09:00
tags: ["wordpress"]
---


## 目的

WordPress の管理画面で独自プラグインの URL を取得したい。

## 対応方法

```php

funtcion getPluginUrl()
{
    return admin_url('admin.php?page=' . プラグインのスラッグ);
}
```


