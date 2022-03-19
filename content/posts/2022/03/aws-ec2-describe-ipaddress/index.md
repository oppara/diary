---
title: "EC2インスタンスのタグとプライベートIPアドレスを表示する"
date: 2022-03-19T22:59:39+09:00
tags: ["aws", "ec2"]
---

```bash
#!/usr/bin/env bash
set -e

desc() {
  while read -r line
  do
    set ${line}
    name=${1}
    ip=${2}

    echo "${name}: ${ip}"
  done
}

aws ec2 describe-instances --filter "Name=instance-state-name,Values=running" \
  | jq -r '.Reservations[].Instances[] | [(.Tags[] | select(.Key=="Name").Value), .PrivateIpAddress] | @tsv' \
  | desc
```

`ec2:DescribeInstances`ポリシーが必要。

## 環境

```console
% sw_vers
ProductName:    macOS
ProductVersion: 12.2
BuildVersion:   21D49

% aws --version
aws-cli/2.4.26 Python/3.9.10 Darwin/21.3.0 source/x86_64 prompt/off
```
