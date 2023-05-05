---
title: "XDG Base Directory のデフォルト値まとめ"
date: 2023-04-26T23:49:07+09:00
tags: ["linux", "xdg"]
---

## はじめに

XDG_ほにゃららの環境変数のデフォルト値を忘れてしまうのでまとめ。

## まとめ

### XDG_CONFIG_HOME

ユーザー個別の設定が書き込まれるディレクトリ。

```
echo "${XDG_CONFIG_HOME:-$HOME/.config}"
```

### XDG_DATA_HOME

ユーザー個別のデータファイルが書き込まれるディレクトリ。

```
echo "${XDG_DATA_HOME:-$HOME/.share}"
```
### XDG_STATE_HOME

ユーザー個別の状態ファイルをが書き込まれるディレクトリ。

```
echo "${XDG_STATE_HOME:-$HOME/.state}"
```
### XDG_CACHE_HOME

ユーザー個別の重要でない (キャッシュ) データが書き込まれるディレクトリ。

```
echo "${XDG_CACHE_HOME:-$HOME/.cache}"
```

## 参考サイト

- [XDG Base Directory - ArchWiki](https://wiki.archlinux.jp/index.php/XDG_Base_Directory)

