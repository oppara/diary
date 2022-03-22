---
title: "Pandoc マークダウンを PDF に変換しようとしてエラー"
date: 2022-03-22T12:46:21+09:00
tags: ["pandoc", "markdown", "pdf"]
---

## 問題

マークダウンを PDF に変換しようとすると以下のエラー。

```console
% pandoc hoge.md -o hoge.pdf
pandoc: pdflatex: createProcess: posix_spawnp: illegal operation (Inappropriate ioctl for device)
```

## 対応方法

[wkhtmltopdf](https://wkhtmltopdf.org/) を使ってみる。


wkhtmltopdf のインストール。
```console
% brew install --cask wkhtmltopdf
```

マークダウンを PDF に変換する。
```console
% pandoc hoge.md -o hoge.pdf --pdf-engine wkhtmltopdf
```

## 環境

```console
% sw_vers
ProductName:    macOS
ProductVersion: 12.2
BuildVersion:   21D49

% pandoc --version
pandoc 2.17.1.1
```
