#!/bin/bash
  echo "Getting all releases"
  curl https://api.github.com/repos/awslabs/aws-shell/tags | jq -r .[].name > releases
  curl https://api.github.com/repos/awslabs/aws-shell/tags | jq -r .[].name | head -n1 > latest
