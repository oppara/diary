---
title: "VSCode で Markdown を扱う"
date: 2025-12-29T20:25:55+09:00
tags: ["vscode", "markdown"]
---

## はじめに

VSCode で Markdown を扱うための備呆録。

## インストールしたプラグイン

* [Markdown All in One](https://marketplace.visualstudio.com/items?itemName=yzhang.markdown-all-in-one)
* [Markdown Preview Enhanced](https://marketplace.visualstudio.com/items?itemName=shd101wyy.markdown-preview-enhanced)
* [markdownlint](https://marketplace.visualstudio.com/items?itemName=DavidAnson.vscode-markdownlint)

## 見出し (Table of Contents) の作成

見出しを作成したい行で、Cmd + Shift + p から `Markdown All in One: Create Table of Contents` を選択する。

目次にする範囲を制限する設定。

```json:settings.json
{
  "markdown.extension.toc.levels": "2..4"
}
```

## セクション番号の追加/削除

Cmd + Shift + p から `Markdown All in One: Add/Update section numbers` を選択する。

## プレビュー

* Cmd + Shift + p から ``Markdown Preview Enhanced: Open preview to the Side を選択する。
* もしくは Cmd + K V でプレビューをサイドに表示できる。
* 改行コードで改行させる設定。

```json:settings.json
{
  "markdown-preview-enhanced.breakOnSingleNewLine": true,
}
```

## PDF へのエクスポート

Markdown Preview Enhanced の画面を右クリックして、`Export -> Chrome(Puppeteer) -> PDF` を選択する。

## markdownlint の設定

```json:settings.json
{
  "[markdown]": {
    "editor.formatOnSave": true,
    "editor.defaultFormatter": "DavidAnson.vscode-markdownlint"
  },
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
