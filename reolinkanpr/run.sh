#!/usr/bin/env bash
set -e

# Persist config, database, and logs across add-on restarts/updates
mkdir -p /data/config /data/data /data/logs

if [ ! -f /data/config/config.yaml ]; then
    cp /app/config.yaml.example /data/config/config.yaml
fi

rm -rf /app/data /app/logs
ln -sf /data/data /app/data
ln -sf /data/logs /app/logs
ln -sf /data/config/config.yaml /app/config.yaml

cd /app
exec python run.py
