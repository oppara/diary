---
title: "colima を使ってみる"
date: 2026-02-07T20:16:58+09:00
tags: ["colima", "docker", "container"]
---

## はじめに

[Colima](https://github.com/abiosoft/colima) を使ってみたので備呆録。

## インストール

```console
brew install colima
```

## Docker のコンテキストを確認

```console
docker context ls
```

colima が選択されていない場合以下のコマンドで切り替える。

```console
docker context use colima
```

実行結果

```console
% docker context ls
NAME       DESCRIPTION                               DOCKER ENDPOINT                                    ERROR
colima *   colima                                    unix:///Users/oppara/.colima/default/docker.sock
default    Current DOCKER_HOST based configuration   unix:///var/run/docker.sock
```

## 使い方

起動

```console
colima start
```

状態確認

```console
colima status
```

停止

```console
colima stop
```

動作確認

```console
docker run --rm hello-world
`````

## 自動起動

システム起動時に自動起動させる。

```console
brew services start colima
```

status が started になるには少し時間がかかる。

```console
% brew services list 
Name             Status  User   File
colima           started oppara ~/Library/LaunchAgents/homebrew.mxcl.colima.plist
```


## 環境

```console
% colima --version
colima version 0.9.1

% docker --version
Docker version 28.4.0, build d8eb465

% sw_vers
ProductName:            macOS
ProductVersion:         15.6
BuildVersion:           24G84
```
