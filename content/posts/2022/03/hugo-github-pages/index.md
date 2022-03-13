---
title: "Hugo で作成した記事を GitHub Pages で公開する"
date: 2022-03-12T16:08:15+09:00
tags: ["hugo", "github"]
---

## DNS の設定

`d.oppara.tv`の CNAME を`oppara.github.io`に設定する。

```console
% dig d.oppara.tv @8.8.8.8
...
;; ANSWER SECTION:
d.oppara.tv.            3600    IN      CNAME   oppara.github.io.
oppara.github.io.       3600    IN      A       185.199.108.153
oppara.github.io.       3600    IN      A       185.199.111.153
oppara.github.io.       3600    IN      A       185.199.109.153
oppara.github.io.       3600    IN      A       185.199.110.153
...
```

## GitHub Actions を設定する

[GitHub Actions による GitHub Pages への自動デプロイ - Qiita](https://qiita.com/peaceiris/items/d401f2e5724fdcb0759d)

変更箇所

- `pull_request:`を削除
- hugo のバージョンを 0.94.0 に変更
- `publish_dir: ./public`を削除
  - gh-pages ブランチの直下にデプロイする。
- [cname option](https://github.com/peaceiris/actions-gh-pages#%EF%B8%8F-add-cname-file-cname) を設定
  - **重要** 設定しないとデプロイ時に Custom domain の設定が初期化され、URL にアクセスしても 404 になってしまう。

## GitHub の設定

Settings -> Pages

{{< figure src="githu-pages.png" alt="GitHub Pages の設定" >}}

