---
title: "openssl で SAN を確認"
date: 2026-03-10T22:27:57+09:00
tags: ["openssl", "ssl", "san"]
---

## はじめに

手元の証明書ファイルから Subject Alternative Name (SAN) を確認するための備呆録。

##  やり方

```shell
openssl x509 -noout -text -in /path/to/cert.pem | grep -A1 "Subject Alternative Name"

```

## 環境

```console
% sw_vers
ProductName:		macOS
ProductVersion:		26.3
BuildVersion:		25D125

% openssl version  
OpenSSL 3.6.1 27 Jan 2026 (Library: OpenSSL 3.6.1 27 Jan 2026)
```
