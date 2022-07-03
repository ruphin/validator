#!/bin/bash
set -e

useradd --no-create-home --shell /bin/false prometheus_exporter || true # ignore error if user already exists
