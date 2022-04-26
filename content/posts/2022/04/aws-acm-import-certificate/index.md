---
title: "AWS CLI で証明書の再インポート"
date: 2022-04-26T09:22:58+09:00
tags: ["aws", "acm", "cli"]
---

## はじめに

マネコンからの再インポートが面倒くさかったので備忘録。

## 対応方法

シェルスクリプトから実行する。

```bash
#!/bin/bash
set -eu

# インポートする証明書の ARN
ARN="arn:aws:acm:region:123456789012:certificate/12345678-1234-1234-1234-12345678901	"

# 証明書ファイルへのパス
CRT="Certificate.pem"

# 中間証明書ファイルへのパス
CC="CertificateChain.pem"

# パスワード無しの秘密鍵へのパス
KEY="PrivateKey.pem"

# リージョン
REGION="us-east-1"

aws acm import-certificate \
  --certificate fileb://"${CRT}" \
  --certificate-chain fileb://"${CC}" \
  --private-key fileb://"${KEY}" \
  --certificate-arn "${ARN}" \
  --region "${REGION}"
```


## 参考サイト

- [証明書を再インポートする - AWS Certificate Manager](https://docs.aws.amazon.com/ja_jp/acm/latest/userguide/import-reimport.html)
- [import-certificate — AWS CLI 2.5.8 Command Reference](https://awscli.amazonaws.com/v2/documentation/api/latest/reference/acm/import-certificate.html)

## 環境

```console
% aws --version
aws-cli/2.5.8 Python/3.9.12 Darwin/21.4.0 source/x86_64 prompt/off
```
