#!/bin/bash
  echo "Getting all releases"
  curl https://api.github.com/repos/aws/aws-cli/tags | jq -r .[].name > releases
  curl https://api.github.com/repos/aws/aws-cli/tags | jq -r .[].name | head -n1 > latest
