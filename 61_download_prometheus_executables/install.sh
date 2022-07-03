#!/bin/bash
set -e

printf "Enter Prometheus version (x.y.z)\n> "
read version

printf "\nChoose architecture\n"
PS3="> "
select arch in "amd64" "arm64"; do
  break
done

curl -L "https://github.com/prometheus/prometheus/releases/download/v${version}/prometheus-${version}.linux-${arch}.tar.gz" \
  | tar xz -f - -C /tmp --strip-components 1 --wildcards --no-anchored "*/prometheus" "*/promtool" "*/consoles" "*/console_libraries"
