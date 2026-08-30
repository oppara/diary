# CLAUDE.md

このリポジトリ（Hugo ブログ）での Claude Code 作業ルール

## Git Commit Messages

### ルール

コミットする場合は、必ずコミットメッセージの確認をしてから実行してください。

### 新規ポスト追加時

新しいブログポスト（`content/posts/YYYY/MM/dirname/`）を追加する際のコミットメッセージ形式：

```
feat(post): add <ポストのディレクトリ名>
```

**例**
- `feat(post): add hugo-config`
- `feat(post): add cc-scroll-keybindings`
- `feat(post): add aws-ec2-describe-ipaddress`

---

## その他の変更

その他のコミットメッセージは `dot.gitmessage` の Conventional Commits 規約に従います。
- https://www.conventionalcommits.org/ja/v1.0.0/
