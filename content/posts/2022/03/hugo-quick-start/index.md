---
title: "Hugo 事始め"
date: 2022-03-08T00:39:07+09:00
draft: false
toc: false
tags: ['hugo']
---

[Quick Start | Hugo](https://gohugo.io/getting-started/quick-start/)

とりあえずテーマをインストールしてコンテンツを表示するところまで。


## Hugo のインストール

```console
% brew install hugo
```

## サイトの作成

```console
% hugo new site d.oppara.tv
```

## テーマの追加

[PaperMod](https://github.com/adityatelange/hugo-PaperMod) というテーマを使ってみる。

```console
% cd d.oppara.tv
% git init
% git add .
% git commit  -m 'feat: initial commit'
% git submodule add  https://github.com/adityatelange/hugo-PaperMod.git themes/PaperMod
% echo theme = \"PaperMod\" >> config.toml
% git add .
% git commit  -m 'fead: add theme'
```

### テーマの更新

```console
% git submodule update --remote --merge
```

### テーマの削除

```console
% git submodule deinit -f themes/PaperMod
% git rm -f themes/PaperMod
% rm -rf .git/modules/themes*
```

## コンテンツの作成

```console
% hugo new posts/hoge.md
% echo 'hogehoge' >> content/posts/hoge.md
```

`.hugo_build.lock`をバージョン管理外にする。

```console
% echo '.hugo_build.lock' > .gitignore
% git add .gitignore
% git commit -m 'Add .gitignore'

```

## サーバの起動

```console
% hugo server -D
```

## ブラウザで動作確認

```console
% open http://localhost:1313/
```


---

{{<collapse summary="環境">}}

```console
% sw_vers
ProductName:    macOS
ProductVersion: 12.2
BuildVersion:   21D49

% hugo version
hugo v0.93.3+extended darwin/amd64 BuildDate=unknown
```
{{</collapse>}}
