---
title: "シークレットを即時削除する"
date: 2026-05-30T08:47:25+09:00
tags: ["aws", "secret"]
---

## はじめに

AWS Secrets Manager のシークレットを即時削除したい。

## 手順

```shell
aws secretsmanager delete-secret \
  --secret-id "your-secret-name" \
  --force-delete-without-recovery
```

## 環境

```console
$ aws --version
aws-cli/2.34.54 Python/3.14.5 Linux/6.1.166-197.305.amzn2023.x86_64 exec-env/CloudShell exe/x86_64.amzn.2023
```
