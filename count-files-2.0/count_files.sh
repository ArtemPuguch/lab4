#!/bin/bash

CONFIG_FILE="/etc/count_files.conf"
if [ -f "$CONFIG_FILE" ]; then
source "$CONFIG_FILE"
fi

TARGET_DIR="${1:-${TARGET_DIR:-/etc}}"

if [ ! -d "$TARGET_DIR" ]; then
echo "Помилка: Директорія $TARGET_DIR не існує!" >&2
exit 1
fi

echo "Аналіз директорії: $TARGET_DIR"
COUNT=$(find "$TARGET_DIR" -maxdepth 1 -type f | wc -l)
echo "Кількість звичайних файлів: $COUNT"
