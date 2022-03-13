---
title: "yaml, toml, json, hclの変換ツール yj"
date: 2022-03-13T21:46:57+09:00
tags: ["cli", "yaml", "toml", "json", "hcl"]
---

## はじめに


yaml から toml への変換ツールを探していて良さげなものを発見したので使ってみる。

- [sclevine/yj: CLI - Convert between YAML, TOML, JSON, and HCL](https://github.com/sclevine/yj)

## インストール

```console
% brew install yj
```

## 使い方

標準入力から読み込ませてリダイレクトする感じ。

```console
% yj -yt -i < example.yaml > example.toml
```
or 

```console
% cat example.yaml | yj -yt -i > example.toml
```

## 環境

```console
% sw_vers
ProductName:    macOS
ProductVersion: 12.2
BuildVersion:   21D49

% yj -v
v5.0.0
```
