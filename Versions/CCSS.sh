#!/bin/sh
printf '\033c\033]0;%s\a' Circuit game
base_path="$(dirname "$(realpath "$0")")"
"$base_path/CCSS.x86_64" "$@"
