---
title: "Speedtest の CLI クライアントを試してみる"
date: 2022-03-14T21:16:06+09:00
tags: ["cli", "speedtest", "netowork"]
---

## はじめに

[speedtest.net](https://www.speedtest.net/) の [CLI クライアント](https://www.speedtest.net/apps/cli) があったので試してみる。

## インストール

```console
% brew install teamookla/speedtest/speedtest
```

## 初回実行

初回実行時は、ライセンスの確認がある。

```console
% speedtest
====================================================================

You may only use this Speedtest software and information generated
from it for personal, non-commercial use, through a command line
interface on a personal computer. Your use of this software is subject
to the End User License Agreement, Terms of Use and Privacy Policy at
these URLs:

        https://www.speedtest.net/about/eula
        https://www.speedtest.net/about/terms
        https://www.speedtest.net/about/privacy

=====================================================================

Do you accept the license? [type YES to accept]:
```

## サーバ選択の詳細を表示しながら実行

```console
% speedtest --selection-details

   Speedtest by Ookla

Selecting server:
      20976:   6.24 ms; GLBB Japan - Tokyo
      21569:   5.66 ms; i3D.net - Tokyo
      38241:   5.51 ms; BudgetVM - Tokyo
      28910: 212.52 ms; fdcservers.net - Tokyo
      48301:   5.96 ms; Cloudflare - Tokyo
      24333:  17.89 ms; Rakuten Mobile, Inc - Tokyo
      44988:   7.02 ms; Misaka Network, Inc. - Tokyo
      48463:   5.79 ms; IPA CyberLab 400G - Tokyo
      14623:   6.14 ms; IPA CyberLab - Bunkyo
       8407:  10.31 ms; Allied Telesis Capital Corporation - Sagamihara
     Server: BudgetVM - Tokyo (id = 38241)
        ISP: Softbank BB
    Latency:     5.63 ms   (0.76 ms jitter)
   Download:   117.23 Mbps (data used: 124.7 MB)
     Upload:   230.65 Mbps (data used: 134.4 MB)
Packet Loss:     0.0%
 Result URL: https://www.speedtest.net/result/c/xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx

 ```

## サーバ ID を指定して実行

```console
% speedtest -s 21569

   Speedtest by Ookla

     Server: i3D.net - Tokyo (id = 21569)
        ISP: Softbank BB
    Latency:     5.61 ms   (0.40 ms jitter)
   Download:   110.67 Mbps (data used: 69.7 MB)
     Upload:   219.27 Mbps (data used: 145.6 MB)
Packet Loss:     0.0%
 Result URL: https://www.speedtest.net/result/c/xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx
```
 
## 環境

```console
% sw_vers
ProductName:    macOS
ProductVersion: 12.2
BuildVersion:   21D49

% speedtest -V
Speedtest by Ookla 1.1.1.84 (3bdba79799) Darwin 21.3.0 x86_64
```
