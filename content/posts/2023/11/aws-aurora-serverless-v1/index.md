---
title: "CLI で Aurora Serverless V1 を作成する"
date: 2023-11-25T10:33:23+09:00
tags: ["AWS", "Aurora", "Serverless"]
---

## はじめに

マネジメントコンソールで Aurora Serverless V1 を作成できないので、AWS CLI の覚書。

## 手順


```shell
DATABASE_NAME="try_db"
DB_CLUSTER_IDENTIFIER="try-cluster"
VPC_SECURITY_GROUP_IDS="sg-016afba3d02181db5"
MASTER_USERNAME="admin"
MASTER_USER_PASSWORD="p4ssw0rd"
DB_SUBNET_GROUP_NAME="try-db-subnet-group"

aws rds create-db-cluster  \
  --database-name "${DATABASE_NAME}" \
  --db-cluster-identifier "${DB_CLUSTER_IDENTIFIER}" \
  --vpc-security-group-ids "${VPC_SECURITY_GROUP_IDS}" \
  --master-username "${MASTER_USERNAME}" \
  --master-user-password "${MASTER_USER_PASSWORD}" \
  --db-subnet-group-name "${DB_SUBNET_GROUP_NAME}" \
  --availability-zones  ap-northeast-1a ap-northeast-1c ap-northeast-1d \
  --engine aurora-mysql \
  --engine-version 5.7.mysql_aurora.2.08.3 \
  --engine-mode serverless \
  --scaling-configuration '{"MinCapacity":1,"MaxCapacity":2,"AutoPause":true,"SecondsUntilAutoPause":300,"TimeoutAction":"ForceApplyCapacityChange","SecondsBeforeTimeout":60}'
```

## 参考

- [Aurora Serverless v1 DB クラスターの作成 - Amazon Aurora](https://docs.aws.amazon.com/ja_jp/AmazonRDS/latest/AuroraUserGuide/aurora-serverless.create.html)
- [create-db-cluster — AWS CLI 2.13.38 Command Reference](https://awscli.amazonaws.com/v2/documentation/api/latest/reference/rds/create-db-cluster.html)

## 環境

```console
$ aws --version
aws-cli/2.13.35 Python/3.11.6 Linux/6.1.59-84.139.amzn2023.x86_64 exec-env/CloudShell exe/x86_64.amzn.2 prompt/off
```
