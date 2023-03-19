#!/bin/bash
set -e

printf "Enter mev-boost version (x.y.z)\n> "
read version

curl -L "https://github.com/flashbots/mev-boost/releases/download/v${version}/mev-boost_${version}_linux_amd64.tar.gz" \
  | tar xz -C /tmp/
