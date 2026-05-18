---
title: "VSCode で PlantUML を扱う"
date: 2025-12-30T12:22:11+09:00
tags: ["vscode", 'markdown', 'plantuml']
---

## はじめに

VSCode で PlantUML を扱うための備呆録。

## インストールしたプラグイン

- [PlantUML](https://marketplace.visualstudio.com/items?itemName=jebbs.plantuml)

## ローカルのサーバで動かす

java 等諸々のインストールが面倒なので Docker で plantuml-server を動かす。

```yaml
services:
  plantuml-server:
    image: plantuml/plantuml-server
    container_name: plantuml-local-server
    ports:
      - "9876:8080"
```

コンテナを立ち上げる。

```shell
docker compose up -d
```

## 設定

```json:settings.json
{
  "plantuml.render": "Local",
  "plantuml.server": "http://localhost:9876",
  "markdown-preview-enhanced.plantumlServer": "http://localhost:9876/svg/"
}
```

## 環境

```console
% code --version
1.107.1
994fd12f8d3a5aa16f17d42c041e5809167e845a
arm64

% sw_vers
ProductName:            macOS
ProductVersion:         15.6
BuildVersion:           24G84
```
