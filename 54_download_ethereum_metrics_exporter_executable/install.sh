#!/bin/bash
set -e

rm -rf /tmp/ethereum-metrics-exporter
git clone https://github.com/samcm/ethereum-metrics-exporter.git /tmp/ethereum-metrics-exporter

cd /tmp/ethereum-metrics-exporter && go build -o ethereum-metrics-exporter .
