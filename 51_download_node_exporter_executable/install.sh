#!/bin/bash
set -e

printf "Enter Node Exporter version (x.y.z)\n> "
read version

printf "\nChoose architecture\n"
PS3="> "
select arch in "amd64" "arm64"; do
  break
done

curl -L "https://github.com/prometheus/node_exporter/releases/download/v${version}/node_exporter-${version}.linux-${arch}.tar.gz" \
  | tar xz -C /tmp --strip-components 1 --wildcards --no-anchored "*/node_exporter"
