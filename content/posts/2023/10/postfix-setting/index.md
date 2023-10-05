---
title: "Postfix 覚書"
date: 2023-10-03T22:11:39+09:00
tags: ["postfix"]
---


## 主要な項目の説明

- myhostname：DNS で正引きできる（A レコードが存在する）ホスト名。  
 DNS 正引きの IP アドレスと、Postfix を設定するサーバの IP アドレスが一致する必要はない！
- mydomain：ドメイン名を FQDN で指定
- myorigin：アプリケーションからのメール送信時に From アドレスのドメインとして使用する名前

最終的に、myorigin に設定するドメインに、逆引き、SPF レコードの設定が必要。

## 設定例

```postfix
myhostname = mail01.example.com
mydomain = example.com
myorigin = $mydomain
mydestination =
```
## コマンド

### main.cf の確認
```
# postfix check
```

### 再起動
```
# service postfix restart
```
