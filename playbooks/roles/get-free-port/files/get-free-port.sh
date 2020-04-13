#!/bin/bash
while :; do PORT="`shuf -i 9000-9999 -n 1`"; ss -lpn | grep -q ":$PORT " || echo $PORT && break; done
