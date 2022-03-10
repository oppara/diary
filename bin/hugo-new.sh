#!/bin/bash
set -eu

WORKDIR=$(dirname "$(cd "$(dirname "$0")" && pwd)")

read -r -p "input slug > " slug
if [[ -z $slug ]]; then
  exit;
fi

post_dir=$(date +"posts/%Y/%m/${slug}")

arg="${post_dir}/index.md"
target_path="${WORKDIR}/content/${arg}"
target_dir="${WORKDIR}/content/${post_dir}"

if [[ -e "$target_path" ]]; then
  ${EDITOR:-vim} "$target_path"
  exit
fi

if [[ ! -d "$target_dir" ]]; then
  mkdir -p "$target_dir"
fi

TZ=Asia/Tokyo hugo new "$arg" --editor "${EDITOR:-vim}"
