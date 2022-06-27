---
title: "DynamoDB をローカル環境で使いたい"
date: 2022-06-28T07:26:34+09:00
draft: false
tags: ["aws", "dynamodb", "docker"]
---

## 目的

DynamoDB をローカル環境で使いたい。

## 対応方法

[DynamoDB ローカルを Docker で動かす](https://docs.aws.amazon.com/ja_jp/amazondynamodb/latest/developerguide/DynamoDBLocal.DownloadingAndRunning.html#docker)

```yaml:docker-compose.yaml
version: '3.8'
services:
  dynamodb-local:
    command: "-jar DynamoDBLocal.jar -sharedDb -dbPath ./data"
    image: "amazon/dynamodb-local:latest"
    container_name: dynamodb-local
    ports:
      - "8888:8000"
    volumes:
      - "./docker/dynamodb:/home/dynamodblocal/data"
    working_dir: /home/dynamodblocal
```

### 起動

```console
% docker-compose up -d
```

### テーブルを作成してみる

```console
% export AWS_DEFAULT_REGION=us-west-2
% export ENDPOINT="http://localhost:8888"

% aws dynamodb create-table \
    --table-name sessions \
    --endpoint-url "${ENDPOINT}" \
    --attribute-definitions \
        AttributeName=id,AttributeType=S \
    --key-schema \
        AttributeName=id,KeyType=HASH \
    --billing-mode PAY_PER_REQUEST \
    --table-class STANDARD

```

## 環境

```console
% sw_vers
ProductName:    macOS
ProductVersion: 12.4
BuildVersion:   21F79
```
