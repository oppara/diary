---
title: "AWS Vault を使って MFA と AssumeRole（スイッチロール） "
date: 2022-03-17T23:01:07+09:00
tags: ["aws", "cli", "sts", "vault", "assumerole", "mfa"]
---

## はじめに

AWS Vault を使って MFA 経由で AssumeRole する備忘録。

[99designs/aws-vault](https://github.com/99designs/aws-vault)

## 前提

以下のアカウントを作成済みでスイッチロールの設定済み。

* oppara (default): スイッチ元 (MFA 認証)
* oppara-dev: スイッチ先

## 対応方法

### AWS Vault のインストール

```console
% brew cask install aws-vault
```

### AccessKeyId, SecretAccessKey をキーチェーンに登録

AWS Vault で生成するキーチェーンにアクセスする為のパスワード入力するダイアログが表示されるので設定する。

```console
% aws-vault add default
Enter Access Key Id: xxxxxxxxxxxxxxxxxxxx
Enter Secret Key: xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
```

Credential が登録されている。

```console
% aws-vault list
Profile                  Credentials              Sessions
=======                  ===========              ========
default                  default                  -
```

### ~/.aws/config の設定

```toml
[default]
output=json
region=ap-northeast-1

[profile oppara-dev]
source_profile=default
mfa_serial=arn:aws:iam::xxxxxxxxxxxx:mfa/oppara
role_arn=arn:aws:iam::zzzzzzzzzzzz:role/<ロール名>
```
* `mfa_serial`:  スイッチ元アカウントの「MFA デバイスの割り当て」
* `role_arn`:  スイッチ時に使用するスイッチ先アカウントの IAM ロールの ARN

## 実行

oppara-dev アカウントの S3 バケット一覧を表示する。  
- aws-vaultキーチェーンへアクセスする為のパスワードを入力する
- MFA コードを入力するよう求められるので入力する  
素の AWS CLI と違い入力したコードが表示されるので入力が楽 😆

```console
% aws-vault exec oppara-dev -- aws s3 ls
Enter MFA code for arn:aws:iam::xxxxxxxxxxxx:mfa/oppara:
2021-07-01 23:13:48 cdk-hnb659fds-assets-552376481266-ap-northeast-1
2020-06-10 00:58:26 cf-templates-8pyd86xx4vzz-ap-northeast-1
2021-05-31 01:18:49 rain-artifacts-552376481266-ap-northeast-1
```

セッションができている。

```console
% aws-vault list
Profile                  Credentials              Sessions
=======                  ===========              ========
default                  default                  -
oppara-dev               -                        sts.AssumeRole:37m15s
```

セッションが切れるまでは、コマンドを実行しても MFA コードの入力は求められない。  
便利 😆

```console
% aws-vault exec oppara-dev -- aws s3 ls
2021-07-01 23:13:48 cdk-hnb659fds-assets-552376481266-ap-northeast-1
2020-06-10 00:58:26 cf-templates-8pyd86xx4vzz-ap-northeast-1
2021-05-31 01:18:49 rain-artifacts-552376481266-ap-northeast-1
```

## 環境

```console
% sw_vers
ProductName:    macOS
ProductVersion: 12.2
BuildVersion:   21D49

% aws-vault --version
v6.6.0
```
