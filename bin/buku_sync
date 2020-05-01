#!/bin/sh

set -e

cd "$HOME"/.local/share/buku
git pull
git commit -a -m "$(date --iso-8601='minutes')"
git push
