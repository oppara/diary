#!/bin/bash
set -eu

cd "$(dirname "$(cd "$(dirname "$0")" && pwd)")"

FILE=$(hugo list all | cut -f 1 -d, | sed -e '1d' | fzf)
if [[ -n "$FILE" ]]; then
  ${EDITOR:-vim} "$FILE"
fi

