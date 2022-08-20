---
title: "Trivy で AWS のセキュリティスキャンを行う"
date: 2022-08-21T07:45:32+09:00
draft: false
tags: ["aws", "trivy"]
---

## やり方

aws-vault を利用し、EC2 のセキュリティスキャンを行う場合。

```console
% aws-vault exec opp-dev -- trivy aws --service ec2
```

## ヘルプ

```console
% trivy aws --help
```

## 参考サイト

- [TrivyでAWSアカウントのセキュリティスキャンができるようになりました | DevelopersIO](https://dev.classmethod.jp/articles/aws-security-scan-by-trivy/)

## 環境

```console
% sw_vers
ProductName:    macOS
ProductVersion: 12.4
BuildVersion:   21F79

% trivy --version
Version: 0.31.2
```
