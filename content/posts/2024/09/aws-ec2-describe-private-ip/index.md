---
title: "運用中で指定した名前の EC2 のプライベートアドレスを取得する"
date: 2024-09-02T23:40:15+09:00
tags: ["aws", "ec2"]
---

```bash
TARGET_TAG="hoge"
aws ec2 describe-instances \
    --filter "Name=instance-state-name,Values=running" "Name=tag:Name,Values=${TARGET_TAG}" \
    | jq -r '.Reservations[].Instances[] | .PrivateIpAddress '
```

`ec2:DescribeInstances`ポリシーが必要。

## 環境

```console
$ aws --version
aws-cli/2.17.41 Python/3.11.9 Linux/6.1.102-111.182.amzn2023.x86_64 exec-env/CloudShell exe/x86_64.amzn.2023
```
