#!/bin/bash
set -e

useradd --no-create-home --shell /bin/false ethereum_metrics_exporter || true # ignore error if user already exists
