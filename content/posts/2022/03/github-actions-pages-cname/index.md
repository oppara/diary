---
title: "GitHub Actions でカスタムドメインの Pages をデプロイすると 404 になってしまう"
date: 2022-03-13T11:23:05+09:00
tags: ["github", "actions", "pages"]
---

## 問題

GitHub Actions でデプロイすると、Custom domain の設定が初期化され、URL にアクセスしても 404 になってしまう。

## 対応方法

[cname option](https://github.com/peaceiris/actions-gh-pages#%EF%B8%8F-add-cname-file-cname) を設定する。

```yaml
  - name: Deploy
    uses: peaceiris/actions-gh-pages@v3
    if: ${{ github.ref == 'refs/heads/main' }}
    with:
      github_token: ${{ secrets.GITHUB_TOKEN }}
      cname: d.oppara.tv
```
