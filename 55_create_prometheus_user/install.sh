#!/bin/bash
set -e

useradd --no-create-home --shell /bin/false prometheus || true # ignore error if user already exists
mkdir -p /var/lib/prometheus
chown -R prometheus:prometheus /var/lib/prometheus
