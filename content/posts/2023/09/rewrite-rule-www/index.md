---
title: "www ありなしの RewiteRule"
date: 2023-09-22T00:02:37+09:00
tags: ["apache", "rewite"]
---


## www ありの https のURLに統一

```apache
RewriteEngine on
RewriteCond %{HTTPS} off
RewriteRule ^(.*)$ https://%{HTTP_HOST}%{REQUEST_URI} [R=301,L]
RewriteCond %{HTTP_HOST} !^www\. [NC]
RewriteRule ^(.*)$ http://www.%{HTTP_HOST}/$1 [R=301,L]
```
## www なしの https のURLに統一

```apache
RewriteEngine on
RewriteCond %{HTTPS} off
RewriteRule ^(.*)$ https://%{HTTP_HOST}%{REQUEST_URI} [R=301,L]
RewriteCond %{HTTP_HOST} ^www\.(.*) [NC]
RewriteRule ^ http://%1%{REQUEST_URI} [L,R=301]
```
