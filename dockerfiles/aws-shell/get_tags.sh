#!/bin/bash
  echo "Getting all releases"
  curl https://api.github.com/repos/awslabs/aws-shell/tags | jq -r .[].name | grep -v reinvent-demo > releases
  curl https://api.github.com/repos/awslabs/aws-shell/tags | jq -r .[].name | grep -v reinvent-demo | head -n1 > latest
