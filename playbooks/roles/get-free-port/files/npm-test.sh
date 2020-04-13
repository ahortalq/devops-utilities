#!/bin/bash
export JS_TEST_PORT=`while :; do PORT="\`shuf -i 9000-9999 -n 1\`"; ss -lpn | grep -q ":$PORT " || echo $PORT && break; done`
export JS_COVERAGE_PORT=`while :; do PORT="\`shuf -i 9000-9999 -n 1\`"; ss -lpn | grep -q ":$PORT " || echo $PORT && break; done`
npm test
