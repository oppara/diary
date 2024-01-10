---
title: "ローカルで Web サーバーを立てる"
date: 2024-01-10T08:57:54+09:00
tags: ["server", "php", "node", "python"]
---

## Node.js

```
npx serve
```

port 指定する場合。
```
npx serve -p 1192
```

[serve - npm](https://www.npmjs.com/package/serve)

## Python

```
python -m http.server 1192
```

[http.server --- HTTP サーバ — Python 3.10.13 ドキュメント](https://docs.python.org/ja/3.10/library/http.server.html)

## PHP

```
php -S localhost:1192
```

[PHP: ビルトインウェブサーバー - Manual](https://www.php.net/manual/ja/features.commandline.webserver.php)


## まとめ

静的コンテンツは node で。PHP が絡む場合は php で。

## 環境

```console
% node -v
v21.5.0
% npx -v
10.2.4

% python --version
Python 3.10.6

% php -v 
PHP 8.3.1 (cli) (built: Dec 20 2023 12:44:38) (NTS)
Copyright (c) The PHP Group
Zend Engine v4.3.1, Copyright (c) Zend Technologies
    with Zend OPcache v8.3.1, Copyright (c), by Zend Technologies

% sw_vers
ProductName:            macOS
ProductVersion:         14.2.1
BuildVersion:           23C71
```
