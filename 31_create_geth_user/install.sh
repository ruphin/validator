#!/bin/bash
set -e

useradd --no-create-home --shell /bin/false geth || true # ignore error if user already exists
mkdir -p /var/lib/geth/
chown -R geth:geth /var/lib/geth
