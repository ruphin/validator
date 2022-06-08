#!/bin/bash
set -e

printf "Enter Lighthouse version (x.y.z)\n> "
read version

printf "\nChoose architecture\n"
PS3="> "
select arch in "x86_64" "aarch64"; do
  break
done

curl -L "https://github.com/sigp/lighthouse/releases/download/v${version}/lighthouse-v${version}-${arch}-unknown-linux-gnu.tar.gz" \
  | tar xz -C /tmp/
