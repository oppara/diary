---
title: "Session Manager で Amazon Linux にログイン後ユーザーを切り替える"
date: 2022-03-15T22:31:09+09:00
draft: true
tags: ["aws", "ssm"]
---

## はじめに

Session Manager で EC2 上の Amazon Linux にログイン後、他のユーザーになるための備忘録。

ログイン時は`ssm-user`

```console
sh-4.2$ whoami
ssm-user
```

## 対応方法

### ec2-user になる

```console
sh-4.2$ sudo su --login ec2-user
```

### root になる

```console
sh-4.2$ sudo su --login
```

## 環境

```console
sh-4.2$ cat /etc/system-release
Amazon Linux release 2 (Karoo)

sh-4.2$ amazon-ssm-agent -version
SSM Agent version: 3.0.1124.0
```
