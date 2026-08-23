---
title: "Claude Code でキーボードでスクロール"
date: 2026-08-23T04:11:54+09:00
draft: true
tags: ["claudecode"]
---

## はじめに

Claude Code でキーボードでスクロールしたい。

## 手順

### フルスクリーンモードにする

```console
/tui fullscreen
```

```json:~/.claude/settings.json
{
  "tui": "fullscreen"
}
```

### キーバインド設定を行う

```console
/keybindings
```

```json:~/.claude/keybindings.json
{
  "bindings": [
    {
      "context": "Scroll",
      "bindings": {
        "alt+j": "scroll:lineDown",
        "alt+k": "scroll:lineUp"
      }
    }
  ]
}
```

## 環境

```console
❯ sw_vers
ProductName:        macOS
ProductVersion:     26.5.2
BuildVersion:       25F84

❯ claude -v
2.1.231 (Claude Code)
```
