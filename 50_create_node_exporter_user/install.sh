#!/bin/bash
set -e

useradd --no-create-home --shell /bin/false node_exporter || true # ignore error if user already exists
