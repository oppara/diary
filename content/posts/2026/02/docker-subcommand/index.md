---
title: "コンテナの一覧を表示するコマンドを見やすくする"
date: 2026-02-08T10:36:50+09:00
tags: ["docker"]
---

## 問題

`docker ps -a` の実行結果が見づらい。

## 解決

以下、利用して、自分用のサブコマンドを作成する。  
[Dockerでカスタムsubcommandをあれする - 茅の下](https://ryooooooga.hateblo.jp/entry/2021/05/13/210743)

```shell
docker() {
    if [ "$#" -eq 0 ] || ! command -v "docker-$1" > /dev/null; then
        command docker "$@"
    elif (( ${+aliases[docker-$1]} )); then
        eval "${aliases[docker-$1]} ${(q)@:2}"
    else
        "docker-$1" "${@:2}"
    fi
}
```

## 手順

以下、エイリアスを設定する。

```shell
alias docker-psa="docker ps -a --format \"table {{.ID}}\t{{.Image}}\t{{.Names}}\t{{.Status}}\t{{.Ports}}\""
```

## 比較

```console
% docker ps -a
CONTAINER ID   IMAGE                      COMMAND                  CREATED       STATUS                        PORTS                                                                                                                                             NAMES
0f8b515ac1f3   jwilder/nginx-proxy        "/app/docker-entrypo…"   13 days ago   Up 36 minutes                 0.0.0.0:80->80/tcp, [::]:80->80/tcp                                                                                                               nginx-proxy
fe52095f8dfd   axllent/mailpit:v1.21.5    "/mailpit"               13 days ago   Up 36 minutes (healthy)       0.0.0.0:1025->1025/tcp, [::]:1025->1025/tcp, 0.0.0.0:8025->8025/tcp, [::]:8025->8025/tcp, 1110/tcp, 0.0.0.0:1080->8025/tcp, [::]:1080->8025/tcp   mailpit
c886759a486c   plantuml/plantuml-server   "/entrypoint.sh"         5 weeks ago   Exited (137) 40 minutes ago 
```

```console
% docker psa
CONTAINER ID   IMAGE                      NAMES                   STATUS                        PORTS
0f8b515ac1f3   jwilder/nginx-proxy        nginx-proxy             Up 36 minutes                 0.0.0.0:80->80/tcp, [::]:80->80/tcp
fe52095f8dfd   axllent/mailpit:v1.21.5    mailpit                 Up 36 minutes (healthy)       0.0.0.0:1025->1025/tcp, [::]:1025->1025/tcp, 0.0.0.0:8025->8025/tcp, [::]:8025->8025/tcp, 1110/tcp, 0.0.0.0:1080->8025/tcp, [::]:1080->8025/tcp
c886759a486c   plantuml/plantuml-server   plantuml-local-server   Exited (137) 40 minutes ago
```

## 環境

```console
% docker --version
Docker version 28.4.0, build d8eb465

% sw_vers
ProductName:            macOS
ProductVersion:         15.6
BuildVersion:           24G84
```
