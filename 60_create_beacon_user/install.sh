#!/bin/bash
set -e

useradd --no-create-home --shell /bin/false lighthousebeacon || true # ignore error if user already exists
mkdir -p /var/lib/lighthouse/beacon-node
chown -R lighthousebeacon:lighthousebeacon /var/lib/lighthouse/beacon-node
