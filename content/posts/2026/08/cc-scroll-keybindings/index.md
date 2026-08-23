---
title: "Claude Code をキーボードでスクロール"
date: 2026-08-23T04:11:54+09:00
tags: ["claudecode"]
---

## はじめに

Claude Code をキーボード操作でスクロールできたので備呆録。

## 手順

### フルスクリーンモードにする

`~/.claude/settings.json` に以下を追記する。

```json:~/.claude/settings.json
{
  "tui": "fullscreen"
}
```

### キーバインド設定を行う

`~/.claude/keybindings.json` に以下を追記する。

- Chat コンテキストで `ctrl+j` の設定（改行を挿入する）を無効にする。
- Scroll コンテキストで `ctrl+j`/`ctrl+k` を上下スクロールに割り当てる。

```json:~/.claude/keybindings.json
{
  "bindings": [
    {
      "context": "Chat",
      "bindings": {
        "ctrl+j": null
      }
    },
    {
      "context": "Scroll",
      "bindings": {
        "ctrl+j": "scroll:lineDown",
        "ctrl+k": "scroll:lineUp"
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
