---
title: "git log のエイリアス"
date: 2022-03-14T21:59:21+09:00
tags: ["git"]
---

## 問題

`git log`の表示が寂しい。

## 対応

好みのログを表示するエイリアスを設定する。

### Git のエイリアス

```ini
; ~/.gitconfig
[alias]
    ll = log --graph --color \
        --pretty=format:'%C(red)%x09%h %C(yellow)%cn %C(green)%ci %C(reset)%s%C(blue)%d%C(reset)'
```

| format                | 解説
|-----------------------|----------------------------------|
| `%C(red)%x09%h`       | 9 文字空けて省略されたコミットハッシュを赤で表示        |
| `%C(yellow)%cn`       | コミッターの名前を黄色で表示                   |
| `%C(green)%ci`        | コミットした日時を ISO8601 ぽい形式で緑で表示      |
| `%C(reset)%s`         | 表示色をリセットし、件名（コミットメッセージの 1 行目）を表示 |
| `%C(blue)%d%C(reset)` | ref name を青で表示し、再度表示色をリセット       |

本家の解説ページ  
[Git - pretty-formats Documentation](https://git-scm.com/docs/pretty-formats)


### シェルのエイリアス

とりあえず、10 行だけ欲しい。

```bash
alias gl="git ll | head -10 && echo"
```

## 実行結果

{{< figure src="git-log.png" alt="" >}}



## 環境

```console
% sw_vers
ProductName:    macOS
ProductVersion: 12.2
BuildVersion:   21D49

% git --version
git version 2.35.1
```
