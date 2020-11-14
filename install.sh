#!/bin/bash

printf "\n*** INSTALLING ETH2 VALIDATOR ***\n";


for f in */install.sh; do
  len=$(expr ${#f} + 16);
  printf "\n=== RUNNING $f ===\n";
  printf '%0.s-' $(seq 1 $len);
  printf "\n\n";

  bash "$f" -H || exit;
  # printf '%0.s-' $(seq 1 $len);
  # printf "\n";
done

printf "\n*** INSTALLATION COMPLETE ***\n\n";