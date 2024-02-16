---
title: "openssl を使って証明書を確認"
date: 2024-02-17T00:19:31+09:00
tags: ["openssl", "ssl"]
---

## はじめに

openssl を使って証明書の諸々を確認する方法の備忘録。

## 証明書のコモンネームと有効開始日・有効期限日を確認する

```console
% openssl x509 -noout -subject -dates -in oppara.tv.crt
subject=CN=oppara.tv
notBefore=Jan 31 19:06:53 2024 GMT
notAfter=Apr 30 19:06:52 2024 GMT
```

## 証明書と秘密鍵の「整合性」を確認する

ハッシュが同じであれば整合性が取れている。

```console
% openssl x509 -noout -modulus -in oppara.tv.cert | md5sum
48f8be8df2822b4f302fc16276566f9e  -

% openssl rsa -noout -modulus -in oppara.tv.key | md5sum
48f8be8df2822b4f302fc16276566f9e  -
```

## 証明書と中間証明書の「整合性」を確認する

ハッシュが同じであれば整合性が取れている。

```console
% openssl x509 -issuer_hash -noout -in oppara.tv.cert
8d33f237

% openssl x509 -subject_hash -noout -in  chain.cert
8d33f237
```
## リモートの証明書のコモンネームと有効開始日・有効期限日を確認する

```console
% echo | openssl s_client -connect oppara.tv:443 2> /dev/null | openssl x509 -noout -subject -dates 2> /dev/null


subject=CN=oppara.tv
notBefore=Jan 14 00:17:24 2024 GMT
notAfter=Apr 13 00:17:23 2024 GMT
```

## 環境

```console
% sw_vers
ProductName:            macOS
ProductVersion:         14.2.1
BuildVersion:           23C71

% openssl -version
OpenSSL 3.2.1 30 Jan 2024 (Library: OpenSSL 3.2.1 30 Jan 2024)
```
