---
title: "npx 実行時に Ok to proceed? (y) と表示させない"
date: 2022-05-10T21:28:23+09:00
tags: ["nodejs", "npm", "npx"]
---

## 問題

npx 実行時に`y`とたたくのが面倒、もしくはたたくこと自体を忘れてしまう。

```console
% npx cowsay foo
Need to install the following packages:
  cowsay
Ok to proceed? (y)
```


## 対応方法

`--yes`をつける。(キャッシュを有効にする?)

```console
% npx --yes cowsay foo
 _____
< foo >
 -----
        \   ^__^
         \  (oo)\_______
            (__)\       )\/\
                ||----w |
                ||     ||
```

以後、`--yes`をつけなくても`Ok to proceed? (y)`は表示されない。

```console
% npx  cowsay foo
 _____
< foo >
 -----
        \   ^__^
         \  (oo)\_______
            (__)\       )\/\
                ||----w |
                ||     ||
```

キャッシュをクリアすると、`Ok to proceed? (y)`が復活する。

```console
% npx --yes clear-npx-cache

% npx  cowsay foo
Need to install the following packages:
  cowsay
Ok to proceed? (y)
 _____
< foo >
 -----
        \   ^__^
         \  (oo)\_______
            (__)\       )\/\
                ||----w |
                ||     ||
```
## まとめ

`--yes` 5 文字か、`y` 1 文字か...


## 参考サイト

- [npx | npm Docs](https://docs.npmjs.com/cli/v7/commands/npx)


## 環境

```console
% npm --version
8.6.0
```
