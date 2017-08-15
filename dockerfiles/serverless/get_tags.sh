#!/bin/bash
  echo "Getting all releases"
  curl https://api.github.com/repos/serverless/serverless/tags | jq -r .[].name | head -n10 | cut -d "v" -f 2 > releases
  curl https://api.github.com/repos/serverless/serverless/tags | jq -r .[].name | grep -v alpha | grep -v beta | grep -v pre | grep -v rc. |  head -n1 | cut -d "v" -f 2 > latest
