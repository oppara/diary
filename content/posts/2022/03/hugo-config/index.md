---
title: "Hugo の設定"
date: 2022-03-09T11:14:47+09:00
toc: false
tags: ["hugo"]
---

[Configure Hugo | Hugo](https://gohugo.io/getting-started/configuration/)

## 日本語周り

```toml
# デフォルトの言語設定
defaultContentLanguage = "ja"

# <language> エレメント用の値
languageCode = "ja"

# 日本語の文字数を正しく数えて、短いサマリーを表示できるようにする
hasCJKLanguage = true

# リスト内のタイトルを複数化しない
pluralizeListTitles = false

# timezone
timeZone = "Asia/Tokyo"
```

## テーマ [PaperMod](https://github.com/adityatelange/hugo-PaperMod/wiki/Variables) の設定

```toml
[Params]
  # 著者名
  author = "oppara"

  # 日付のフォーマット
  dateformat = "2006-01-02"

  # リストページに表示される投稿毎の要約を非表示にする
  hideSummary = true

  # リストページに1つめに表示される投稿のデザインを他の投稿のデザインと同じにする
  disableSpecial1stPost = true

  # 投稿ページで目次を表示する
  ShowToc = true

  # パン屑メニューを表示する
  ShowBreadCrumbs = true

  # 投稿ページの下部にナビゲーションリンクを表示する
  ShowPostNavLinks = true
```
## 環境

```console
% sw_vers
ProductName:    macOS
ProductVersion: 12.2
BuildVersion:   21D49

% hugo version
hugo v0.93.3+extended darwin/amd64 BuildDate=unknown
```
