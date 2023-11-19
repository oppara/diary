---
title: "Next.js で IP アドレスを使用したアクセス制限を行う"
date: 2023-11-20T06:22:12+09:00
tags: ["nextjs"]
---

## 対応方法

middleware を使用する。

```typescript:middleware.ts
// middleware.ts

import { NextResponse, NextRequest } from 'next/server';

const validAddresses = new Set();
if (process.env.VALID_IP_ADDRESSES) {
  process.env.VALID_IP_ADDRESSES!.split(',').forEach((address) => {
    validAddresses.add(address.trim());
  })
}

export function middleware(req: NextRequest) {
  let ip: string = req.ip ?? req.headers.get('x-real-ip') ?? '';
  // with CDN or LB or next dev
  if (!ip && req.headers.get('x-forwarded-for')) {
    ip = req.headers.get('x-forwarded-for')?.split(',')[0] ?? '';
  }

  if (!validAddresses.has(ip)) {
    const tmp = {
      status: 403,
      url: req.url,
      host: req.nextUrl.host,
    };
    console.log(JSON.stringify(tmp));

    return new NextResponse(null, { status: 401 });
  }

  return NextResponse.next();
};
```

```bash
# .env.local

VALID_IP_ADDRESSES=127.0.0.1,::1
```

## 環境

```console
% npx next -v
Next.js v14.0.3
```
