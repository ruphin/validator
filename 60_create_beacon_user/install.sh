#!/bin/bash

useradd --no-create-home --shell /bin/false lighthousebeacon
mkdir -p /var/lib/lighthouse/beacon-node
chown -R lighthousebeacon:lighthousebeacon /var/lib/lighthouse/beacon-node
