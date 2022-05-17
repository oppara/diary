---
title: "Wrangler で Cloudflare Workers"
date: 2022-05-17T22:08:35+09:00
tags: ['cdn', 'cloudflare']
---

## はじめに

[Wrangler（Workers CLI）](https://developers.cloudflare.com/workers/wrangler/)を使って [Cloudflare Workers](https://developers.cloudflare.com/workers/) を試してみる。

## Wrangler のインストール

```console
% npm install -g wrangler
```

## Cloudflare の認証

2 段階認証にもたもたしてたらタイムアウトしてしまった。

```console
% wrangler login
 ⛅️ wrangler 2.0.5
-------------------
Attempting to login via OAuth...
✘ [ERROR] Timed out waiting for authorization code, please try again.
```

もう一度。

```console
% wrangler login
 ⛅️ wrangler 2.0.5
-------------------
Attempting to login via OAuth...
```

ブラウザが起動し、ログイン、2 段階認証を通過すると以下の画面になるので、問題なければ[Allow]をクリック。
{{< figure src="authorize.png" alt="" >}}

承認。
{{< figure src="granted.png" alt="" >}}

## プロジェクトの作成

```console
% wrangler init my-worker -y
```

中身確認。
```console
% ls -1F my-worker
node_modules/
package-lock.json
package.json
src/
tsconfig.json
wrangler.toml

% cat my-worker/src/index.ts
/**
 * Welcome to Cloudflare Workers! This is your first worker.
 *
 * - Run `wrangler dev src/index.ts` in your terminal to start a development server
 * - Open a browser tab at http://localhost:8787/ to see your worker in action
 * - Run `wrangler publish src/index.ts --name my-worker` to publish your worker
 *
 * Learn more at https://developers.cloudflare.com/workers/
 */

export default {
  async fetch(request: Request): Promise<Response> {
    return new Response("Hello World!");
  },
};
```
## ローカルで実行

```console
% cd my-worker
% wrangler dev # または npm start

> my-worker@0.0.0 start
> wrangler dev

 ⛅️ wrangler 2.0.5
-------------------
⬣ Listening at http://localhost:59598

╭────────────────────────────────────────────╮
│ [b] open a browser, [d] open Devtools, [l] turn off local mode, [c] clear console, [x] to exit   │
╰────────────────────────────────────────────╯
```


## デプロイ

```console
% wrangler publish # または npm run publish
 ⛅️ wrangler 2.0.5
-------------------
Uploaded my-worker (0.61 sec)
Published my-worker (3.61 sec)
  my-worker.oppara.workers.dev
```

## 動作確認

```console
% curl https://my-worker.oppara.workers.dev
Hello World!
```

ログが見れる。

```console
% wrangler tail
 ⛅️ wrangler 2.0.5
-------------------
Successfully created tail, expires at 2022-05-17T20:19:21Z
Connected to my-worker, waiting for logs...
GET https://my-worker.oppara.workers.dev/ - Ok @ 5/17/2022, 11:19:47 PM
```

## 参考サイト

- [Wrangler (command line) · Cloudflare Workers docs](https://developers.cloudflare.com/workers/wrangler/)
- [Get started guide · Cloudflare Workers docs](https://developers.cloudflare.com/workers/get-started/guide/)

## 環境

```console
% wrangler --version
2.0.5

% sw_vers
ProductName:    macOS
ProductVersion: 12.3.1
BuildVersion:   21E258
```
