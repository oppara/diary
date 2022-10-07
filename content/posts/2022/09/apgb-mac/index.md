---
title: "APG4b を Mac  上で確認したい"
date: 2022-09-24T22:12:03+09:00
draft: false
tags: ["atcoder", "mac", "c++", "vim"]
---

## 目的

[C++入門 AtCoder Programming Guide for beginners (APG4b)](https://atcoder.jp/contests/apg4b) の解答を Mac 上で確認したい。

## 対応方法

以下のファイルを作成して  
~/apg4b/include/bits/stdc++.h

```cpp
#include <iostream> // cout, endl, cin
#include <string> // string, to_string, stoi
#include <vector> // vector
#include <algorithm> // min, max, swap, sort, reverse, lower_bound, upper_bound
#include <utility> // pair, make_pair
#include <tuple> // tuple, make_tuple
#include <cstdint> // int64_t, int*_t
#include <cstdio> // printf
#include <map> // map
#include <queue> // queue, priority_queue
#include <set> // set
#include <stack> // stack
#include <deque> // deque
#include <unordered_map> // unordered_map
#include <unordered_set> // unordered_set
#include <bitset> // bitset
#include <cctype> // isupper, islower, isdigit, toupper, tolower

```

パスに追加しておく。
```
export CPLUS_INCLUDE_PATH=$CPLUS_INCLUDE_PATH:${HOME}/apg4b/include/
```

## 実行

[quickrun](https://github.com/thinca/vim-quickrun) で実行！

{{< figure src="ss.png" alt="" >}}


## 参考サイト

- [手元のコンピュータでプログラムを書きたい場合](https://atcoder.jp/contests/apg4b/tasks/APG4b_ak#:~:text=%E6%89%8B%E5%85%83%E3%81%AE%E3%82%B3%E3%83%B3%E3%83%94%E3%83%A5%E3%83%BC%E3%82%BF%E3%81%A7%E3%83%97%E3%83%AD%E3%82%B0%E3%83%A9%E3%83%A0%E3%82%92%E6%9B%B8%E3%81%8D%E3%81%9F%E3%81%84%E5%A0%B4%E5%90%88)

## 環境

```console
% sw_vers
ProductName:    macOS
ProductVersion: 12.4
BuildVersion:   21F79

% clang --version
Apple clang version 13.1.6 (clang-1316.0.21.2.5)
Target: arm64-apple-darwin21.5.0
Thread model: posix
InstalledDir: /Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin
```
