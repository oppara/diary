---
title: "AWS CLI で AWS Backup を利用した EC2 のバックアップ設定をする"
date: 2022-03-21T18:13:28+09:00
tags: ["aws", "backup", "ec2"]
---

## はじめに

AWS CLI で AWS Backup を利用した EC2 のバックアップ設定の備忘録。



## デフォルトのロールの作成

1 つもバックアッププランがない状態で、cli 経由でバックリソースを作成した場合、デフォルトのロール ( AWSBackupDefaultServiceRole ) は自動で作成されないので注意。  
（マネコンからバックアップリソース作成時、IAM ロールで「デフォルトのロール」を選択した場合はデフォルトのロールが作成される）


### ロール作成用のシェルスクリプト

- 名前: AWSBackupDefaultServiceRole
- 信頼されたエンティティAWS のサービス: backup.amazonaws.com
- ポリシー:
  - AWSBackupServiceRolePolicyForRestores
  - AWSBackupServiceRolePolicyForBackup

{{< collapse summary="表示" >}}


```bash
#!/bin/bash
set -eu

ROLE_NAME="AWSBackupDefaultServiceRole" 

# IAM ロールを作成
aws iam create-role \
--role-name "${ROLE_NAME}" \
--assume-role-policy-document file://backup-role-policy.json

# AWSBackupServiceRolePolicyForBackup ポリシーをアタッチ
aws iam attach-role-policy \
--role-name "${ROLE_NAME}" \
--policy-arn arn:aws:iam::aws:policy/service-role/AWSBackupServiceRolePolicyForBackup

# AWSBackupServiceRolePolicyForRestores ポリシーをアタッチ
aws iam attach-role-policy \
--role-name "${ROLE_NAME}" \
--policy-arn arn:aws:iam::aws:policy/service-role/AWSBackupServiceRolePolicyForRestores

# EC2 のバックアップをする場合、以下のインラインポリシーを追加する必要あり
aws iam put-role-policy \
--role-name "${ROLE_NAME}" \
--policy-name ec2-backup-policy \
--policy-document  file://ec2-backup-policy.json
```

backup-role-policy.json
```json
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Allow",
      "Principal": {
        "Service": "backup.amazonaws.com" 
      },
      "Action": "sts:AssumeRole" 
    }
  ]
}
```
ec2-backup-policy.json
```json
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Allow",
      "Action": "ec2:DescribeFastSnapshotRestores",
      "Resource": "*" 
    },
    {
      "Effect": "Allow",
      "Action": "iam:PassRole",
      "Resource": "arn:aws:iam::<アカウントID>:role/service-role/AWSBackupDefaultServiceRole" 
    }
  ]
}
```
{{< /collapse >}}

## EC2 バックアップの CLI 実行例

前提: デフォルトのロール ( AWSBackupDefaultServiceRole ) は作成済み。

### 1. バックアップボールトを作成

```console
% aws backup create-backup-vault \
    --backup-vault-name <バックアップボールト名> \
    --encryption-key-arn <サーバー側で暗号化する際の KMS の暗号化キーの ARN>
{
    "BackupVaultName": "バックアップボールト名",
    "BackupVaultArn": "作成されたバックアップボールトの ARN>",
    "CreationDate": "YYYY-MM-DDThh:mm:ss+09:00" 
}
```

### 2. バックアッププランを作成

```console
$ aws backup create-backup-plan --backup-plan file://backup-plan.json
{
    "BackupPlanId": "作成されたバックアッププランの ID",
    "BackupPlanArn": "作成されたバックアッププランの ARN",
    "CreationDate": "YYYY-MM-DDThh:mm:ss+09:00",
    "VersionId": "xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx" 
}
```

backup-plan.json
```json (JST 03:03 にバックアップ実行し 5 日間保存)
{
  "BackupPlanName": "<バックアッププラン名>",
  "Rules": [
    {
      "RuleName": "<バックアップルール名>",
      "TargetBackupVaultName": "<作成したバックアップボールト名>",
      "ScheduleExpression": "cron(3 18 ? * * *)",
      "StartWindowMinutes": 120,
      "CompletionWindowMinutes": 300,
      "Lifecycle": {
        "DeleteAfterDays": 5
      }
    }
  ]
}
```

### 3. バックアップリソースの割り当て

```console
$ aws backup create-backup-selection \
    --backup-plan-id <作成されたバックアッププランの ID> \
    --backup-selection file://backup-selection.json
{
    "SelectionId": "作成されたセレクションの ID",
    "BackupPlanId": "作成されたバックアッププランの ID",
    "CreationDate": "YYYY-MM-DDThh:mm:ss+09:00" 
}
```

backup-selection.json (EC2 インスタンスをバックアップする)
```json
{
  "SelectionName": "ec2-prod",
  "IamRoleArn": "AWSBackupDefaultServiceRole の ARN",
  "Resources": [
    "バックアップを設定する EC2 インスタンスの ID>" 
  ],
  "ListOfTags": []
}
```

## 参考サイト

- [backup — AWS CLI 2.4.27 Command Reference](https://awscli.amazonaws.com/v2/documentation/api/latest/reference/backup/index.html)

## 環境

```console
% sw_vers
ProductName:    macOS
ProductVersion: 12.2
BuildVersion:   21D49

% aws --version
aws-cli/2.4.26 Python/3.9.10 Darwin/21.3.0 source/x86_64 prompt/off
```
