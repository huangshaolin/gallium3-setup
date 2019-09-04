#!/bin/bash

for file in "$@"; do
    backup_dir="$(dirname "$file")/.backups"
    mkdir -p "${backup_dir}"
    cp "$file" "${backup_dir}/$(basename "$file").$(sha1sum "$file" | awk '{print $1}')"
done

