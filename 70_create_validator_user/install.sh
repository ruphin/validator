#!/bin/bash
set -e

useradd --no-create-home --shell /bin/false lighthousevalidator || true # ignore error if user already exists
mkdir -p /var/lib/lighthouse/validator
chown -R lighthousevalidator:lighthousevalidator /var/lib/lighthouse/validator
