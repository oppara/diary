---
title: "スムーズに Hugo でブログを書くツール"
date: 2022-03-11T14:35:32+09:00
tags: ["hugo"]
---

## はじめに

`hugo vim editor`で検索していたら以下の b4b4r07 さんの良さげなブログを発見。

[スムーズに Hugo でブログを書くツール | tellme.tokyo](https://tellme.tokyo/post/2018/10/16/write-blog-smoothly/)


上記ブログで使用されている [b4b4r07/blog](https://github.com/b4b4r07/blog) を使用するには、以下の環境変数の設定が必要な模様。

- BLOG_ROOT: `hugo new site`でできたディレクトリのパスを指定。
- BLOG_POST_DIR: 記事を作成するディレクトリ。BLOG_ROOT からの相対パスを指定。

## 設定例

```sh
export BLOG_ROOT="${HOME}/src/github.com/oppara/d.oppara.tv"
export BLOG_POST_DIR=`date +"content/posts/%Y/%m"`
```

## `blog new` で作成される日付を JST にしたい

The 力技。

```diff:
diff --git a/cmd/new.go b/cmd/new.go
index 4996bfb..85d597e 100644
--- a/cmd/new.go
+++ b/cmd/new.go
@@ -69,7 +69,7 @@ func (c *newCmd) run(args []string) error {
                Command: "hugo",
                Args:    []string{"new", strings.TrimPrefix(next, "content/")},
                Dir:     c.RootPath,
-               Env:     map[string]string{},
+               Env:     map[string]string{"TZ":"Asia/Tokyo"},
                Stdin:   os.Stdin,
                Stdout:  ioutil.Discard,
                Stderr:  ioutil.Discard,
```
https://github.com/oppara/b4b4r07-blog/commit/1b653d83f0352d0bc06e9b1e737ec292c85989e1


---

{{<collapse summary="環境">}}

```console
% sw_vers
ProductName:    macOS
ProductVersion: 12.2
BuildVersion:   21D49

% hugo version
hugo v0.94.0+extended darwin/amd64 BuildDate=unknown
```
{{</collapse>}}
