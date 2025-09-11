---
title: "CLI で AWS IAM ユーザーを作成"
date: 2025-09-12T05:40:26+09:00
tags: ["aws", "iam"]
---

## はじめに

CLI で AWS IAM ユーザーを作成方法の備呆録

## 手順

ユーザー名を環境変数に設定する。

```console
USER_NAME="hoge”
```

ユーザーを作成する。

```console
aws iam create-user --user-name "${USER_NAME}"
```

ユーザーを admin グループに追加する。

```console
aws iam add-user-to-group --user-name "${USER_NAME}" \
  --group-name admin
```

パスワード更新必須で初期パスワード (p4ssw0rd) を設定する。

```console
aws iam create-login-profile --user-name "${USER_NAME}" \
  --password p4ssw0rd \
  --password-reset-required
```

アクセスキーを作成する。

```console
aws iam create-access-key --user-name "${USER_NAME}"
```

## 参考サイト

- [create-user — AWS CLI 2.29.1 Command Reference](https://docs.aws.amazon.com/cli/latest/reference/iam/create-user.html)

## 環境

```console
$ aws --version
aws-cli/2.28.26 Python/3.13.7 Linux/6.1.147-172.266.amzn2023.x86_64 exec-env/CloudShell exe/x86_64.amzn.2023
```
