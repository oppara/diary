---
title: "GitLab CI 時でなくてもブランチ名を利用したい"
date: 2022-04-02T22:50:07+09:00
tags: ["gitlab", "ci", "git"]
---

## 目的

CI 時に呼び出すシェルスクリプト内で、CI 時でなくてもブランチ名を利用したい。

## 対応方法


```bash
#!/bin/bash
set -Ceu

if [ "${CI_COMMIT_REF_NAME:-UNDEF}" = "UNDEF" ]; then
  CI_COMMIT_REF_NAME=$(git rev-parse --abbrev-ref HEAD)
fi

## 以下の書き方は GitLab 16.0 以降使えなくなる
# if [ "${CI_BUILD_REF_NAME:-UNDEF}" = "UNDEF" ]; then
#   CI_BUILD_REF_NAME=$(git rev-parse --abbrev-ref HEAD)
# fi
```

## bash のオプション

* `C`: リダイレクト時に既存のファイルを上書きしない。
* `e`: コマンドがゼロ以外のステータスを返した場合、スクリプトを即座に終了する。
* `u`: 未定義の変数を参照時にエラー。

## 参考サイト

- [Deprecations by milestone | GitLab](https://docs.gitlab.com/ee/update/deprecations.html#ci_build_-predefined-variables)

