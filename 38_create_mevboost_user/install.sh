#!/bin/bash
set -e

useradd --no-create-home --shell /bin/false mevboost || true # ignore error if user already exists
