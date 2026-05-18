---
title: "AWS CLI でセキュリティグループのインバウンドルールを追加する"
date: 2026-02-18T21:33:21+09:00
tags: ["aws", "cli"]
---

## はじめに

AWS CLI で SG のインバウンドルールを追加することがあったので備呆録。  
量が多かったのでシェルスクリプト化。

## 手順

以下実行。

```bash
#!/usr/bin/env bash
set -CEeuo pipefail

SG_ID="sg-xxxxxxxxxxxxxxxxx"
PORT=443
DESC="hogehoge"

declare -A CIDRS
CIDRS["127.0.0.1/32"]="${DESC}"
# CIDRS["127.0.0.1/32"]="${DESC}"

for CIDR in "${!CIDRS[@]}"; do
  aws ec2 authorize-security-group-ingress \
    --group-id "$SG_ID" \
    --ip-permissions "[
      {
        \"IpProtocol\": \"tcp\",
        \"FromPort\": $PORT,
        \"ToPort\": $PORT,
        \"IpRanges\": [
          {
            \"CidrIp\": \"$CIDR\",
            \"Description\": \"${CIDRS[$CIDR]}\"
          }
        ]
      }
    ]"
done
```

## 参考サイト

- [authorize-security-group-ingress](https://docs.aws.amazon.com/cli/latest/reference/ec2/authorize-security-group-ingress.html)

## 環境

```console
$ aws --version
aws-cli/2.33.23 Python/3.13.11 Linux/6.1.159-182.297.amzn2023.x86_64 exec-env/CloudShell exe/x86_64.amzn.2023
```
