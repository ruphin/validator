#!/bin/bash
set -e

add-apt-repository -y ppa:ethereum/ethereum
apt update
apt install ethereum
apt upgrade geth
