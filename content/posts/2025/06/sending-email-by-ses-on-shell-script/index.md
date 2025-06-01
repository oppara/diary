---
title: "シェルスクリプトを使用して、AWS SESでメールを送信する"
date: 2025-06-01T09:30:25+09:00
tags: ["ses", "shellscript", "shell"]
---

## はじめに

シェルスクリプトを使用して、AWS SES でメールを送信する備呆録。

## 手順

```bash
#!/usr/bin/env bash
set -CEeuo pipefail

SES_FROM="admin@oppara.tv"
SES_TO="admin@oppara.tv"
SES_REGION="ap-northeast-1"

SES_SUBJECT="テストメール from SES"
SES_BODY="ほげほげ"

aws ses send-email \
    --from "$SES_FROM" \
    --destination "ToAddresses=$SES_TO" \
    --message "Subject={Data=$SES_SUBJECT,Charset=utf-8},Body={Text={Data=$SES_BODY,Charset=utf-8}}" \
    --region "$SES_REGION"
```

## 環境

```console

% aws --version
aws-cli/2.27.26 Python/3.13.3 Darwin/24.3.0 source/arm64
```
