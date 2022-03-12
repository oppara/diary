---
title: "--editor オプション付きで hugo new するとエラーになる"
date: 2022-03-10T12:57:57+09:00
tags: ["hugo"]
---

## 問題

`--editor` オプション付きで `hugo new` すると以下のエラーになってしまう。

```console
% hugo new posts/2022/03/hoge/index.md --editor vim
Content "/path/to/hugo/content/posts/2022/03/hoge/index.md" created
Editing "/path/to/hugo/content/posts/2022/03/hoge/index.md" with "vim" ...
Error: access denied: "vim" is not whitelisted in policy "security.exec.allow"; 
the current security configuration is:

[security]
  enableInlineShortcodes = false
  [security.exec]
    allow = ['^dart-sass-embedded$', '^go$', '^npx$', '^postcss$']
    osEnv = ['(?i)^(PATH|PATHEXT|APPDATA|TMP|TEMP|TERM)$']

  [security.funcs]
    getenv = ['^HUGO_']

  [security.http]
    methods = ['(?i)GET|POST']
    urls = ['.*']

```

## 対応方法

以下の設定を `confg.toml` に追加する。


```toml:confg.toml
[security]
  [security.exec]
    allow = ['^vim$']
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
