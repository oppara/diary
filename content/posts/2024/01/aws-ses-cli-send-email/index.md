---
title: "AWS CLIからテストメールを送信"
date: 2024-01-27T14:55:28+09:00
tags: ["aws", "cli", "ses", "email"]
---

## はじめに

AWS CLIからテストメールを送信する方法を備忘録。

## 手順

```console
$ to="test@example.com"
$ aws ses send-email \
  --from info@oppara.tv \
  --to "${to}" \
  --subject "件名" \
  --text "本文"
```


## 環境

```console
$ aws --version
aws-cli/2.15.13 Python/3.11.6 Linux/6.1.66-91.160.amzn2023.x86_64 exec-env/CloudShell exe/x86_64.amzn.2023 prompt/off
```
