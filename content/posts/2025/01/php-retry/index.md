---
title: "PHP リトライのテンプレート"
date: 2025-01-13T10:37:19+09:00
draft: false
tags: [php, retry]
---

## はじめに

よく忘れるので、備呆録。


## 手順

```php
<?php
declare(strict_types=1);


function retry($retries, $sleep, callable $callback)
{
    for ($i = 1; $i <= $retries; $i++) {
        try {
            return $callback();
        } catch (Exception $e) {
            echo  "attempt: $i" . PHP_EOL;
            echo $e->getMessage() . PHP_EOL;
            $delay = $sleep * $i;
            echo  "delay: $delay" . PHP_EOL;
            sleep($delay);
        }
    }
    throw new Exception('Failed after ' . $retries . ' retries');
}

function hoge()
{
    throw new Exception('error');
}

retry(3, 1, 'hoge');

```


## 環境

```console
% sw_vers
ProductName:            macOS
ProductVersion:         15.2
BuildVersion:           24C101

% php -v
PHP 8.2.27 (cli) (built: Dec 17 2024 11:39:23) (NTS)
Copyright (c) The PHP Group
Zend Engine v4.2.27, Copyright (c) Zend Technologies
    with Zend OPcache v8.2.27, Copyright (c), by Zend Technologies
```
