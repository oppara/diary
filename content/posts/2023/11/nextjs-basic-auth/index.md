---
title: "Next.js で Basic 認証をかける"
date: 2023-11-20T06:32:13+09:00
tags: ["nextjs"]
---

## 対応方法

middleware を使用する。

```typescript:middleware.ts
// middleware.ts

import { NextResponse, NextRequest } from 'next/server';

export const config = {
  // /hoge/ 以下のパスに対して Basic 認証をかける
  matcher: ['/hoge/:path*'],
}

export function middleware(req: NextRequest) {

  const basicAuth = req.headers.get('authorization');
  if (basicAuth) {
    const authValue = basicAuth.split(' ')[1];
    const [user, password] = atob(authValue).split(':');
    if (user === process.env.BASIC_AUTH_USER 
      && password === process.env.BASIC_AUTH_PASSWORD) {
      return NextResponse.next();
    }
  }

  return new NextResponse('Unauthorized', {
    status: 401,
    headers: {
      'WWW-Authenticate': 'Basic realm="Secure Area"',
    },
  });
};
```

```bash
# .env.local

BASIC_AUTH_USER=foo
BASIC_AUTH_PASSWORD=bar
```

## 環境

```console
% npx next -v
Next.js v14.0.3
```
